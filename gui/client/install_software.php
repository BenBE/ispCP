<?php
/**
 *  ispCP (OMEGA) - Virtual Hosting Control System | Omega Version
 *
 *  @copyright 	2001-2006 by moleSoftware GmbH
 *  @copyright 	2006-2007 by ispCP | http://isp-control.net
 *  @link 		http://isp-control.net
 *  @author		ispCP Team (2007)
 *
 *  @license
 *  This program is free software; you can redistribute it and/or modify it under
 *  the terms of the MPL General Public License as published by the Free Software
 *  Foundation; either version 1.1 of the License, or (at your option) any later
 *  version.
 *  You should have received a copy of the MPL Mozilla Public License along with
 *  this program; if not, write to the Open Source Initiative (OSI)
 *  http://opensource.org | osi@opensource.org
 **/


require '../include/ispcp-lib.php';

check_login(__FILE__);

$tpl = new pTemplate();
$tpl->define_dynamic('page', Config::get('CLIENT_TEMPLATE_PATH') . '/install_software.tpl');
$tpl->define_dynamic('page_message', 'page');
$tpl->define_dynamic('software_item', 'page');
$tpl->define_dynamic('logged_from', 'page');
$tpl->define_dynamic('software_install', 'page');
$tpl->define_dynamic('no_software', 'page');
$tpl->define_dynamic('installdb_item', 'page');
$tpl->define_dynamic('select_installdb', 'page');
$tpl->define_dynamic('require_installdb', 'page');
$tpl->define_dynamic('select_installdbuser', 'page');
$tpl->define_dynamic('installdbuser_item', 'page');
$tpl->define_dynamic('softwaredbuser_message', 'page');
$tpl->define_dynamic('create_db', 'page');
$tpl->define_dynamic('create_message_db', 'page');

//
// form data
//

