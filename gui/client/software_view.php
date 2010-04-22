<?php
require '../include/ispcp-lib.php';

check_login(__FILE__);

$tpl = new pTemplate();
$tpl->define_dynamic('page', Config::getInstance()->get('CLIENT_TEMPLATE_PATH') . '/software_view.tpl');
$tpl -> define_dynamic('page_message', 'page');
$tpl -> define_dynamic('logged_from', 'page');
$tpl -> define_dynamic('software_message', 'page');
$tpl -> define_dynamic('software_install', 'page');
$tpl -> define_dynamic('installed_software_info', 'page');
$tpl -> define_dynamic('software_item', 'page');
$tpl -> define_dynamic('no_software', 'page');

//
// page functions.
//

function check_software_avail(&$sql, $software_id, $dmn_created_id) {
  $check_avail = "
		SELECT
			`reseller_id` AS reseller
		FROM
			`web_software`
		WHERE
			`software_id` = ?
		AND
			`reseller_id` = ?
	";
  $sa = exec_query($sql, $check_avail, array($software_id, $dmn_created_id));
  if ($sa -> RecordCount() == 0) {
	return FALSE;
  } else {
	return TRUE;
  }
}

function check_is_installed(&$tpl, &$sql, $dmn_id, $software_id) {
	$is_installed = "
		SELECT
			`software_id`,
			`software_prefix`,
			`db`,
			`path`
		FROM
			`web_software_inst`
		WHERE
			`domain_id` = ?
		AND
			`software_id` = ?
	";
	$is_inst = exec_query($sql, $is_installed, array($dmn_id, $software_id));
	if ($is_inst -> RecordCount() == 0) {
		$tpl -> assign(
					array(
						'INSTALLED_SOFTWARE_INFO' => '',
						'SOFTWARE_INSTALL_BUTTON' => 'software_install.php?id='.$software_id
					)
				);
		$tpl -> parse('SOFTWARE_INSTALL', '.software_install');
	} else {
		$tpl -> assign(
					array(
						'SOFTWARE_INSTALL_BUTTON' => '',
						'SOFTWARE_STATUS' => tr('installed'),
						'SOFTWARE_INSTALL_PATH' => $is_inst->fields['path'],
						'SOFTWARE_INSTALL_DATABASE' => $is_inst->fields['db'],
						'TR_SOFTWARE_INFO' => tr('Installation infos'),
						'TR_SOFTWARE_STATUS' => tr('Software status:'),
						'TR_SOFTWARE_INSTALL_PATH' => tr('Installation path:'),
						'TR_SOFTWARE_INSTALL_DATABASE' => tr('Used database:'),
						'SOFTWARE_INSTALL' => ''
					)
				);
		$tpl -> parse('INSTALLED_SOFTWARE_INFO', '.installed_software_info');
	}
}

function get_software_props (&$tpl, &$sql, $dmn_id, $software_id, $dmn_created_id, $dmn_sqld_limit) {
	if (!check_software_avail(&$sql, $software_id, $dmn_created_id)) {
		set_page_message(tr('Software not found!'));
		header('Location: software.php');
		die();
	} else {
		$software_props = "
			SELECT
				`software_name`,
				`software_version`,
				`software_language`,
				`software_type`,
				`software_db`,
				`software_link`,
				`software_desc`
			FROM
				`web_software`
			WHERE
				`software_id` = ?
			AND
				`reseller_id` = ?
		";
		$rs = exec_query($sql, $software_props, array($software_id, $dmn_created_id));
		if ($rs -> fields['software_db'] == 1) {
			$tpl -> assign(
						array(
							'SOFTWARE_DB' => tr('yes')
						)
					);
			if ($dmn_sqld_limit == '-1') { 
				$tpl -> assign(
							array(
								'STATUS_COLOR' => 'red',
								'STATUS_MESSAGE' => tr('You need database-support for this software')
							)
						);
				$tpl -> parse('SOFTWARE_MESSAGE', '.software_message');
			} else {
				$tpl -> assign(
							array(
								'STATUS_COLOR' => 'green',
								'STATUS_MESSAGE' => '',
								'SOFTWARE_MESSAGE' => ''
							)
						);
			}
		} else {
			$tpl -> assign(
						array(
							'SOFTWARE_DB' => tr('no'),
							'SOFTWARE_MESSAGE' => '',
							'STATUS_MESSAGE' => ''
						)
					);
		}
		$sw_link = $rs -> fields['software_link'];
		if(!preg_match("/http:/",$sw_link) && !preg_match("/https:/",$sw_link)) {
			$sw_link = "http://".$sw_link;
		}
		$tpl -> assign (
					array(
						'SOFTWARE_NAME' => $rs -> fields['software_name'],
						'SOFTWARE_VERSION' => $rs -> fields['software_version'],
						'SOFTWARE_LANGUAGE' => $rs -> fields['software_language'],
						'SOFTWARE_TYPE' => $rs -> fields['software_type'],
						'SOFTWARE_LINK' => $sw_link,
						'SOFTWARE_DESC' => nl2br($rs -> fields['software_desc'])
					)
				);
		check_is_installed($tpl, $sql, $dmn_id, $software_id);
		$tpl -> parse('SOFTWARE_ITEM', 'software_item');
	}
}

