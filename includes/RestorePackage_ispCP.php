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
	 * linux user id
	 */
	protected $domain_user_id = 0;

	public function __construct($domain_name, $password, $specific_ip)
	{
		$this->password = $password;
		$this->domain_name = $domain_name;
		$this->db = Database::getInstance();
		$this->ip = $specific_ip;
	}

	private function setDomainPermissions()
	{
		// TODO: setDomainPermissions (chown)
	}

	/**
	 * Get ID of first server IP
	 * @return integer ID of IP
	 */
	private function getDefaultIP()
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
	 * Get ID of specific IP
	 * @param string $ip IP address
	 * @return integer ID of IP
	 */
	private function getSpecificIP($ip)
	{
		$result = -1;

		$sql = "SELECT `ip_id` FROM `server_ips` WHERE `ip_number`=:ip LIMIT 0, 1";
		$query = $this->db->Prepare($sql);
		$rs = $this->db->Execute($query, array('ip'=>$ip));
		if ($rs && !$rs->EOF) {
			$result = $rs->fields['ip_id'];
		} else {
			$this->addErrorMessage('IP not found!?');
		}

		return $result;
	}

	public function runRestore()
	{
		$result = false;

		// IP detection
		if ($this->ip === false) {
			$this->ip_id = $this->getDefaultIP();
		} else {
			$this->ip_id = $this->getSpecificIP($this->ip);
		}

		if ($this->ip_id != -1) {
			// TODO: got IP ID, go on...
		}

		return $result;
	}
}
