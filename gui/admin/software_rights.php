<?php
require '../include/ispcp-lib.php';

check_login(__FILE__);

$tpl = new pTemplate();
$tpl->define_dynamic('page', Config::getInstance()->get('ADMIN_TEMPLATE_PATH') . '/software_rights.tpl');
$tpl->define_dynamic('page_message', 'page');
$tpl->define_dynamic('logged_from', 'page');
$tpl->define_dynamic('list_reseller', 'page');
$tpl->define_dynamic('no_reseller_list', 'page');
$tpl->define_dynamic('no_select_reseller', 'page');
$tpl->define_dynamic('select_reseller', 'page');
$tpl->define_dynamic('reseller_item', 'page');

function get_reseller_rights (&$tpl, &$sql, $software_id) {
	$query = "SELECT 
					a.`software_id`,
					a.`software_master_id`,
					a.`reseller_id`,
					a.`rights_add_by`,
					b.`admin_name` as reseller
				FROM 
					`web_software` a,
					`admin` b
				WHERE
					a.`reseller_id` = b.`admin_id`
				AND 
					a.`software_depot` = 'yes'
				AND
					a.`software_master_id` = ?";
	$rs = exec_query($sql, $query, array($software_id));
	if ($rs->RecordCount() > 0){
		while(!$rs->EOF) {
			$adminquery = "SELECT `admin_name` as administrator from admin WHERE `admin_id` = ?";
			$rs_admin = exec_query($sql, $adminquery, array($rs->fields['rights_add_by']));
			if ($rs_admin->fields['administrator'] == ""){
				$added_by = tr('Admin not available');
			}else{
				$added_by = $rs_admin->fields['administrator'];
			}
			$remove_rights_url = "software_change_rights.php?id=".$rs->fields['software_master_id']."&reseller_id=".$rs->fields['reseller_id'];
			$tpl->assign(
					array(
						'RESELLER' => $rs->fields['reseller'],
						'ADMINISTRATOR' => $added_by,
						'TR_REMOVE_RIGHT' => tr('Remove'),
						'TR_MESSAGE_REMOVE' => tr('Are you sure you want to the rights?', true),
						'REMOVE_RIGHT_LINK' => $remove_rights_url,
						)
					);
			$tpl->parse('LIST_RESELLER', '.list_reseller');
			$rs->MoveNext();
		}
		$tpl->assign('NO_RESELLER_LIST', '');
	} else {
		$tpl->assign(
				array(
					'NO_RESELLER' => tr('No Reseller with rights for this software'),
					'LIST_RESELLER' => ''
				)
			);
		$tpl->parse('NO_RESELLER_LIST', '.no_reseller_list');
	}
	
	return $rs->RecordCount();
}	

function get_reseller_list (&$tpl, &$sql, $software_id) {
	$query = "SELECT 
					a.`reseller_id`,
					b.`admin_name` as reseller
				FROM 
					`reseller_props` a,
					`admin` b
				WHERE
					a.`reseller_id` = b.`admin_id`
				AND 
					a.`software_allowed` = 'yes'
				AND
					a.`softwaredepot_allowed` = 'yes'";
	$rs = exec_query($sql, $query, array());
	if ($rs->RecordCount() > 0){
		$reseller_count = 0;
		while(!$rs->EOF) {
			$query2 = "SELECT 
						`reseller_id`
					FROM 
						`web_software`
					WHERE
						`reseller_id` = ?
					AND 
						`software_master_id` = ?";
			$rs2 = exec_query($sql, $query2, array($rs->fields['reseller_id'],$software_id));
			if ($rs2->RecordCount() === 0){
				$tpl->assign(
						array(
							'ALL_RESELLER_NAME' => tr('All reseller'),
							'RESELLER_ID' => $rs->fields['reseller_id'],
							'RESELLER_NAME' => $rs->fields['reseller'],
							'SOFTWARE_ID_VALUE' => $software_id,
						)
					);
				$tpl->parse('RESELLER_ITEM', '.reseller_item');
				$reseller_count++;
			}
		$rs->MoveNext();
		}
		if ($reseller_count > 0){
			$tpl->parse('SELECT_RESELLER', '.select_reseller');
			$tpl->assign('NO_SELECT_RESELLER', '');
		}else{
			$tpl->assign(
					array(
						'NO_RESELLER_AVAILABLE' => tr('No Reseller to add rights available'),
						'SELECT_RESELLER' => '',
						'RESELLER_ITEM' => ''
					)
				);
			$tpl->parse('NO_SELECT_RESELLER', '.no_select_reseller');
		}
	}else{
		$tpl->assign(
				array(
					'NO_RESELLER_AVAILABLE' => tr('No Reseller to add rights available'),
					'SELECT_RESELLER' => '',
					'RESELLER_ITEM' => ''
				)
			);
		$tpl->parse('NO_SELECT_RESELLER', '.no_select_reseller');
	}
}

