<?php
/**
 * ispCP ω (OMEGA) complete domain backup/restore tool
 * Restore controller
 *
 * @copyright 	2010 Thomas Wacker
 * @author 		Thomas Wacker <zuhause@thomaswacker.de>
 *
 * @license
 * The contents of this file are subject to the Mozilla Public License
 * Version 1.1 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
 * License for the specific language governing rights and limitations
 * under the License.
 */

/**
 * ispCP restore packager main class
 */
class RestorePackage_ispCP extends BaseController
{
	/**
	 * Instance of ispCP Database
	 */
	public $db = null;
	/**
	 * domain name (string)
	 */
	protected $domain_name;
	/**
	 * password for archive
	 */
	protected $password;
	/**
	 * IP address or false for default IP address
	 */
	protected $ip;
	/**
	 * ID of server_ips
	 */
	protected $ip_id = -1;
	/**
	 * Reseller name or false for first reseller
	 */
	protected $reseller;
	/**
	 * ID of reseller
	 */
	protected $reseller_id = -1;
	/**
	 * New domain ID
	 */
	protected $domain_id = 0;
	/**
	 * linux user id
	 */
	protected $domain_user_id = 0;
	/**
	 * file name of gpg encrypted domain package
	 */
	protected $gpg_archive = '';
	/**
	 * file name of tar.gz
	 */
	protected $archive = '';
	/**
	 * array of configuration data (multi associative)
	 */
	protected $configurationData = array();
	/**
	 * database IDs (key = database name)
	 */
	protected $database_ids = array();
	/**
	 * new subdomain IDs (key = database name)
	 */
	protected $subdomain_ids = array();

	/**
	 * Restore packager
	 * @param string $domain_name
	 * @param string $password password for gpg symmetric decryption
	 * @param mixed $option_ip false or string of target IP address
	 * @param mixed $option_reseller false or string of reseller name
	 */
	public function __construct($domain_name, $password, $option_ip, $option_reseller)
	{
		$this->password = $password;
		$this->domain_name = $domain_name;
		$this->db = Database::getInstance();
		$this->ip = $option_ip;
		$this->reseller = $option_reseller;
		$this->gpg_archive = ARCHIVE_PATH.'/'.$this->domain_name.'.tar.gz.gpg';
		$this->archive = mb_substr($this->gpg_archive, 0, mb_strlen($this->gpg_archive)-4);
		$this->target_path = ISPCP_VIRTUAL_PATH.'/'.$this->domain_name;

		// untar and mysql can take a lot of time
		set_time_limit(0);
	}

	/**
	 * Destructor, clean up tmp folder and .tar.gz on exit
	 */
	public function __destruct()
	{
		if (file_exists($this->target_path.'/tmp')) {
			delTree($this->target_path.'/tmp');
		}
		if (file_exists($this->archive)) {
			unlink($this->archive);
		}
	}

	/**
	 * Set permissions to vhost directory
	 */
	protected function setDomainPermissions()
	{
		// TODO: setDomainPermissions (chown)
	}

	/**
	 * Get ID of first server IP
	 * @return integer ID of IP
	 */
	protected function getDefaultIPID()
	{
		$result = -1;

		$sql = "SELECT `ip_id` FROM `server_ips` ORDER BY `ip_id` LIMIT 0, 1";
		$query = $this->db->Prepare($sql);
		$rs = $this->db->Execute($query);
		if ($rs && !$rs->EOF) {
			$result = $rs->fields['ip_id'];
		} else {
			$this->addErrorMessage('No IPs found!?');
		}

		return $result;
	}

	/**
	 * Get ID of first reseller
	 * @return integer ID of reseller
	 */
	protected function getDefaultResellerID()
	{
		$result = -1;

		$sql = "SELECT `admin_id` FROM `admin` WHERE `admin_type` = :admin_type" .
			   " ORDER BY `admin_id` LIMIT 0, 1";
		$query = $this->db->Prepare($sql);
		$rs = $this->db->Execute($query, array(':admin_type'=>'reseller'));
		if ($rs && !$rs->EOF) {
			$result = $rs->fields['admin_id'];
		} else {
			$this->addErrorMessage('No resellers found!?');
		}

		return $result;
	}

