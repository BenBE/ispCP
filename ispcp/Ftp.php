<?php
/**
 * ispCP ω (OMEGA) a Virtual Hosting Control System
 *
 * @copyright 	2006-2010 by ispCP | http://isp-control.net
 * @version 	SVN: $Id$
 * @link 		http://isp-control.net
 * @author 		ispCP Team
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
 *
 * The Original Code is "ispCP - ISP Control Panel".
 *
 * The Initial Developer of the Original Code is ispCP Team.
 * Portions created by Initial Developer are Copyright (C) 2006-2010 by
 * isp Control Panel. All Rights Reserved.
 */

/**
 * ispCP FTP class. Common methods for administration of FTP related data
 *
 * @copyright 	2006-2010 by ispCP | http://isp-control.net
 * @author 		Thomas Wacker <thomas.wacker@ispcp.net>
 */
class ispcp_Ftp
{
	private static $instance = null;
	/**
	 * Instance of ispcp_Domain
	 * @var ispcp_Domain
	 */
	protected $domain;

	private function __construct() {}
	private function __clone() {}

	public static function getInstance()
	{
       if (self::$instance === null) {
           self::$instance = new self;
           self::$instance->initialize();
       }
       return self::$instance;
   	}

	private function initialize()
	{
		$this->domain = ispcp_Domain::getInstance();
	}

	public function getFtpUserGid($dmn_name, $ftp_user)
	{
		$db_ftp_group = Db_Table_ftp_group::getInstance();
		$rs = $db_ftp_group->selectRecordPk('gid, members', $dmn_name);

		if (count($rs) == 0) {
			// there is no such group. we'll need a new one.

			$domain = $this->domain->getDomainDefaultProps($_SESSION['user_id']);

			$db_ftp_group->insert(
				array(
					'groupname'	=> $dmn_name,
					'gid'		=> $domain['domain_gid'],
					'members'	=> $ftp_user
				)
			);

			// add entries in the quota tables
			// first check if we have it by one or other reason
			$db_quotalimits = Db_Table_quotalimits::getInstance();
			$cnt = $db_quotalimits->selectFieldPk('COUNT(`name`)', $domain['domain_name']);
			if ($cnt == 0) {
				// ok insert it
				if ($domain['domain_disk_limit'] == 0) {
					$dlim = 0;
				} else {
					$dlim = $domain['domain_disk_limit'] * 1024 * 1024;
				}

				$db_quotalimits->insert(
					array(
						'name'				=> $dmn_name,
						'quota_type'		=> 'group',
						'per_session'		=> 'false',
						'limit_type'		=> 'hard',
						'bytes_in_avail'	=> $dlim,
						'bytes_out_avail'	=> 0,
						'bytes_xfer_avail'	=> 0,
						'files_in_avail'	=> 0,
						'files_out_avail'	=> 0,
						'files_xfer_avail'	=> 0
					)
				);
			}

			return $domain['domain_gid'];
		} else {
			$ftp_gid = $rs['gid'];
			$members = $rs['members'];

			if (preg_match("/" . $ftp_user . "/", $members) == 0) {
				$members .= ",".$ftp_user;
			}
			
			$db_ftp_group->update(
				array(
					'members'	=> 	$members,
				),
				array(
					'gid'		=> $ftp_gid,
					'groupname'	=> $dmn_name
				)
			);

			return $ftp_gid;
		}
	}

	public function getFtpUserUid($dmn_name, $ftp_user, $ftp_user_gid)
	{
		$db_ftp_users = Db_Table_ftp_users::getInstance();
		$rs = $db_ftp_users->selectField(
			'uid',
			array(
				'userid'	=> $ftp_user,
				'gid'		=> $ftp_user_gid
			)
		);

		if (!empty($rs)) {
			ispcp_Front_Controller::message(tr('FTP account already exists!'));
			return -1;
		}

		$domain = $this->domain->getDomainDefaultProps($_SESSION['user_id']);

		return $domain['domain_uid'];
	}

