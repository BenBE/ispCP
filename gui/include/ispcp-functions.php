<?php
/**
 * ispCP ω (OMEGA) a Virtual Hosting Control System
 *
 * @copyright 	2001-2006 by moleSoftware GmbH
 * @copyright 	2006-2010 by ispCP | http://isp-control.net
 * @version 	SVN: $ID$
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
 * The Original Code is "VHCS - Virtual Hosting Control System".
 *
 * The Initial Developer of the Original Code is moleSoftware GmbH.
 * Portions created by Initial Developer are Copyright (C) 2001-2006
 * by moleSoftware GmbH. All Rights Reserved.
 * Portions created by the ispCP Team are Copyright (C) 2006-2010 by
 * isp Control Panel. All Rights Reserved.
 */

function check_for_lock_file() {

	UtilityManager::checkForLockFile();
	
}

function send_request() {
	
	UtilityManager::sendRequest();
	
}

function update_expire_date ( $user_id, $domain_new_expire ) {

	UtilityManager::updateExpireDate($user_id, $domain_new_expire, Database::getInstance());
}

function update_user_props($user_id, $props) {

	$sql = Database::getInstance();

	list(
		$sub_current,
		$sub_max,
		$als_current,
		$als_max,
		$mail_current,
		$mail_max,
		$ftp_current,
		$ftp_max,
		$sql_db_current,
		$sql_db_max,
		$sql_user_current,
		$sql_user_max,
		$traff_max,
		$disk_max,
		$domain_php,
		$domain_cgi,
		$domain_dns
	) = explode (";", $props);

	// have to check if PHP and/or CGI and/or IP change
	$domain_last_modified = time();

	$query = "
		SELECT
			`domain_name`
		FROM
			`domain`
		WHERE
			`domain_id` = ?
		AND
			`domain_php` = ?
		AND
			`domain_cgi` = ?
		AND
			`domain_dns` = ?
	";

	$rs = exec_query($sql, $query, array($user_id, $domain_php, $domain_cgi, $domain_dns));

	if ($rs->RecordCount() == 0) {
		// mama mia, we have to rebuild the system entry for this domain
		// and also all domain alias and subdomains

		$update_status = Config::get('ITEM_CHANGE_STATUS');

		// check if we have to wait some system update
		check_for_lock_file();
		// ... and go update

		// update the domain
		$query = "
			UPDATE
				`domain`
			SET
				`domain_last_modified` = ?,
				`domain_mailacc_limit` = ?,
				`domain_ftpacc_limit` = ?,
				`domain_traffic_limit` = ?,
				`domain_sqld_limit` = ?,
				`domain_sqlu_limit` = ?,
				`domain_status` = ?,
				`domain_alias_limit` = ?,
				`domain_subd_limit` = ?,
				`domain_disk_limit` = ?,
				`domain_php` = ?,
				`domain_cgi` = ?,
				`domain_dns` = ?
			WHERE
				`domain_id` = ?
		";

		$rs = exec_query(
			$sql,
			$query,
			array(
				$domain_last_modified,
				$mail_max,
				$ftp_max,
				$traff_max,
				$sql_db_max,
				$sql_user_max,
				$update_status,
				$als_max,
				$sub_max,
				$disk_max,
				$domain_php,
				$domain_cgi,
				$domain_dns,
				$user_id
			)
		);

		// let's update all alias domains for this domain

		$query = "
			UPDATE
				`domain_aliasses`
			SET
				`alias_status` = ?
			WHERE
				`domain_id` = ?
		";
		$rs = exec_query($sql, $query, array($update_status, $user_id));

		// let's update all subdomains for this domain
		$query = "
			UPDATE
				`subdomain`
			SET
				`subdomain_status` = ?
			WHERE
				`domain_id` = ?
		";
		$rs = exec_query($sql, $query, array($update_status, $user_id));

		// let's update all alias subdomains for this domain
		$query = "
			UPDATE
				`subdomain_alias`
			SET
				`subdomain_alias_status` = ?
			WHERE
				`alias_id` IN (SELECT `alias_id` FROM `domain_aliasses` WHERE `domain_id` = ?)
		";
		$rs = exec_query($sql, $query, array($update_status, $user_id));

		// and now we start the daemon
		send_request();

	} else {

		// we do not have IP and/or PHP and/or CGI changes
		// we have to update only the domain props and not
		// to rebuild system entries

		$query = "
			UPDATE
				`domain`
			SET
				`domain_subd_limit` = ?,
				`domain_alias_limit` = ?,
				`domain_mailacc_limit` = ?,
				`domain_ftpacc_limit` = ?,
				`domain_sqld_limit` = ?,
				`domain_sqlu_limit` = ?,
				`domain_traffic_limit` = ?,
				`domain_disk_limit` = ?
			WHERE
				domain_id = ?
		";

		$rs = exec_query(
			$sql,
			$query,
			array(
				$sub_max,
				$als_max,
				$mail_max,
				$ftp_max,
				$sql_db_max,
				$sql_user_max,
				$traff_max,
				$disk_max,
				$user_id
			)
		);
	}
}

/* end */

function escape_user_data($data) {

	$res_one = preg_replace("/\\\\/", "", $data);
	$res = preg_replace("/'/", "\\\'", $res_one);
	return $res;

}

function array_decode_idna($arr, $asPath = false) {
	if ($asPath && !is_array($arr)) {
		return implode('/', array_decode_idna(explode('/', $arr)));
	}

	foreach ($arr as $k => $v) {
		$arr[$k] = decode_idna($v);
	}
	return $arr;
}

function array_encode_idna($arr, $asPath = false) {

	if ($asPath && !is_array($arr)) {
		return implode('/', array_encode_idna(explode('/', $arr)));
	}

	foreach ($arr as $k => $v) {
		$arr[$k] = encode_idna($v);
	}
	return $arr;
}

function decode_idna($input) {
	if (function_exists('idn_to_unicode')) {
		return idn_to_unicode($input, 'utf-8');
	}

	$IDN = new idna_convert();
	$output = $IDN->decode($input);

	return ($output == false) ? $input : $output;
}

function encode_idna($input) {
	if (function_exists('idn_to_ascii')) {
		return idn_to_ascii($input, 'utf-8');
	}

	$IDN = new idna_convert();
	$output = $IDN->encode($input);
	return $output;
}

function strip_html($input) {
	$output = htmlspecialchars($input, ENT_QUOTES, "UTF-8");
	return $output;
}

function is_number($integer) {
	if (preg_match('/^[0-9]+$/D', $integer)) {
		return true;
	}
	return false;
}

function is_basicString($string) {
	if (preg_match('/^[\w\-]+$/D', $string)) {
		return true;
	}
	return false;
}

/**
 * @todo please add a descrition for this function
 */
function unset_messages() {

	UtilityManager::unsetMessages();
}