if (isset($_POST['Submit2'])) {
	$id = $_GET['id'];
	$other_dir = clean_input($_POST['other_dir']);
	$query="SELECT `software_master_id`, `software_db`, `software_name`, `software_version`, `software_depot` FROM `web_software` WHERE `software_id` = ?";
	$rs = exec_query($sql, $query, array($_GET['id']));
	$install_username = clean_input($_POST['install_username']);
	$install_password = clean_input($_POST['install_password']);
	$install_email = clean_input($_POST['install_email']);
	if(isset($_POST['createdir']) && $_POST['createdir'] === '1') {
		$createdir = clean_input($_POST['createdir']);
		set_page_message(tr('The directory \''.$other_dir.'\' was created!'));
	} else {
		$createdir = '0';
	}
	//Check dir exists
    $sql = Database::getInstance();
    $domain = $_SESSION['user_logged'];
    $vfs = new vfs($domain, $sql);
    $list = $vfs->ls($other_dir);
    //Check dir exists
	
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
		$dmn_cgi) = get_domain_default_props($sql, $_SESSION['user_id']);
	
	
	$querypath="SELECT `software_name` as swname, `software_version` as swversion FROM `web_software_inst` WHERE `domain_id` = ? AND `pfad` = ?";
	$rspath = exec_query($sql, $querypath, array($dmn_id, $other_dir));
	
	if($rs->fields['software_db'] == "1") {
		$selected_db = clean_input($_POST['selected_db']);
		$sql_user = clean_input($_POST['sql_user']);
		$querydbuser = "SELECT `sqlu_pass` FROM `sql_user` WHERE `sqlu_name` = ?";
		$rsdatabase = exec_query($sql, $querydbuser, array($sql_user));
		$sql_pass = decrypt_db_password($rsdatabase->fields['sqlu_pass']);
		$connect = @mysql_connect(Config::get('DATABASE_HOST'), $sql_user, $sql_pass);
		$db_selected = @mysql_select_db($selected_db, $connect);
		$sql_pass = $rsdatabase->fields['sqlu_pass'];
	}
	if($rs->fields['software_db'] == "1" && !$db_selected) {		
		set_page_message(tr('Please select the correct user for your database!'));
	} elseif(empty($install_username) || empty($install_password) || empty($install_email)) {
		set_page_message(tr('You have to fill out inputs!'));
	} elseif (!chk_password($install_password)){
		if (Config::get('PASSWD_STRONG')) {
			set_page_message(sprintf(tr('The password must be at least %s long and contain letters and numbers to be valid.'), Config::get('PASSWD_CHARS')));
		} else {
			set_page_message(sprintf(tr('Password data is shorter than %s signs or includes not permitted signs!'), Config::get('PASSWD_CHARS')));
		}
	} elseif(!preg_match("/htdocs/",$other_dir)){
		set_page_message(tr('You cant\'t install outside from htdocs!'));
	} elseif(!$list && $createdir === '0'){
			set_page_message(tr('The directory \''.$other_dir.'\' doesn\'t exist. Please create it!'));
	} elseif ($rspath->RecordCount() > 0) {
		set_page_message(tr('Please select another directory! '.$rspath->fields['swname'].' ('.$rspath->fields['swversion'].') is installed there!'));
	} else {
		$sw_db_required = $rs->fields['software_db'];
		$sw_software_name = $rs->fields['software_name'];
		$sw_software_version = $rs->fields['software_version'];
		$software_master_id = $rs->fields['software_master_id'];
		$software_depot = $rs->fields['software_depot'];
		
		
		$query="SELECT `software_prefix` FROM `web_software` WHERE `software_id` = ?";
		$rs = exec_query($sql, $query, array($_GET['id']));
		
		$prefix = $rs->fields['software_prefix'];
		if($sw_db_required == "1") {
			$query=<<<SQL_QUERY
			INSERT INTO
				`web_software_inst`
			(
				`domain_id`, `software_id`, `software_master_id`, `software_name`, `software_version`,
				`pfad`, `software_prefix`, `db`, `database_user`, `database_tmp_pwd`, 
				`install_username`, `install_password`, `install_email`, `software_status`, `software_depot`
			) VALUES (
				?, ?, ?, ?, ?,
				?, ?, ?, ?, ?,
				?, ?, ?, ?, ?
			)
SQL_QUERY;
			$rs = exec_query($sql, $query, array($dmn_id, $id, $software_master_id, $sw_software_name, $sw_software_version, $other_dir, $prefix, $selected_db, $sql_user, $sql_pass, $install_username, md5($install_password), $install_email, Config::get('ITEM_ADD_STATUS'), $software_depot));
		} else {
			$query=<<<SQL_QUERY
			INSERT INTO
				`web_software_inst`
			(
				`domain_id`, `software_id`, `software_master_id`, `software_name`, `software_version`,
				`pfad`, `software_prefix`, `db`, `database_user`, `database_tmp_pwd`,
				`install_username`, `install_password`, `install_email`, `software_status`, `software_depot`
			) VALUES (
				?, ?, ?, ?, ?,
				?, ?, ?, ?, ?,
				?, ?, ?, ?, ?
			)
SQL_QUERY;
			$rs = exec_query($sql, $query, array($dmn_id, $id, $software_master_id, $sw_software_name, $sw_software_version, $other_dir, "not_required", "not_required", "not_required", "not_required", $install_username, md5($install_password), $install_email, Config::get('ITEM_ADD_STATUS'), $software_depot));
		}
		send_request();
		header('Location: software.php');
	}
	if($rs->fields['software_db'] == "1") {
		$tpl->assign(
				array(
					'VAL_OTHER_DIR' => $other_dir,
					'CHECKED_CREATEDIR' =>  ($createdir === '1') ? ' checked="checked"' : '',
					'VAL_INSTALL_USERNAME' => $install_username,
					'VAL_INSTALL_PASSWORD' => $install_password,
					'VAL_INSTALL_EMAIL' => $install_email
				)
			);
	} else {
		$tpl->assign(
				array(
					'VAL_OTHER_DIR' => $other_dir,
					'CHECKED_CREATEDIR' =>  ($createdir === '1') ? ' checked="checked"' : '',
					'VAL_INSTALL_USERNAME' => $install_username,
					'VAL_INSTALL_PASSWORD' => $install_password,
					'VAL_INSTALL_EMAIL' => $install_email
				)
			);
	}
} else {
	$tpl->assign(
			array(
				'VAL_OTHER_DIR' => '',
				'CHECKED_CREATEDIR' =>  '',
				'VAL_INSTALL_USERNAME' => '',
				'VAL_INSTALL_PASSWORD' => '',
				'VAL_INSTALL_EMAIL' => ''
			)
		);
}

//
// page functions.
//


