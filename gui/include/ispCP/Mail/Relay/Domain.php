<?php
/**
 * ispCP ω (OMEGA) a Virtual Hosting Control System
 *
 * The contents of this file are subject to the Mozilla Public License
 * Version 1.1 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
 * License for the specific language governing rights and limitations
 * under the License.
 *
 * The Original Code is "ispCP - ISP Control Panel".
 *
 * The Initial Developer of the Original Code is ispCP Team.
 * Portions created by Initial Developer are Copyright (C) 2006-2010 by
 * isp Control Panel. All Rights Reserved.
 *
 * @category    ispCP
 * @package     ispCP_Mail
 * @subpackage  Relay_Domains
 * @copyright   2006-2010 by ispCP | http://isp-control.net
 * @author      Laurent Declercq <laurent.declercq@ispcp.net>
 * @version     SVN: $Id$
 * @link        http://isp-control.net ispCP Home Site
 * @license     http://www.mozilla.org/MPL/ MPL 1.1
 */

/**
 * Relay domain class
 *
 * Purpose: mail forwarding to remote destinations that list your system as
 * primary or backup MX host.
 *
 * @package     ispCP_Mail
 * @subpackage  Relay_Domains
 * @since       1.0.7 (rc3)
 * @author      Laurent Declercq <laurent.declercq@ispcp.net>
 * @version     1.0.0
 */
class ispCP_Mail_Relay_Domain {

	/**
	 * Configuration parameters that are stored in database
	 *
	 * @var ispCP_Config_Handler_db
	 */
	private $dbConfig;

	/**
	 * Map used for relay domains where the key is the domain unique identifier
	 * for which the mails must be forwarded to a remote destination and the
	 * value the corresponding MX hostname.
	 *
	 * @var array Relay domains map
	 */
	private $relayDomainsMap = array();

	/**
	 *  Domain id for which the mails must be forwarded to a remote destination
	 *
	 *  @var int Domain unique identifier
	 */
	private $domainId;

	/**
	 *  Domain name
	 *
	 *  @var string
	 */
	private $domainName;

	/**
	 * Last error occurred
	 *
	 * @var string
	 */
	public $error = '';

	/**
	 * Constructor
	 *
	 * @throws ispCP_Exception
	 * @param  $domain Domain unique identifier
	 * @return void
	 */
	public function __construct($domainId) {

		/**
		 * @var $db ispCP_Database_ResultSet
		 */
		$db = ispCP_Registry::get('Db');

		$this->domainId = (int) $domainId;

		$stmt = exec_query(
			$db, 'SELECT `domain_name` FROM `domain` WHERE `domain_id` = ?;',
			$this->domainId
		);

		if(!$stmt->recordCount()) {
			throw new ispCP_Exception(tr('Error: Domain not registered!'));
		} else {
			$this->domainName = $stmt->fields['domain_name'];
		}

		/**
		 * @var $dbConfig ispCP_Config_Handler_db
		 */
		$this ->dbConfig = ispCP_Registry::get('Db_Config');

		if($this->dbConfig->exists('RELAY_DOMAINS_MAP')) {
			$this->relayDomainsMap = unserialize(
				$this->dbConfig->RELAY_DOMAINS_MAP
			);
		}
	}

	/**
	 * Adds an entry in the relay domains map and the associated DNS MX record
	 *
	 * @param int $domainId Domain name identifier
	 * @param bool $checkMX Tell whether or not MX Hostname must be checked
	 * @return bool TRUE on success, FALSE otherwise
	 * @todo Possibility to add more than one mxHostname
	 */
	public function setEntry($mxHostname, $checkMX = true) {

		if($checkMX && !$this->_checkMxHostname($mxHostname)) {
			return false;
		}

		$action = array_key_exists($this->domainId, $this->relayDomainsMap)
			? 'updt' : 'add';

		$this->relayDomainsMap[$this->domainId] = $mxHostname;
		return $this->_updateDb($action);
	}

	/**
	 * Delete an entry from the relay domains map and the associated DNS MX record
	 *
	 * @return boolean TRUE on success, FALSE otherwise
	 */
	public function unsetEntry() {

		unset($this->relayDomainsMap[$this->domainId]);
		return $this->_updateDb('del');
	}