function gen_page_lists(&$tpl, &$sql, $user_id) {
	if (!isset($_GET['id']) || $_GET['id'] === '' || !is_numeric($_GET['id'])) {
		set_page_message(tr('Software not found!'));
		header('Location: software.php');
		die();
	} else {
		$software_id = $_GET['id'];
	}
    list($dmn_id,
         $dmn_name,
         $dmn_gid,
         $dmn_uid,
         $dmn_created_id,
         $dmn_created,
         $dmn_last_modified,
         $dmn_mailacc_limit,
         $dmn_ftpacc_limit,
         $dmn_traff_limit,
         $dmn_sqld_limit,
         $dmn_sqlu_limit,
         $dmn_status,
         $dmn_als_limit,
         $dmn_subd_limit,
         $dmn_ip_id,
         $dmn_disk_limit,
         $dmn_disk_usage,
         $dmn_php,
         $dmn_cgi) = get_domain_default_props($sql, $user_id);
	get_software_props ($tpl, $sql, $dmn_id, $software_id, $dmn_created_id, $dmn_sqld_limit);
}

//
// common page data.
//

$theme_color = Config::getInstance()->get('USER_INITIAL_THEME');

$tpl -> assign(
			array(
				'TR_CLIENT_VIEW_SOFTWARE_PAGE_TITLE' => tr('ispCP - Software details'),
				'THEME_COLOR_PATH' => '../themes/'.$theme_color,
				'THEME_CHARSET' => tr('encoding'),
				'ISP_LOGO' => get_logo($_SESSION['user_id'])
			)
		);

//
// dynamic page data.
//

if (isset($_SESSION['software_support']) && $_SESSION['software_support'] == "no") {
	$tpl -> assign('NO_SOFTWARE', '');
}

gen_page_lists($tpl, $sql, $_SESSION['user_id']);

//
// static page messages.
//

gen_client_mainmenu($tpl, Config::getInstance()->get('CLIENT_TEMPLATE_PATH') . '/main_menu_webtools.tpl');
gen_client_menu($tpl, Config::getInstance()->get('CLIENT_TEMPLATE_PATH') . '/menu_webtools.tpl');

gen_logged_from($tpl);

get_client_software_permission (&$tpl,&$sql,$_SESSION['user_id']);

check_permissions($tpl);


$tpl -> assign(
			array(
				'TR_MANAGE_USERS' => tr('Manage users'),
				'TR_VIEW_SOFTWARE' => tr('Software details'),
				'TR_NAME' => tr('Software'),
				'TR_VERSION' => tr('Version'),
				'TR_LANGUAGE' => tr('Language'),
				'TR_TYPE' => tr('Type'),
				'TR_DB' => tr('Database required'),
				'TR_LINK' => tr('Homepage'),
				'TR_DESC' => tr('Description'),
				'TR_BACK' => tr('back'),
				'TR_INSTALL' => tr('install'),
				'TR_SOFTWARE_MENU' => tr('Software installation')
			)
		);

gen_page_message($tpl);

$tpl -> parse('PAGE', 'page');

$tpl -> prnt();

if (Config::getInstance()->get('DUMP_GUI_DEBUG')) {
	dump_gui_debug();
}

unset_messages();
?>