function check_db_user_list(&$tpl, &$sql, $db_id) {
	global $count;
	$query = "
		SELECT
			`sqlu_id`, `sqlu_name`
		FROM
			`sql_user`
		WHERE
			`sqld_id` = ?
		ORDER BY
			`sqlu_name`
	";
	$rs = exec_query($sql, $query, array($db_id));
	if ($rs->RecordCount() == 0) {
		$tpl->assign(
				array(
					'STATUS_COLOR' 				=> 'red',
					'SQLUSER_STATUS_MESSAGE'	=> tr('Database user list is empty!'),
					'INSTALLDBUSER_ITEM'		=> '',
					'SELECT_INSTALLDBUSER'		=> ''
				)
			);
		$tpl->parse('SOFTWAREDBUSER_MESSAGE', 'softwaredbuser_message');
	} else {
		$tpl->assign(
				array(
					'SELECT_INSTALLDBUSER' 		=> '',
					'SOFTWAREDBUSER_MESSAGE'	=> ''
				)
			);

		while (!$rs->EOF) {
			if (isset($_POST['sql_user']) && $_POST['sql_user'] == $rs->fields['sqlu_name']){
				$selecteddbuser = 'selected="selected"';
				}else{
				$selecteddbuser = '';
			}
			$count++;
			$user_id = $rs->fields['sqlu_id'];
			$user_mysql = $rs->fields['sqlu_name'];
			$tpl -> assign(
					array(
						'SQLUSER_NAME' => $user_mysql,
						'SELECTED_DBUSER' => $selecteddbuser
					)
				);
			$tpl -> parse('INSTALLDBUSER_ITEM', '.installdbuser_item');
			$rs->MoveNext();
		}
		$tpl->parse('SELECT_INSTALLDBUSER', 'select_installdbuser');
	}
	return $count;
}

function check_db_avail(&$tpl, &$sql, $dmn_id, $dmn_sqld_limit) {
  $existdbuser = 0;
  $check_db = <<<SQL_QUERY
	SELECT
		`sqld_id`,
		`sqld_name`
	FROM
		`sql_database`
	WHERE
		`domain_id` = ?
	ORDER BY
		`sqld_name` ASC
SQL_QUERY;
  $rs = exec_query($sql, $check_db, array($dmn_id));
  if ($rs->RecordCount() > 0) {
	while (!$rs->EOF) {
				if (isset($_POST['selected_db']) && $_POST['selected_db'] == $rs->fields['sqld_name']){
					$selecteddb = 'selected="selected"';
					}else{
					$selecteddb = '';
				}
				$tpl -> assign(
						array(
							'DB_NAME' => $rs->fields['sqld_name'],
							'SELECTED_DB' => $selecteddb
							)
						);
				$tpl->parse('INSTALLDB_ITEM', '.installdb_item');
				$existdbuser = check_db_user_list($tpl, $sql, $rs->fields['sqld_id']);
				$existdbuser = +$existdbuser;
				$rs->MoveNext();
		}
		if($existdbuser == 0) {
			$tpl->assign(
					array(
						'SOFTWARE_INSTALL' => ''
					)
				);
		}
		$tpl -> assign(
					array(
						'ADD_DATABASE_MESSAGE' => '',
						'CREATE_MESSAGE_DB' => ''
					)
				);
		$tpl->parse('SELECT_INSTALLDB', 'select_installdb');
	} else {
		$tpl -> assign(
					array(
						'SELECT_INSTALLDBUSER' => '',
						'SOFTWAREDBUSER_MESSAGE' => '',
						'SELECT_INSTALLDB' => '',
						'ADD_DATABASE_MESSAGE' => tr('At first you must create a database!'),
						'SOFTWARE_INSTALL' => ''
					)
				);
		$tpl -> parse('CREATE_MESSAGE_DB', '.create_message_db');
	}
  if($rs -> RecordCount() < $dmn_sqld_limit OR $dmn_sqld_limit == 0) {
	$tpl -> assign(
				array(
					'ADD_DB_LINK' => 'sql_database_add.php',
					'BUTTON_ADD_DB' => tr('Add new database')
				)
			);
	$tpl -> parse('CREATE_DB', '.create_db');
  } else {
	$tpl -> assign('CREATE_MESSAGE_DB','');
  }
}
	
function check_software_avail(&$sql, $software_id, $dmn_created_id) {
  $check_avail = <<<SQL_QUERY
	SELECT
		`reseller_id` AS reseller
	FROM
		`web_software`
	WHERE
		`software_id` = ?
	AND
		`reseller_id` = ?
SQL_QUERY;
  $sa = exec_query($sql, $check_avail, array($software_id, $dmn_created_id));
  if ($sa -> RecordCount() == 0) {
	return FALSE;
  } else {
	return TRUE;
  }
}

