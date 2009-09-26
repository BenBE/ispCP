<?php
/**
 * ispCP ω (OMEGA) a Virtual Hosting Control System
 *
 * @copyright 	2001-2006 by moleSoftware GmbH
 * @copyright 	2006-2007 by ispCP | http://isp-control.net
 * @link 		http://isp-control.net
 * @author 		ispCP Team (2007)
 *
 * @license
 *   This program is free software; you can redistribute it and/or modify it under
 *   the terms of the MPL General Public License as published by the Free Software
 *   Foundation; either version 1.1 of the License, or (at your option) any later
 *   version.
 *   You should have received a copy of the MPL Mozilla Public License along with
 *   this program; if not, write to the Open Source Initiative (OSI)
 *   http://opensource.org | osi@opensource.org
 */

require '../include/ispcp-lib.php';

check_login(__FILE__);

if (isset($_GET['id']) AND is_numeric($_GET['id'])) {
	$query=<<<SQL_QUERY
		SELECT
			`software_id`,
			`software_archive`,
			`reseller_id`
		FROM
			`web_software`
		WHERE
			`software_id` = ?
		AND
			`software_active` = 0
SQL_QUERY;
	$rs = exec_query($sql, $query, array($_GET['id']));
	if ($rs->RecordCount() != 1) {
		set_page_message(tr('Wrong software id.'));
		header('Location: manage_software.php');
	} else {
		$update="UPDATE `web_software` SET `software_active` = 1 WHERE `software_id` = ?";
		$res = exec_query($sql, $update, array($_GET['id']));
		$query=<<<SQL_QUERY
		SELECT
			`software_id`,
			`reseller_id`,
			`software_archive` 
		FROM
			`web_software`
		WHERE
			`software_id` = ?
SQL_QUERY;
		$res = exec_query($sql, $query, array($_GET['id']));
		$reseller_id = $res->fields['reseller_id'];
		send_activated_sw (
						$res->fields['reseller_id'],
						$res->fields['software_archive'].".tar.gz",
						$res->fields['software_id']
						);
		
		set_page_message(tr('Software was activated.'));
		header('Location: manage_software.php');
	}
} else {
	set_page_message(tr('Wrong software id.'));
	header('Location: manage_software.php');
}
?>