if (isset($_GET['id']) || isset($_POST['id'])) {
	if (isset($_GET['id']) && is_numeric($_GET['id'])) {
		$software_id = $_GET['id'];
	} elseif (isset($_POST['id']) && is_numeric($_POST['id'])) {
		$software_id = $_POST['id'];
	} else {
		set_page_message(tr('Wrong software id.'));
		header('Location: software_manage.php');
	}

} else {
	set_page_message(tr('Wrong software id.'));
	header('Location: software_manage.php');
}

$theme_color = Config::getInstance()->get('USER_INITIAL_THEME');

$tpl->assign(
		array(
			'TR_MANAGE_SOFTWARE_PAGE_TITLE' => tr('ispCP - Software Management (Rights)'),
			'THEME_COLOR_PATH' => '../themes/'.$theme_color,
			'THEME_CHARSET' => tr('encoding'),
			'ISP_LOGO' => get_logo($_SESSION['user_id'])
			)
	);

$res_cnt = get_reseller_rights (&$tpl, &$sql, $software_id);
$res_list = get_reseller_list (&$tpl, &$sql, $software_id);

$query = "SELECT `software_name`, `software_version`, `software_language` FROM `web_software` WHERE `software_id` = ?";
$rs = exec_query($sql, $query, array($software_id));
$tpl->assign(
		array(
			'TR_SOFTWARE_DEPOT' => tr('Softwaredepot'),
			'TR_SOFTWARE_NAME' => tr($rs->fields['software_name'].' - (Version: '.$rs->fields['software_version'].', Language: '.$rs->fields['software_language'].')'),
			'TR_ADD_RIGHTS' => tr('Add rights for reseller to software:'),
			'TR_RESELLER' => tr('Reseller'),
			'TR_REMOVE_RIGHTS' => tr('Remove rights'),
			'TR_RESELLER_COUNT' => tr('Reseller with rights total'),
			'TR_RESELLER_NUM' => $res_cnt,
			'TR_ADDED_BY' => tr('Added by'),
			'TR_ADD_RIGHTS_BUTTON' => tr('Add Rights'),
			'TR_SOFTWARE_RIGHTS' => tr('Softwarerights'),
			'TR_ADMIN_SOFTWARE_PAGE_TITLE' => tr('ispCP - Software management (Rights)'),
			)
	);

gen_admin_mainmenu($tpl, Config::getInstance()->get('ADMIN_TEMPLATE_PATH') . '/main_menu_users_manage.tpl');
gen_admin_menu($tpl, Config::getInstance()->get('ADMIN_TEMPLATE_PATH') . '/menu_users_manage.tpl');

gen_logged_from($tpl);

gen_page_message($tpl);

$tpl->parse('PAGE', 'page');

$tpl->prnt();

if (Config::getInstance()->get('DUMP_GUI_DEBUG')) {
	dump_gui_debug();
}

unset_messages();
?>