function check_is_installed(&$tpl, &$sql, $dmn_id, $software_id) {
  $is_installed = <<<SQL_QUERY
	SELECT
		`software_id`
	FROM
		`web_software_inst`
	WHERE
		`domain_id` = ?
	AND
		`software_id` = ?
SQL_QUERY;
  $is_inst = exec_query($sql, $is_installed, array($dmn_id, $software_id));
  if ($is_inst -> RecordCount() == 0) {
	$tpl -> assign (
				array(
					'SOFTWARE_INSTALL_BUTTON' => 'install_software.php?id='.$software_id
				)
			);
	$tpl -> parse('SOFTWARE_INSTALL', '.software_install');
  } else {
	$tpl -> assign ('SOFTWARE_INSTALL', '');
  }
}

function get_software_props (&$tpl, &$sql, $dmn_id, $software_id, $dmn_created_id, $dmn_sqld_limit) {
  if (!check_software_avail(&$sql, $software_id, $dmn_created_id)) {
	set_page_message(tr('Software not found!'));
	header('Location: software.php');
	die();
  } else {
	$software_props = <<<SQL_QUERY
		SELECT
			`software_name`,
			`software_type`,
			`software_db`
		FROM
			`web_software`
		WHERE
			`software_id` = ?
		AND
			`reseller_id` = ?
SQL_QUERY;
	$rs = exec_query($sql, $software_props, array($software_id, $dmn_created_id));
	check_is_installed($tpl, $sql, $dmn_id, $software_id);
	if ($rs -> fields['software_db'] == 1) {
		$tpl -> assign (array('SOFTWARE_DB' => tr('yes')));
		if ($dmn_sqld_limit == '-1') { 
			$tpl -> parse('REQUIRE_INSTALLDB', '.require_installdb');
		}
		check_db_avail($tpl, $sql, $dmn_id, $dmn_sqld_limit);
 	} else {
		$tpl -> assign (
					array(
						'SOFTWARE_DB' => tr('no'),
						'REQUIRE_INSTALLDB' => ''
					)
				);
	}
	$tpl -> assign (
				array(
					'TR_SOFTWARE_NAME' => $rs -> fields['software_name'],
					'SOFTWARE_TYPE' => $rs -> fields['software_type']
				)
			);
	$tpl -> parse('SOFTWARE_ITEM', '.software_item');
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

$theme_color = Config::get('USER_INITIAL_THEME');

$tpl -> assign(
			array(
				'TR_CLIENT_INSTALL_SOFTWARE_PAGE_TITLE' => tr('ispCP - Install Software'),
				'THEME_COLOR_PATH' => '../themes/'.$theme_color,
				'THEME_CHARSET' => tr('encoding'),
				'ISP_LOGO' => get_logo($_SESSION['user_id'])
			)
		);

//
// dynamic page data.
//

gen_page_lists($tpl, $sql, $_SESSION['user_id']);

//
// static page messages.
//

gen_client_mainmenu($tpl, Config::get('CLIENT_TEMPLATE_PATH') . '/main_menu_webtools.tpl');
gen_client_menu($tpl, Config::get('CLIENT_TEMPLATE_PATH') . '/menu_webtools.tpl');

gen_logged_from($tpl);

get_client_software_permission (&$tpl,&$sql,$_SESSION['user_id']);

check_permissions($tpl);


$tpl -> assign(
			array(
				'TR_INSTALL_SOFTWARE' => tr('Install Software'),
				'TR_NAME' => tr('Software'),
				'TR_TYPE' => tr('Type'),
				'TR_DB' => tr('Database required'),
				'TR_BACK' => tr('back'),
				'TR_INSTALL' => tr('install'),
				'TR_PATH' => tr('Install path'),
				'CHOOSE_DIR' => tr('Choose dir'),
				'CREATEDIR_MESSAGE' => tr('Create directory, if not exist!'),
				'TR_SELECT_DB' => tr('Select database'),
				'TR_SQL_USER' => tr('SQL-User'),
				'TR_SQL_PWD' => tr('Password'),
				'TR_SOFTWARE_MENU' => tr('Software installation'),
				'TR_CLIENT_SOFTWARE_PAGE_TITLE' => tr('ispCP - Software management')
			)
		);

gen_page_message($tpl);

$tpl -> parse('PAGE', 'page');

$tpl -> prnt();

if (Config::get('DUMP_GUI_DEBUG')) {
	dump_gui_debug();
}

unset_messages();
?>