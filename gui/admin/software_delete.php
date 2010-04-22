<?php
require '../include/ispcp-lib.php';

check_login(__FILE__);

$tpl = new pTemplate();
$tpl->define_dynamic('page', Config::getInstance()->get('ADMIN_TEMPLATE_PATH') . '/software_delete.tpl');
$tpl->define_dynamic('page_message', 'page');

function gen_page_data(&$tpl, &$sql) {
	if (isset($_POST['uaction']) && $_POST['uaction'] === 'send_delmessage') {
		$tpl->assign(
				array(
					'DELETE_MESSAGE_TEXT' => clean_input($_POST['delete_msg_text'], false)
				)
			);
	} else {
		$tpl->assign(
				array(
					'DELETE_MESSAGE_TEXT' =>'',
					'MESSAGE' => ''
				)
			);
	}
}
if (isset($_GET['id']) || isset($_POST['id'])) {
	$showmessage = 1;
	if (isset($_GET['id']) && is_numeric($_GET['id'])) {
		$software_id = $_GET['id'];
	} elseif (isset($_POST['id']) && is_numeric($_POST['id'])) {
		$software_id = $_POST['id'];
	} else {
		set_page_message(tr('Wrong software id.'));
		header('Location: software_manage.php');
	}
	
	$query="SELECT `software_id`, `software_name`, `software_version`, `software_archive`, `reseller_id`, `software_depot` FROM `web_software` WHERE `software_id` = ?";
	$rs = exec_query($sql, $query, array($software_id));
	
	if ($rs->RecordCount() != 1) {
		set_page_message(tr('Wrong software id.'));
		header('Location: software_manage.php');
	}

	$query_res="SELECT `admin_name`, `email` FROM `admin` WHERE `admin_id` = ?";
	$rs_res = exec_query($sql, $query_res, array($rs->fields['reseller_id']));
	$tpl->assign(
			array(
				'DELETE_SOFTWARE_RESELLER' => $rs_res->fields['admin_name'].' ('.$rs_res->fields['email'].')'
			)
		);
	if($rs->fields['software_depot'] == "yes") {
		$del_path = Config::getInstance()->get('GUI_SOFTWARE_DEPOT_DIR')."/".$rs->fields['software_archive']."-".$rs->fields['software_id'].".tar.gz";
		@unlink($del_path);
		$update = "UPDATE `web_software_inst` SET `software_res_del` = 1 WHERE `software_master_id` = ?";
		$res = exec_query($sql, $update, array($rs->fields['software_id']));
		$delete = "DELETE FROM `web_software` WHERE `software_id` = ?";
		$delete_master = "DELETE FROM `web_software` WHERE `software_master_id` = ?";
		$res = exec_query($sql, $delete, array($rs->fields['software_id']));
		$res = exec_query($sql, $delete_master, array($rs->fields['software_id']));
		set_page_message(tr('Software was deleted.'));
		header('Location: software_manage.php');
		gen_page_message($tpl);
	}else{
		if(isset($_POST['id']) && is_numeric($_POST['id']) && $_POST['uaction'] === 'send_delmessage') {
			if (!empty($_POST['id']) && !empty($_POST['delete_msg_text'])) {
				send_deleted_sw($rs->fields['reseller_id'], $rs->fields['software_archive'].'.tar.gz', $rs->fields['software_id'], 'Software '.$rs->fields['software_name'].' (V'.$rs->fields['software_version'].')', clean_input($_POST['delete_msg_text']));
				$del_path = Config::getInstance()->get('GUI_SOFTWARE_DIR')."/".$rs->fields['reseller_id']."/".$rs->fields['software_archive']."-".$rs->fields['software_id'].".tar.gz";
				@unlink($del_path);
				$delete="DELETE FROM `web_software` WHERE `software_id` = ?";
				$res = exec_query($sql, $delete, array($rs->fields['software_id']));
				set_page_message(tr('Software was deleted.'));
				header('Location: software_manage.php');
			} else {
				set_page_message(tr('Fill out a message text!'));
			}
			gen_page_message($tpl);
		}

		$theme_color = Config::getInstance()->get('USER_INITIAL_THEME');

		$tpl->assign(
				array(
					'TR_MANAGE_SOFTWARE_PAGE_TITLE' => tr('ispCP - Software Management'),
					'THEME_COLOR_PATH' => '../themes/'.$theme_color,
					'THEME_CHARSET' => tr('encoding'),
					'ISP_LOGO' => get_logo($_SESSION['user_id']),
					'TR_DELETE_SEND_TO' => tr('Send message to'),
					'TR_DELETE_MESSAGE_TEXT' => tr('Message'),
					'TR_DELETE_SOFTWARE' => tr('Message to reseller before deleting the software'),
					'TR_DELETE_DATA' => tr('Reseller data'),
					'TR_SEND_MESSAGE' => tr('Delete software and send message'),
					'SOFTWARE_ID' => $software_id,
					'RESELLER_ID' => $rs->fields['reseller_id']
					)
			);
	}
	gen_admin_mainmenu($tpl, Config::getInstance()->get('ADMIN_TEMPLATE_PATH') . '/main_menu_users_manage.tpl');
	gen_admin_menu($tpl, Config::getInstance()->get('ADMIN_TEMPLATE_PATH') . '/menu_users_manage.tpl');

	gen_page_data ($tpl, $sql);

	$tpl->parse('PAGE', 'page');

	$tpl->prnt();

	if (Config::getInstance()->get('DUMP_GUI_DEBUG')) {
		dump_gui_debug();
	}

	unset_messages();
} else {
	set_page_message(tr('Wrong software id.'));
	header('Location: software_manage.php');
}
?>