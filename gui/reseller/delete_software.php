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
			`software_depot`
		FROM
			`web_software`
		WHERE
			`software_id` = ?
		AND
			`reseller_id` = ?
SQL_QUERY;
	$rs = exec_query($sql, $query, array($_GET['id'], $_SESSION['user_id']));
	if ($rs->RecordCount() != 1) {
		set_page_message(tr('Wrong software id.'));
		header('Location: software_upload.php');
	} else {
		if ($rs->fields['software_depot'] == "no") {
			$del_path = Config::get('GUI_SOFTWARE_DIR')."/".$_SESSION['user_id']."/".$rs->fields['software_archive']."-".$rs->fields['software_id'].".tar.gz";
			@unlink($del_path);
		}
		$update = "UPDATE `web_software_inst` SET `software_res_del` = 1 WHERE `software_id` = ?";
		$res = exec_query($sql, $update, array($rs->fields['software_id']));
		$delete="DELETE FROM `web_software` WHERE `software_id` = ? AND `reseller_id` = ?";
		$res = exec_query($sql, $delete, array($_GET['id'], $_SESSION['user_id']));
		set_page_message(tr('Software was deletet.'));
		header('Location: software_upload.php');
	}
} else {
	set_page_message(tr('Wrong software id.'));
	header('Location: software_upload.php');
}
?>