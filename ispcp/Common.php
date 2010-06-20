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
 * ispCP Common methods
 *
 * @copyright 	2006-2010 by ispCP | http://isp-control.net
 * @author 		Thomas Wacker <thomas.wacker@ispcp.net>
 */

class ispcp_Common
{
	/**
	 * Encrypts the FTP user password.
	 *
	 * @param string $data the password in clear text
	 * @return string the password encrypted with salt
	 */
	public static function cryptUserPassWithSalt($data) {
		$res = crypt($data, self::generateRandSalt());
		return $res;
	}

	/**
	 * Generates a random salt for passwords.
	 *
	 * @param int $min minimum ASCII char
	 * @param int $max maximum ASCII char
	 * @return string Salt for password
	 */
	public static function generateRandSalt($min = 46, $max = 126) {
		if (CRYPT_BLOWFISH == 2) {
			$length	= 13;
			$pre	= '$2$';
		} elseif (CRYPT_MD5 == 1) {
			$length	= 9;
			$pre	= '$1$';
		} elseif (CRYPT_EXT_DES == 1) {
			$length	= 9;
			$pre	= '';
		} elseif (CRYPT_STD_DES == 1) {
			$length	= 2;
			$pre	= '';
		}

		$salt = $pre;

		for ($i = 0; $i < $length; $i++) {
			$salt .= chr(mt_rand($min, $max));
		}

		return $salt;
	}

	/**
	 * Recalculate current_ properties of reseller
	 *
	 * @param int $reseller_id unique reseller identifiant
	 * @return array list of properties
	 */
	public static function recalcResellerCurrentProps($reseller_id)
	{
		// current_dmn_cnt = domain
		// current_sub_cnt = subdomain
		// current_als_cnt = domain_aliasses
		// current_mail_cnt = mail_users
		// current_ftp_cnt = ftp_users
		// current_sql_db_cnt = sql_database
		// current_sql_user_cnt = sql_user
		// current_disk_amnt = disk_space
		// current_traff_amnt = traffic
		$db = Db_Table_domain::getInstance();

		$delstatus = Config::get('ITEM_DELETE_STATUS');

		$rec = $db->selectRecord(
			"COUNT(`domain_id`) AS current_dmn_cnt,
			IFNULL(SUM(`domain_subd_limit`), 0) AS current_sub_cnt,
			IFNULL(SUM(`domain_alias_limit`), 0) AS current_als_cnt,
			IFNULL(SUM(`domain_mailacc_limit`), 0) AS current_mail_cnt,
			IFNULL(SUM(`domain_ftpacc_limit`), 0) AS current_ftp_cnt,
			IFNULL(SUM(`domain_sqld_limit`), 0) AS current_sql_db_cnt,
			IFNULL(SUM(`domain_sqlu_limit`), 0) AS current_sql_user_cnt,
			IFNULL(SUM(`domain_disk_limit`), 0) AS current_disk_amnt,
			IFNULL(SUM(`domain_traffic_limit`), 0) AS current_traff_amnt",
			array(
				'domain_created_id'	=> $reseller_id,
				'domain_status'		=> array('!=', $delstatus)
			)
		);

		if (count($rec) == 0) {
			$rec['current_dmn_cnt'] = 0;
			$rec['current_sub_cnt'] = 0;
			$rec['current_als_cnt'] = 0;
			$rec['current_mail_cnt'] = 0;
			$rec['current_ftp_cnt'] = 0;
			$rec['current_sql_db_cnt'] = 0;
			$rec['current_sql_user_cnt'] = 0;
			$rec['current_disk_amnt'] = 0;
			$rec['current_traff_amnt'] = 0;
		}

		return $rec;
	}

	/**
	 * Recalculate current_ properties of reseller
	 *
	 * @param int $reseller_id unique reseller identifiant
	 * @return void
	 */
	public static function updateResellerCurrentProps($reseller_id)
	{
		$db = Db_Table_reseller_props::getInstance();
		$db->update(
			self::recalcResellerCurrentProps($reseller_id),
			array(
				'reseller_id'			=> $reseller_id
			)
		);
	}

	/**
	 * Returns true if the request‘s "X-Requested-With" header
	 * contains "XMLHttpRequest".
	 *
	 * Note: jQuery and Prototype Javascript libraries sends this
	 * header with every Ajax request.
	 *
	 * @author Laurent Declercq (nuxwin) <laurent.declercq@ispcp.net>
	 * @Since r2587
	 * @return boolean TRUE if the request‘s "X-Requested-With" header
	 *  contains "XMLHttpRequest", FALSE otherwiser
	 *
	 * @todo Move to future Request class
	 */
	public static function isXhr() {
		if (isset($_SERVER['HTTP_X_REQUESTED_WITH']) &&
			stristr($_SERVER['HTTP_X_REQUESTED_WITH'], 'XMLHttpRequest') !== false) {
			return true;
		} else {
			return false;
		}
	}

	public static function getRemoteIP()
	{
		// TODO: X_FORWARDED_FOR
		if (isset($_SERVER['REMOTE_ADDR'])) {
			$client_ip = $_SERVER['REMOTE_ADDR'];
		} else {
			$client_ip = "unknown";
		}
		return $client_ip;
	}	
}

function tr($s)
{
	// TODO: tr
}
