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
			`reseller_id`,
			`software_archive`,
			`software_depot`
		FROM
			`web_software`
		WHERE
			`software_id` = ?
SQL_QUERY;
	$rs = exec_query($sql, $query, array($_GET['id']));
	if($rs->fields['software_depot'] == "yes") {
		$filename = Config::get('GUI_SOFTWARE_DEPOT_DIR')."/".$rs->fields['software_archive']."-".$rs->fields['software_id'].".tar.gz";
	}else{
		$filename = Config::get('GUI_SOFTWARE_DIR')."/".$rs->fields['reseller_id']."/".$rs->fields['software_archive']."-".$rs->fields['software_id'].".tar.gz";
	}
	if (file_exists($filename)) {
		header("Cache-Control: public, must-revalidate");
		header("Pragma: hack");
		header("Content-Type: application/octet-stream");
		header("Content-Length: " .(string)(filesize($filename)) );
		header('Content-Disposition: attachment; filename="'.basename($filename).'"');
		header("Content-Transfer-Encoding: binary\n");

		$fp = fopen($filename, 'rb');
		$buffer = fread($fp, filesize($filename));
		fclose ($fp);
		print $buffer;
	} else {
		set_page_message(tr('File does not exists.'.$filename));
		header('Location: manage_software.php');
	}
} else {
	set_page_message(tr('Wrong software id.'));
	header('Location: manage_software.php');
}
?>