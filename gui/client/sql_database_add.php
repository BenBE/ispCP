<?php
/**
 * ispCP ω (OMEGA) a Virtual Hosting Control System
 *
 * @copyright 	2001-2006 by moleSoftware GmbH
 * @copyright 	2006-2011 by ispCP | http://isp-control.net
 * @version 	SVN: $Id$
 * @link 		http://isp-control.net
 * @author 		ispCP Team
 *
 * @license
 * The contents of this file are subject to the Mozilla Public License
 * Version 1.1 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
 * License for the specific language governing rights and limitations
 * under the License.
 *
 * The Original Code is "VHCS - Virtual Hosting Control System".
 *
 * The Initial Developer of the Original Code is moleSoftware GmbH.
 * Portions created by Initial Developer are Copyright (C) 2001-2006
 * by moleSoftware GmbH. All Rights Reserved.
 * Portions created by the ispCP Team are Copyright (C) 2006-2011 by
 * isp Control Panel. All Rights Reserved.
 */

require '../include/ispcp-lib.php';

check_login(__FILE__);

$cfg = ispCP_Registry::get('Config');

$tpl = ispCP_TemplateEngine::getInstance();
$template = 'sql_database_add.tpl';

// dynamic page data

check_sql_permissions($sql, $_SESSION['user_id']);

gen_page_post_data($tpl);

add_sql_database($sql, $_SESSION['user_id']);

// static page messages
gen_logged_from($tpl);

check_permissions($tpl);

$tpl->assign(
	array(
		'TR_PAGE_TITLE' => tr('ispCP - Client/Add SQL Database'),
		'TR_ADD_DATABASE' => tr('Add SQL database'),
		'TR_DB_NAME' => tr('Database name'),
		'TR_USE_DMN_ID' => tr('Use numeric ID'),
		'TR_START_ID_POS' => tr('Before the name'),
		'TR_END_ID_POS' => tr('After the name'),
		'TR_ADD' => tr('Add')
	)
);

gen_client_mainmenu($tpl, 'main_menu_manage_sql.tpl');
gen_client_menu($tpl, 'menu_manage_sql.tpl');

gen_page_message($tpl);

$tpl->display($template);

if ($cfg->DUMP_GUI_DEBUG) {
	dump_gui_debug();
}

// page functions

/**
 * @param ispCP_TemplateEngine $tpl
 */
function gen_page_post_data(&$tpl) {

	$cfg = ispCP_Registry::get('Config');

	if ($cfg->MYSQL_PREFIX === 'yes') {
		$tpl->assign('MYSQL_PREFIX_NO', true);

		if ($cfg->MYSQL_PREFIX_TYPE === 'behind') {
			$tpl->assign('MYSQL_PREFIX_BEHIND', true);
		} else {
			$tpl->assign('MYSQL_PREFIX_INFRONT', true);
		}
	} else {
		$tpl->assign('MYSQL_PREFIX_YES', true);
		$tpl->assign('MYSQL_PREFIX_ALL', true);
	}

	if (isset($_POST['uaction']) && $_POST['uaction'] === 'add_db') {
		$tpl->assign(
			array(
				'DB_NAME' => clean_input($_POST['db_name'], true),
				'USE_DMN_ID' => (isset($_POST['use_dmn_id']) && $_POST['use_dmn_id'] === 'on') ? $cfg->HTML_CHECKED : '',
				'START_ID_POS_CHECKED' => (isset($_POST['id_pos']) && $_POST['id_pos'] !== 'end') ? $cfg->HTML_CHECKED : '',
				'END_ID_POS_CHECKED' => (isset($_POST['id_pos']) && $_POST['id_pos'] === 'end') ? $cfg->HTML_CHECKED : ''
			)
		);
	} else {
		$tpl->assign(
			array(
				'DB_NAME' => '',
				'USE_DMN_ID' => '',
				'START_ID_POS_CHECKED' => $cfg->HTML_CHECKED,
				'END_ID_POS_CHECKED' => ''
			)
		);
	}
}

/**
 * Check if a database with same name already exists
 *
 * @param  ispCP_Database $sql ispCP_Database instance
 * @param  string $db_name database name to be checked
 * @return boolean TRUE if database exists, false otherwise
 */
function check_db_name($sql, $db_name) {

	$rs = exec_query($sql, 'SHOW DATABASES');

	while (!$rs->EOF) {
		if ($db_name == $rs->fields['Database']) {
			return true;
		}

		$rs->moveNext();
	}

	return false;
}

function add_sql_database(&$sql, $user_id) {

	$cfg = ispCP_Registry::get('Config');

	if (!isset($_POST['uaction'])) return;

	// let's generate database name.

	if (empty($_POST['db_name'])) {
		set_page_message(tr('Please specify a database name!'), 'warning');
		return;
	}

	$dmn_id = get_user_domain_id($sql, $user_id);

	if (isset($_POST['use_dmn_id']) && $_POST['use_dmn_id'] === 'on') {

		// we'll use domain_id in the name of the database;
		if (isset($_POST['id_pos']) && $_POST['id_pos'] === 'start') {
			$db_name = $dmn_id . "_" . clean_input($_POST['db_name']);
		} else if (isset($_POST['id_pos']) && $_POST['id_pos'] === 'end') {
			$db_name = clean_input($_POST['db_name']) . "_" . $dmn_id;
		}
	} else {
		$db_name = clean_input($_POST['db_name']);
	}

	if (strlen($db_name) > $cfg->MAX_SQL_DATABASE_LENGTH) {
		set_page_message(tr('Database name is too long!'), 'warning');
		return;
	}

	// have we such database in the system!?
	if (check_db_name($sql, $db_name)) {
		set_page_message(
			tr('Specified database name already exists!'),
			'warning'
		);
		return;
	}
	// are wildcards used?
	if (preg_match("/[%|\?]+/", $db_name)) {
		set_page_message(
			tr('Wildcards such as %% and ? are not allowed!'),
			'warning'
		);
		return;
	}

	$query = 'create database ' . quoteIdentifier($db_name);
	exec_query($sql, $query);

	$query = "
		INSERT INTO `sql_database`
			(`domain_id`, `sqld_name`)
		VALUES
			(?, ?)
	";

	exec_query($sql, $query, array($dmn_id, $db_name));

	update_reseller_c_props(get_reseller_id($dmn_id));

	write_log($_SESSION['user_logged'] . ": adds new SQL database: " . tohtml($db_name));
	set_page_message(tr('SQL database created successfully!'), 'notice');
	user_goto('sql_manage.php');
}

/**
 * check user sql permission
 */
function check_sql_permissions($sql, $user_id) {
	if (isset($_SESSION['sql_support']) && $_SESSION['sql_support'] == "no") {
		header("Location: index.php");
	}

	list($dmn_id,,,,,,,,,,,
		$dmn_sqld_limit
	) = get_domain_default_props($sql, $user_id);

	list($sqld_acc_cnt) = get_domain_running_sql_acc_cnt($sql, $dmn_id);

	if ($dmn_sqld_limit != 0 && $sqld_acc_cnt >= $dmn_sqld_limit) {
		set_page_message(tr('SQL accounts limit reached!'), 'warning');
		user_goto('sql_manage.php');
	}
}
?>
