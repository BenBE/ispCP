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
	 * linux user id
	 */
	protected $domain_user_id = 0;
	/**
	 * file name of gpg encrypted domain package
	 */
	protected $archive = '';

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
		$this->archive = ARCHIVE_PATH.'/'.$this->domain_name.'.tar.gz.gpg';

		// untar and mysql can take a lot of time
		set_time_limit(0);
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

		if (!file_exists($this->archive)) {
			$this->addErrorMessage('Domain backup package file not found: '.$this->archive);
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

	/**
	 * Run the restore, main method
	 * @return boolean true = restore successful, false = see error messages
	 */
	public function runRestore()
	{
		$result = false;

		if ($this->initRestore()) {
			// TODO: runRestore()
			// don't forget sub_id in mail accounts!
		}

		return $result;
	}
}
