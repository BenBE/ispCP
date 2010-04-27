<?php
require '../include/ispcp-lib.php';

check_login(__FILE__);

if (isset($_GET['id']) AND is_numeric($_GET['id'])) {
	$query="
		SELECT
			*
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
		$source_file = Config::getInstance()->get('GUI_SOFTWARE_DIR').'/'.$rs->fields['reseller_id'].'/'.$rs->fields['software_archive'].'-'.$rs->fields['software_id'].'.tar.gz';
		$dest_file = Config::getInstance()->get('GUI_SOFTWARE_DEPOT_DIR').'/'.$rs->fields['software_archive'].'-'.$rs->fields['software_id'].'.tar.gz';
		$user_id = $_SESSION['user_id'];
		$update="
				UPDATE
						`web_software`
				SET		`reseller_id` = '".$user_id."',
						`software_active` = 1,
						`software_depot` = 'yes'
				WHERE
						`software_id` = ?
				";
		
		@copy($source_file, $dest_file);
		@unlink($source_file);
		
		$res = exec_query($sql, $update, array($_GET['id']));
		$query="
				INSERT INTO
					`web_software`
				(
					`software_master_id`, `reseller_id`, `software_name`,
					`software_version`, `software_language`, `software_type`,
					`software_db`, `software_archive`, `software_installfile`,
					`software_prefix`, `software_link`, `software_desc`,
					`software_active`, `software_status`, `rights_add_by`,
					`software_depot`
				) VALUES (
					?, ?, ?,
					?, ?, ?,
					?, ?, ?,
					?, ?, ?,
					?, ?, ?,
					?
				)
			";
		exec_query(
					$sql,
					$query,
					array(
						$rs->fields['software_id'], $rs->fields['reseller_id'], $rs->fields['software_name'],
						$rs->fields['software_version'], $rs->fields['software_language'], $rs->fields['software_type'],
						$rs->fields['software_db'], $rs->fields['software_archive'], $rs->fields['software_installfile'],
						$rs->fields['software_prefix'], $rs->fields['software_link'], $rs->fields['software_desc'],
						"1", "ok", $user_id, "yes"
						)
					);
					
		$sw_id = $sql->Insert_ID();
		update_existing_client_installations_res_upload(
													$sw_id, $rs->fields['software_name'], $rs->fields['software_version'],
													$rs->fields['software_language'], $rs->fields['reseller_id'], $rs->fields['software_id'],
													true
													);
		
		set_page_message(tr('Software was imported succesfully.'));
		header('Location: software_manage.php');
	}
} else {
	set_page_message(tr('Wrong software id.'));
	header('Location: software_manage.php');
}
?>