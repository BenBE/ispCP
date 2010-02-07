<?php
/**
 * ispCP ω (OMEGA) complete domain backup tool
 * Abstract BackupPackage controller
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

abstract class BackupPackage extends BaseController
{
	/**
	 * array of configuration data (multi associative)
	 */
	private $configurationData = array();
	/**
	 * password for archive
	 */
	protected $password = '';
	/**
	 * domain name (string)
	 */
	protected $domain_name = '';
	/**
	 * holds list of databases to dump
	 */
	private $databases = array();
	/**
	 * name of the configuration file
	 */
	private $config_file = '';

	public function __construct($domain_name, $password)
	{
		// make clean temp path for every call
		if (file_exists(BACKUP_TEMP_PATH)) {
			delTree(BACKUP_TEMP_PATH);
		}
		mkdir(BACKUP_TEMP_PATH, 0700, true);

		// create archive path for domain packages if not exist
		if (!file_exists(ARCHIVE_PATH)) {
			mkdir(ARCHIVE_PATH, 0700, true);
		}

		$this->password = $password;
		$this->domain_name = $domain_name;

		// tar and mysqldump can take a lot of time
		set_time_limit(0);
	}

	/**
	 * Destructor, clean up temp path on exit
	 */
	public function __destruct()
	{
		if (file_exists(BACKUP_TEMP_PATH)) {
			delTree(BACKUP_TEMP_PATH);
		}
	}

	abstract protected function initDomain();

	/**
	 * write complete serialized domain configuration data
	 */
	private function writeDomainConfig()
	{
		$result = true;

		$this->config_file = BACKUP_TEMP_PATH.'/config.ser';
		$fp = fopen($this->config_file, 'w');
		if ($fp) {
			fwrite($fp, serialize($this->configurationData));
			fclose($fp);
		} else {
			$result = false;
			$this->addErrorMessage('Could not create file '.$this->config_file);
		}

		return $result;
	}

	/**
	 * dump all databases of domain
	 */
	protected function dumpDomainDatabases()
	{
		$result = true;

		foreach ($this->databases as $type => $dbnames) {
			// currently only mysql...
			if ($type == 'mysql') {
				foreach ($dbnames as $dbname) {
					if (!$this->dumpMySQLDatabase($dbname)) {
						$result = false;
					}
				}
			}
		}

		return $result;
	}

	/**
	 * Dump single mysql database, store dump as .sql file in temp path
	 * @param string $dbname
	 */
	private function dumpMySQLDatabase($dbname)
	{
		$filename = BACKUP_TEMP_PATH.'/'.$dbname.'.sql';
		$cmd = 'mysqldump --user '.Config::get('DB_USER').' --password='.Config::get('DB_PASS').
			   ' '.$dbname.
			   ' >'.$filename;
		// TODO: Error handling
		$a = array();
		$this->shellExecute($cmd, $a);

		return true;
	}

	/**
	 * Create .tar.gz and protect by gpg symmetric encryption
	 */
	private function createDomainPackage()
	{
		// create .tar.gz
		$filename = ARCHIVE_PATH.'/'.$this->domain_name.'.tar.gz';
		// TODO: only htdocs?
		$cmd = 'tar czf '.$filename.' -C '.BACKUP_BASE_PATH.' tmp'.
				' -C '.ISPCP_VIRTUAL_PATH.' '.$this->domain_name.
				' --exclude=logs --exclude=phptmp --exclude=backups';

		// TODO: Error handling
		$a = array();
		$this->shellExecute($cmd, $a);

		// protect via gpg -c --passphrase ... file
		$cmd = 'gpg -c --passphrase '.$this->password.' '.$filename;
		// TODO: Error handling
		$a = array();
		$this->shellExecute($cmd, $a);

		// delete remaining .tar.gz
		unlink($filename);

		return true;
	}

	/**
	 * run packaging after initializing
	 */
	public function runPackager()
	{
		$result = $this->initDomain();
		if ($result) {
			// collect all data
			$this->setConfigData('domain',		$this->getDomainConfig());
			$this->setConfigData('subdomain',	$this->getSubDomainConfig());
			$this->setConfigData('email',		$this->getEMailConfig());
			$this->setConfigData('ftp',			$this->getFTPConfig());
			$this->setConfigData('alias',		$this->getDomainAliasConfig());
			$this->setConfigData('webuser',		$this->getWebUserConfig());
			$this->setConfigData('webgroup',	$this->getWebGroupConfig());
			$this->setConfigData('webaccess',	$this->getWebAccessConfig());
			$this->setConfigData('dns',			$this->getDNSConfig());
			$this->setConfigData('db',			$this->getDBConfig());
			$this->setConfigData('dbuser',		$this->getDBUserConfig());

			// First create configuration file. If successful, create database
			// dumps and create the complete domain package file
			$result = $this->writeDomainConfig();
			if ($result) {
				$result = $this->dumpDomainDatabases();
				if ($result) {
					$result = $this->createDomainPackage();
				}
			}
		}

		return $result;
	}

	/**
	 * set configuration data element
	 * @param string $area domain|email|alias|ftp|...
	 * @param array $data data of area
	 */
	protected function setConfigData($area, array $data)
	{
		$this->configurationData[$area] = $data;
	}

	/**
	 * register database for later dump
	 * @param string $type type of database (mysql, postgres, ...)
	 * @param string $db name of database
	 */
	protected function addDatabase($type, $db)
	{
		if (!isset($this->databases[$type])) {
			$this->databases[$type] = array();
		}
		$this->databases[$type][] = $db;
	}
}
