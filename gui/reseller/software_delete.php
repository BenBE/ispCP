<?php
require '../include/ispcp-lib.php';

check_login(__FILE__);

$cfg = ispCP_Registry::get('Config');

if (isset($_GET['id']) AND is_numeric($_GET['id'])) {
	$query="
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
	";
	$rs = exec_query($sql, $query, array($_GET['id'], $_SESSION['user_id']));
	if ($rs->recordCount() != 1) {
		set_page_message(tr('Wrong software id.'));
		header('Location: software_upload.php');
	} else {
		if ($rs->fields['software_depot'] == "no") {
			$del_path = $cfg->GUI_SOFTWARE_DIR."/".$_SESSION['user_id']."/".$rs->fields['software_archive']."-".$rs->fields['software_id'].".tar.gz";
			@unlink($del_path);
		}
		$update = "UPDATE `web_software_inst` SET `software_res_del` = 1 WHERE `software_id` = ?";
		$res = exec_query($sql, $update, $rs->fields['software_id']);
		$delete="DELETE FROM `web_software` WHERE `software_id` = ? AND `reseller_id` = ?";
		$res = exec_query($sql, $delete, array($_GET['id'], $_SESSION['user_id']));
		set_page_message(tr('Software was deleted.'));
		header('Location: software_upload.php');
	}
} else {
	set_page_message(tr('Wrong software id.'));
	header('Location: software_upload.php');
}
?>