	/**
	 * Get ID of reseller name
	 * @param string $reseller name of reseller (e.g. 'res1')
	 * @return integer ispCP database ID of reseller
	 */
	protected function getResellerID($reseller)
	{
		$result = -1;

		$sql = "SELECT `admin_id` FROM `admin` WHERE `admin_type` = :admin_type" .
			   " AND `admin_name` = :name" .
			   " ORDER BY `admin_id` LIMIT 0, 1";
		$query = $this->db->Prepare($sql);
		$rs = $this->db->Execute($query, array(':admin_type'=>'reseller', ':name'=>$reseller));
		if ($rs && !$rs->EOF) {
			$result = $rs->fields['admin_id'];
		} else {
			$this->addErrorMessage('Reseller not found: '.$reseller);
		}

		return $result;
	}

	/**
	 * Get ID of IP
	 * @param string $ip IP address
	 * @return integer ispCP database ID of IP
	 */
	protected function getIPID($ip)
	{
		$result = -1;

		$sql = "SELECT `ip_id` FROM `server_ips` WHERE `ip_number`=:ip LIMIT 0, 1";
		$query = $this->db->Prepare($sql);
		$rs = $this->db->Execute($query, array('ip'=>$ip));
		if ($rs && !$rs->EOF) {
			$result = $rs->fields['ip_id'];
		} else {
			$this->addErrorMessage('IP not found: '.$ip);
		}

		return $result;
	}

	/**
	 * Validate presence of gpg encrypted archive, get ID of IP and reseller
	 */
	protected function initRestore()
	{
		$result = false;

		if (!file_exists($this->gpg_archive)) {
			$this->addErrorMessage('Domain backup package file not found: '.$this->gpg_archive);
		} else {
			// IP detection
			if ($this->ip === false) {
				$this->ip_id = $this->getDefaultIPID();
			} else {
				$this->ip_id = $this->getIPID($this->ip);
			}

			// Reseller detection
			if ($this->reseller === false) {
				$this->reseller_id = $this->getDefaultResellerID();
			} else {
				$this->reseller_id = $this->getResellerID($this->reseller);
			}

			if ($this->ip_id != -1 && $this->reseller_id != -1) {
				$result = true;
			}
		}

		return $result;
	}

	protected function unpackDomainPackage()
	{
		$reuslt = false;

		// unprotect via gpg -c --passphrase ... file
		$cmd = 'gpg --passphrase '.$this->password.' '.$this->gpg_archive;
		$a = array();
		$this->shellExecute($cmd, $a);

		if (file_exists($this->archive)) {

			if (!file_exists($this->target_path)) {
				mkdir($this->target_path, 0770, true);
			}

			$cmd = 'tar xzf -C '.$this->target_path.' '.$this->archive;
			$this->shellExecute($cmd, $a);

			if (file_exists($this->target_path.'/tmp/config.ser')) {
				$result = true;
			} else {
				$this->addErrorMessage('File not found: '.$this->target_path.'/tmp/config.ser');
			}

			$result = true;
		} else {
			$this->addErrorMessage('File not found: '.$this->archive.' - incorrect password?');
		}

		return $result;
	}

	protected function getConfigData()
	{
		$result = false;

		$config_file = $this->target_path.'/tmp/config.ser';

		$fp = fopen($config_file, 'w');
		if ($fp) {
			$s = fread($fp, filesize($config_file));
			$this->configurationData = unserialize($s);
			fclose($fp);

			if (is_array($this->configurationData) && count($this->configurationData) > 0) {
				$result = true;
			} else {
				$this->addErrorMessage('Broken file '.$config_file);
			}

		} else {
			$this->addErrorMessage('Could not open file '.$config_file);
		}

		return $result;
	}

	/**
	 * Create all databases
	 */
	protected function createDatabases()
	{
		foreach ($this->configurationData['db'] as $db) {
			$this->importMySQLDatabase($db['sqld_name']);

			// Insert database row into ispCP database
			$query = $this->db->Prepare(
				"INSERT INTO `sql_database`".
				" (`domain_id`, `sqld_name`)".
				" VALUES".
				" (?, ?)"
			);
			$this->db->Execute($query, array($this->domain_id, $db['sqld_name']));
			$this->database_ids[$db['sqld_name']] = $this->db->Insert_ID();
		}
	}