	/**
	 * Checks if the domain messages are forwarded to a remote destination
	 *
	 * @return bool TRUE if forwarded, FALSE otherwise
	 */
	public function isForwarded() {

		return array_key_exists($this->domainId, $this->relayDomainsMap);
	}

	/**
	 * Gets the MX Hostname associated to the domain
	 *
	 * @return string MX hostname or empty string if not set
	 */
	public function getMxHostname() {

		if($this->isForwarded()) {
			return $this->relayDomainsMap[$this->domainId];
		} else {
			return '';
		}
	}

	/**
	 * Checks for the MaileXchanger hostname
	 *
	 * This method does the following checks:
	 * - Checks that a DNS A or AAAA record exists for the specified hostname
	 * - Checks that the hostname is not hosted locally
	 * - Checks that a mail server is reachable by trying connection on port 25
	 *
	 * @param string $mxHostname MX Hostname
	 * @return boolean True if the MX hostname is valid, FALSE otherwise
	 */
	private function _checkMxHostname($mxHostname) {

		/**
		 * @var $cfg ispCP_Config_Handler_File
		 */
		$cfg = ispCP_Registry::get('Config');

		if(!($records = dns_get_record($mxHostname, DNS_A)) &&
			!($records = dns_get_record($mxHostname, DNS_AAAA))) {

			$this->error = tr(
				'Error: Unable to resolve the hostname: `%s`!', $mxHostname
			);
	
			return false;
		}

		/**
		 * @var $sql ispCP_Database
		 */
		$db = ispCP_Registry::get('Db');

		$stmt = execute_query($db, 'SELECT `ip_number` FROM `server_ips`;');
		$Ips = $stmt->fetchRow();

		if((isset($records[0]['ip']) && in_array($records[0]['ip'], $Ips)) ||
			in_array($records[0]['ipv6'], $Ips)) {

			$this->error = tr('Error: Unallowed MX hostname!');

			return false;
		} elseif(!@fsockopen($mxHostname, 25)) {
			$this->error = tr(
				"Error: Mail server '%s' is not reachable on port 25!",
				$mxHostname
			);

			return false;
		}

		return true;
    }

	/**
	 * Add/Update/Delete data in database
	 *
	 * - Add/update/Delete a entry into the RELAY_DOMAIN_MAP
	 * - Add/Update/Delete the associated DNS MX record
	 *
	 * @param string $action Action to be performed on the database
	 * @return boolean TRUE on success, FALSE otherwise
	 */
	private function _updateDb($action) {

		/**
		 * @var $db ispCP_Database
		 */
		$db = ispCP_Registry::get('Db');

		if($action == 'add') {
			$query = "
				INSERT INTO `domain_dns` (
					`domain_id`, `alias_id`, `domain_dns`, `domain_class`,
					`domain_type`, `domain_text`, `protected`
				) VALUES (?, ?, ?, ?, ?, ?, ?);
			";

			$p = array(
				$this->domainId, '0', "{$this->domainName}.", 'IN', 'MX',
				"5 {$this->relayDomainsMap[$this->domainId]}.", 'yes'
			);
		} elseif($action == 'updt') {
			$query = "
				UPDATE `domain_dns` SET `domain_text` = ?
				WHERE `domain_id` = ? AND `domain_type` = ? AND `protected` = ?;
			";

			$p = array(
				"5 {$this->relayDomainsMap[$this->domainId]}.", $this->domainId,
				'MX', 'yes'
			);
		} elseif($action == 'del') {
			$query = "
				DELETE FROM `domain_dns` WHERE `domain_id` = ?
				AND `domain_type` = ? AND `protected` = ?;
			";

			$p = array($this->domainId, 'MX', 'yes');
		}

		if(exec_query($db, $query, $p)) {
			if(!empty($this->relayDomainsMap)) {
				$this->dbConfig->RELAY_DOMAINS_MAP = serialize(
					$this->relayDomainsMap
				);
			} else {
				$this->dbConfig->del('RELAY_DOMAINS_MAP');
			}

			return true;
		}

		return false;
	}
} // End class