	public function addFtpUser($dmn_name)
	{
		$username = mb_strtolower($_POST['username']);

		if (!ispcp_Validation::validateUsername($username)) {
			ispcp_Front_Controller::message(tr("Incorrect username length or syntax!"));
			return false;
		}

		// Set default values ($ftp_home may be overwritten if user
		// has specified a mount point)
		switch ($_POST['dmn_type']) {
			// Default moint point for a domain
			case 'dmn':
				$ftp_user = $username . Config::get('FTP_USERNAME_SEPARATOR') . $dmn_name;
				$ftp_home = Config::get('FTP_HOMEDIR') . '/'. $dmn_name;
				break;
			// Default mount point for an alias domain
			case 'als':
				$ftp_user = $username . Config::get('FTP_USERNAME_SEPARATOR') . $_POST['als_id'];
				$alias_mount_point = $this->domain->getAliasMountPoint($_POST['als_id']);
				$ftp_home = Config::get('FTP_HOMEDIR') . '/'. $dmn_name . $alias_mount_point;
				break;
			// Default mount point for a subdomain
			case 'sub':
				$ftp_user = $username . Config::get('FTP_USERNAME_SEPARATOR') . $_POST['sub_id'] . '.' . $dmn_name;
				$ftp_home = Config::get('FTP_HOMEDIR') . '/'. $dmn_name . '/' . $_POST['sub_id'];
				break;
			// Unknown domain type (?)
			default:
				ispcp_Front_Controller::message(tr('Unknown domain type'));
				return false;
				break;
		}

		// User-specified mount point
		if (isset($_POST['use_other_dir']) && $_POST['use_other_dir'] === 'on') {
			$ftp_vhome = $_POST['other_dir'];
			// Strip possible double-slashes
			$ftp_vhome = str_replace('//', '/', $ftp_vhome);
			// Check for updirs ".."
			$res = preg_match('/\.\./', $ftp_vhome);
			if ($res !== 0) {
				ispcp_Front_Controller::message(tr('Incorrect mount point length or syntax'));
				return false;
			}
			$ftp_home = Config::get('FTP_HOMEDIR') . '/'. $dmn_name . '/' . $ftp_vhome;
			// Strip possible double-slashes
			$ftp_home = str_replace('//', '/', $ftp_home);
			// Check for $ftp_vhome existence
			// Create a virtual filesystem
			$vfs = new vfs($dmn_name);
			// Check for directory existence
			$res = $vfs->exists($ftp_vhome);

			if (!$res) {
				ispcp_Front_Controller::message(tr('%s does not exist', $ftp_vhome));
				return false;
			}
		} // End of user-specified mount-point

		$ftp_gid = $this->getFtpUserGid($dmn_name, $ftp_user);
		$ftp_uid = $this->getFtpUserUid($dmn_name, $ftp_user, $ftp_gid);

		if ($ftp_uid == -1) return false;

		$ftp_shell = Config::get('CMD_SHELL');
		$ftp_passwd = ispcp_Common::cryptUserPassWithSalt($_POST['pass']);

		$db_ftp_users = Db_Table_ftp_users::getInstance();
		$db_ftp_users->insert(
			array(
				'userid'	=> $ftp_user,
				'passwd'	=> $ftp_passwd,
				'uid'		=> $ftp_uid,
				'gid'		=> $ftp_gid,
				'shell'		=> $ftp_shell,
				'homedir'	=> $ftp_home
			)
		);

		$domain_props = $this->domain->getDomainDefaultProps($_SESSION['user_id']);
		ispcp_Common::updateResellerCurrentProps($domain_props['domain_uid']);

		ispcp_Log::logMessage($_SESSION['user_logged'] . ': add new FTP account: '.$ftp_user);

		return true;
	}

	public function deleteFtpUser($ftp_id)
	{
		$db = Db_Table_ftp_users::getInstance();

		$dmn_name = $_SESSION['user_logged'];

		$ftp_name = $db->selectField(
			't1.`userid`',
			array(
				't1.`userid`'		=> $ftp_id,
				't1.`uid`'			=> array('=', 't2.`domain_gid`', 'raw'),
				't2.`domain_name`'	=> $dmn_name
			),
			array(
				'addfrom'	=> ' AS t1, `domain` AS t2'
			)
		);

		if (empty($ftp_name)) {
			return false;
		}

		$rec = $db->selectRecord(
			't1.userid',
			array(
				't1.`userid`'		=> $ftp_id,
				't1.`gid`'			=> array('=', 't2.`gid`', 'raw')
			),
			array(
				'addfrom'	=> ' AS t1, `ftp_group` AS t2'
			)
		);

		$ftp_gid = $rec['gid'];
		$ftp_members = $rec['members'];

		$a_members = explode(',', $ftp_members);
		$akey = array_search($ftp_gid, $a_members);
		if ($akey !== false) {
			unset($a_members[$akey]);
		}
		$members = implode(',', $a_members);

		$db_g = Db_Table_ftp_group::getInstance();
		if (count($a_members) == 0) {
			$db_g->deleteRecords(
				array(
					'gid'		=> $ftp_gid
				)
			);
		} else {
			$db_g->update(
				array(
					'members'	=> $members
				),
				array(
					'gid'		=> $ftp_gid
				)
			);
		}

		$db->deleteRecords(
			array(
				'userid'	=> $ftp_id
			)
		);

		$domain_props = $this->domain->getDomainDefaultProps($_SESSION['user_id']);
		ispcp_Common::updateResellerCurrentProps($domain_props['domain_uid']);

		ispcp_Log::logMessage($_SESSION['user_logged'].": deletes FTP account: ".$ftp_name);

		return true;
	}
}