	/**
	 * Import single mysql database
	 * @param string $dbname
	 */
	private function importMySQLDatabase($dbname)
	{
		$query = $this->db->Prepare("CREATE DATABASE " . quoteIdentifier($dbname));
		$this->db->Execute($query);

		$filename = $this->target_path.'/tmp/'.$dbname.'.sql';
		$cmd = 'mysql --user '.Config::get('DB_USER').' --password='.Config::get('DB_PASS').
			   ' '.$dbname.
			   ' <'.$filename;
		// TODO: Error handling
		$a = array();
		$this->shellExecute($cmd, $a);

		return true;
	}

	/**
	 * Create MySQL database users
	 */
	protected function createDatabaseUsers()
	{
		foreach ($this->configurationData['dbuser'] as $dbuser) {
			$this->createDatabaseUser($dbuser['database'], $dbuser['sqlu_name'], $dbuser['sqlu_pass']);

			// Insert database row into ispCP database
			$query = $this->db->Prepare(
				"INSERT INTO `sql_user`".
				" (`sqld_id`, `sqlu_name`, `sqlu_pass`)".
				" VALUES".
				" (:sqld_id, :sqlu_name, :sqlu_pass)"
			);
			$this->db->Execute($query, array(
				'sqld_id'=>$this->database_ids[$dbuser['database']],
				'sqlu_name'=>$dbuser['sqlu_name'],
				'sqlu_pass'=>encrypt_db_password($dbuser['sqlu_pass'])
			));
		}
	}

	/**
	 * Create database user with all privileges to database
	 * @param string $db_name database name
	 * @param string $db_user database user name
	 * @param string $user_pass password of database user
	 */
	private function createDatabaseUser($db_name, $db_user, $user_pass)
	{
		$query = $this->db->Prepare(
			"GRANT ALL PRIVILEGES ON ". quoteIdentifier($db_name) .
			".* TO :dbuser IDENTIFIED BY :dbpass"
		);
		$this->db->Execute($query, array(
			'dbuser'=>$db_user.'@localhost',
			'dbpass'=>$user_pass
		));
		$this->db->Execute($query, array(
			'dbuser'=>$db_user.'@%',
			'dbpass'=>$user_pass
		));
	}

	/**
	 * Create domain, sets $this->domain_user_id and $this->domain_id
	 * @return boolean true = creation successful
	 */
	protected function createDomain()
	{
		$result = false;

		// TODO: createDomain()
		// TODO: set domain_id
		$this->createDomainAliases();
		$this->createSubDomains();

		// TODO: wait until daemon is ready
		// TODO: set domain_user_id

		return $result;
	}

	protected function createDomainAliases()
	{
		// TODO: createDomainAliases
	}

	protected function createSubDomains()
	{
		// TODO: createSubDomains
	}

	protected function createEMailAccounts()
	{
		// TODO: createEMailAccounts
	}

	protected function createFTPAccounts()
	{
		// TODO: createFTPAccounts
	}

	protected function createWebUsers()
	{
		// TODO: createWebUsers
	}

	protected function createWebGroups()
	{
		// TODO: createWebGroups
	}

	/**
	 * Run the restore, main method
	 * TODO: don't forget sub_id in mail accounts!
	 * @return boolean true = restore successful, false = see error messages
	 */
	public function runRestore()
	{
		$result = false;

		if ($this->initRestore()) {
			if ($this->unpackDomainPackage()) {
				if ($this->getConfigData()) {

					if ($this->createDomain()) {
						$this->createDNSEntries();
						$this->createDatabases();
						$this->createDBUsers();
						$this->createEMailAccounts();
						$this->createWebUsers();
						$this->createWebGroups();
						$this->setDomainPermissions();

						$e = $this->getErrorMessages();
						$result = (count($e) == 0);
					}
				}
			}
		}

		return $result;
	}
}
