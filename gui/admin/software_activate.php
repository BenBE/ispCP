<?php
require '../include/ispcp-lib.php';

check_login(__FILE__);

if (isset($_GET['id']) AND is_numeric($_GET['id'])) {
	$query="
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
		";
	$rs = exec_query($sql, $query, array($_GET['id']));
	if ($rs->RecordCount() != 1) {
		set_page_message(tr('Wrong software id.'));
		header('Location: software_manage.php');
	} else {
		$update="
				UPDATE
						`web_software`
				SET
						`software_active` = 1
				WHERE
						`software_id` = ?
				";
		$res = exec_query($sql, $update, array($_GET['id']));
		$query="
		SELECT
			`software_id`,
			`software_name`,
			`software_version`,
			`software_language`,
			`reseller_id`,
			`software_archive`
		FROM
			`web_software`
		WHERE
			`software_id` = ?
		";
		$res = exec_query($sql, $query, array($_GET['id']));
		
		update_existing_client_installations_res_upload(
													$res->fields['software_id'], $res->fields['software_name'],
													$res->fields['software_version'], $res->fields['software_language'],
													$res->fields['reseller_id']
													);
		
		send_activated_sw (
						$res->fields['reseller_id'],
						$res->fields['software_archive'].".tar.gz",
						$res->fields['software_id']
						);
		
		set_page_message(tr('Software was activated.'));
		header('Location: software_manage.php');
	}
} else {
	set_page_message(tr('Wrong software id.'));
	header('Location: software_manage.php');
}
?>