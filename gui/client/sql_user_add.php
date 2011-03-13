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
$template = 'sql_user_add.tpl';

if (isset($_GET['id'])) {
	$db_id = $_GET['id'];
} else if (isset($_POST['id'])) {
	$db_id = $_POST['id'];
} else {
	user_goto('sql_manage.php');
}

// common page data
if (isset($_SESSION['sql_support']) && $_SESSION['sql_support'] == "no") {
	user_goto('index.php');
}

// dynamic page data
$sqluser_available = gen_sql_user_list($sql, $tpl, $_SESSION['user_id'], $db_id);
check_sql_permissions($tpl, $sql, $_SESSION['user_id'], $db_id, $sqluser_available);
gen_page_post_data($tpl, $db_id);
add_sql_user($sql, $_SESSION['user_id'], $db_id);

// static page messages
gen_logged_from($tpl);

check_permissions($tpl);

$tpl->assign(
	array(
		'TR_PAGE_TITLE' => tr('ispCP - Client/Add SQL User'),
		'TR_ADD_SQL_USER' => tr('Add SQL user'),
		'TR_USER_NAME' => tr('SQL user name'),
		'TR_USE_DMN_ID' => tr('Use numeric ID'),
		'TR_START_ID_POS' => tr('In front the name'),
		'TR_END_ID_POS' => tr('Behind the name'),
		'TR_ADD' => tr('Add'),
		'TR_CANCEL' => tr('Cancel'),
		'TR_ADD_EXIST' => tr('Add existing user'),
		'TR_PASS' => tr('Password'),
		'TR_PASS_REP' => tr('Repeat password'),
		'TR_SQL_USER_NAME' => tr('Existing SQL users')
	)
);

gen_client_mainmenu($tpl, 'main_menu_manage_sql.tpl');
gen_client_menu($tpl, 'menu_manage_sql.tpl');

gen_page_message($tpl);

$tpl->display($template);

if ($cfg->DUMP_GUI_DEBUG) {
	dump_gui_debug();
}

unset_messages();

// page functions

/**
 * @param ispCP_TemplateEngine $tpl
 * @param ispCP_Database $sql
 * @param int $user_id
 * @param int $db_id
 * @param bool $sqluser_available
 * @return void
 */
function check_sql_permissions(&$tpl, $sql, $user_id, $db_id, $sqluser_available) {
	list($dmn_id,,,,,,,,,,,,
		$dmn_sqlu_limit
	) = get_domain_default_props($sql, $user_id);

	list(,$sqlu_acc_cnt) = get_domain_running_sql_acc_cnt($sql, $dmn_id);

	if ($dmn_sqlu_limit != 0 && $sqlu_acc_cnt >= $dmn_sqlu_limit) {
		if (!$sqluser_available) {
			set_page_message(tr('SQL users limit reached!'), 'warning');
			user_goto('sql_manage.php');
		}
	} else {
		$tpl->assign('CREATE_SQLUSER', true);
	}

	$dmn_name = $_SESSION['user_logged'];

	$query = "
		SELECT
			t1.`sqld_id`, t2.`domain_id`, t2.`domain_name`
		FROM
			`sql_database` AS t1,
			`domain` AS t2
		WHERE
			t1.`sqld_id` = ?
		AND
			t2.`domain_id` = t1.`domain_id`
		AND
			t2.`domain_name` = ?
	";

	$rs = exec_query($sql, $query, array($db_id, $dmn_name));

	if ($rs->recordCount() == 0) {
		set_page_message(
			tr('User does not exist or you do not have permission to access this interface!'),
			'warning'
		);
		user_goto('sql_manage.php');
	}
}

/**
 * Returns an array with a list of the sqlusers of the current database
 * @param ispCP_Database $sql
 * @param int $db_id
 * @return array|bool
 */
function get_sqluser_list_of_current_db(&$sql, $db_id) {
	$query = "SELECT `sqlu_name` FROM `sql_user` WHERE `sqld_id` = ?";

	$rs = exec_query($sql, $query, $db_id);

	if ($rs->recordCount() == 0) {
		return false;
	} else {
		while (!$rs->EOF) {
			$userlist[] = $rs->fields['sqlu_name'];
			$rs->moveNext();
		}
	}

	return $userlist;
}

/**
 * @param ispCP_Database $sql
 * @param ispCP_TemplateEngine $tpl
 * @param int $user_id
 * @param int $db_id
 * @return bool
 */
function gen_sql_user_list(&$sql, &$tpl, $user_id, $db_id) {

	$cfg = ispCP_Registry::get('Config');

	$first_passed = true;
	$user_found = false;
	$oldrs_name = '';
	$userlist = get_sqluser_list_of_current_db($sql, $db_id);
	$dmn_id = get_user_domain_id($sql, $user_id);
	// Let's select all sqlusers of the current domain except the users of the current database
	$query = "
		SELECT
			t1.`sqlu_name`,
			t1.`sqlu_id`
		FROM
			`sql_user` AS t1,
			`sql_database` AS t2
		WHERE
			t1.`sqld_id` = t2.`sqld_id`
			AND
			t2.`domain_id` = ?
		AND
			t1.`sqld_id` <> ?
		ORDER BY
			t1.`sqlu_name`
	";

	$rs = exec_query($sql, $query, array($dmn_id, $db_id));

	while (!$rs->EOF) {
		// Checks if it's the first element of the combobox and set it as selected
		if ($first_passed) {
			$select = $cfg->HTML_SELECTED;
			$first_passed = false;
		} else {
			$select = '';
		}
		// 1. Compares the sqluser name with the record before (Is set as '' at the first time, see above)
		// 2. Compares the sqluser name with the userlist of the current database
		if ($oldrs_name != $rs->fields['sqlu_name'] && @!in_array($rs->fields['sqlu_name'], $userlist)) {
			$user_found = true;
			$oldrs_name = $rs->fields['sqlu_name'];
			$tpl->append(
				array(
					'SQLUSER_ID' => $rs->fields['sqlu_id'],
					'SQLUSER_SELECTED' => $select,
					'SQLUSER_NAME' => tohtml($rs->fields['sqlu_name'])
				)
			);
		}
		$rs->moveNext();
	}
	// Show the combobox in case there are other sqlusers
	if ($user_found) {
		$tpl->assign('SHOW_SQLUSER_LIST', true);
		return true;
	} else {
		return false;
	}
}

function check_db_user(&$sql, $db_user) {
	$query = "SELECT COUNT(`User`) AS cnt FROM mysql.`user` WHERE `User` = ?";

	$rs = exec_query($sql, $query, $db_user);
	return $rs->fields['cnt'];
}

/**
 * @todo
 * 	* Database user with same name can be added several times
 *  * If creation of database user fails in MySQL-Table, database user is already
 * 		in loclal ispcp table -> Error handling
 */
function add_sql_user(&$sql, $user_id, $db_id) {

	$cfg = ispCP_Registry::get('Config');

	if (!isset($_POST['uaction'])) {
		return;
	}

	// let's check user input
	if (empty($_POST['user_name']) && !isset($_POST['Add_Exist'])) {
		set_page_message(tr('Please type user name!'), 'warning');
		return;
	}

	if (empty($_POST['pass']) && empty($_POST['pass_rep'])
		&& !isset($_POST['Add_Exist'])) {
		set_page_message(tr('Please type user password!'), 'warning');
		return;
	}

	if ((isset($_POST['pass']) && isset($_POST['pass_rep']))
		&& $_POST['pass'] !== $_POST['pass_rep']
		&& !isset($_POST['Add_Exist'])) {
		set_page_message(tr('Entered passwords do not match!'), 'warning');
		return;
	}

	if (isset($_POST['pass'])
		&& strlen($_POST['pass']) > $cfg->MAX_SQL_PASS_LENGTH
		&& !isset($_POST['Add_Exist'])) {
		set_page_message(tr('Too long user password!'), 'warning');
		return;
	}

	if (isset($_POST['pass'])
		&& !preg_match('/^[[:alnum:]:!*+#_.-]+$/', $_POST['pass'])
		&& !isset($_POST['Add_Exist'])) {
		set_page_message(
			tr('Don\'t use special chars like "@, $, %..." in the password!'),
			'warning'
		);
		return;
	}

	if (isset($_POST['pass'])
		&& !chk_password($_POST['pass'])
		&& !isset($_POST['Add_Exist'])) {
		if ($cfg->PASSWD_STRONG) {
			set_page_message(
				sprintf(
					tr('The password must be at least %s chars long and contain letters and numbers to be valid.'),
					$cfg->PASSWD_CHARS
				), 'warning'
			);
		} else {
			set_page_message(
				sprintf(
					tr('Password data is shorter than %s signs or includes not permitted signs!'),
					$cfg->PASSWD_CHARS
				),
				'warning'
			);
		}
		return;
	}

	if (isset($_POST['Add_Exist'])) {
		$query = "SELECT `sqlu_pass` FROM `sql_user` WHERE `sqlu_id` = ?";
		$rs = exec_query($sql, $query, $_POST['sqluser_id']);

		if ($rs->recordCount() == 0) {
			set_page_message(
				tr('SQL-user not found! It might has been deleted by another user.'),
				'warning'
			);
			return;
		}
		$user_pass = decrypt_db_password($rs->fields['sqlu_pass']);
	} else {
		$user_pass = $_POST['pass'];
	}

	$dmn_id = get_user_domain_id($sql, $user_id);

	if (!isset($_POST['Add_Exist'])) {

		// we'll use domain_id in the name of the database;
		if (isset($_POST['use_dmn_id'])
			&& $_POST['use_dmn_id'] === 'on'
			&& isset($_POST['id_pos'])
			&& $_POST['id_pos'] === 'start') {
			$db_user = $dmn_id . "_" . clean_input($_POST['user_name']);
		} else if (isset($_POST['use_dmn_id'])
			&& $_POST['use_dmn_id'] === 'on'
			&& isset($_POST['id_pos'])
			&& $_POST['id_pos'] === 'end') {
			$db_user = clean_input($_POST['user_name']) . "_" . $dmn_id;
		} else {
			$db_user = clean_input($_POST['user_name']);
		}
	} else {
		$query = "SELECT `sqlu_name` FROM `sql_user` WHERE `sqlu_id` = ?";
		$rs = exec_query($sql, $query, $_POST['sqluser_id']);
		$db_user = $rs->fields['sqlu_name'];
	}

	if (strlen($db_user) > $cfg->MAX_SQL_USER_LENGTH) {
		set_page_message(tr('User name too long!'), 'warning');
		return;
	}
	// are wildcards used?

	if (preg_match("/[%|\?]+/", $db_user)) {
		set_page_message(
			tr('Wildcards such as %% and ? are not allowed!'),
			'warning'
		);
		return;
	}

	// have we such sql user in the system?!

	if (check_db_user($sql, $db_user) && !isset($_POST['Add_Exist'])) {
		set_page_message(
			tr('Specified SQL username name already exists!'),
			'warning'
		);
		return;
	}

	// add user in the ispcp table;

	$query = "
		INSERT INTO `sql_user`
			(`sqld_id`, `sqlu_name`, `sqlu_pass`)
		VALUES
			(?, ?, ?)
	";

	exec_query($sql, $query, array($db_id, $db_user, encrypt_db_password($user_pass)));

	update_reseller_c_props(get_reseller_id($dmn_id));

	$query = "
		SELECT
			`sqld_name` AS `db_name`
		FROM
			`sql_database`
		WHERE
			`sqld_id` = ?
		AND
			`domain_id` = ?
	";

	$rs = exec_query($sql, $query, array($db_id, $dmn_id));
	$db_name = $rs->fields['db_name'];
	$db_name = preg_replace("/([_%\?\*])/",'\\\$1',$db_name);

	// add user in the mysql system tables
	$query = "GRANT ALL PRIVILEGES ON ". quoteIdentifier($db_name) .".* TO ?@? IDENTIFIED BY ?";
	exec_query($sql, $query, array($db_user, "localhost", $user_pass));
	exec_query($sql, $query, array($db_user, "%", $user_pass));

	write_log($_SESSION['user_logged'] . ": add SQL user: " . tohtml($db_user));
	set_page_message(tr('SQL user successfully added!'), 'notice');
	user_goto('sql_manage.php');
}

/**
 * @param ispCP_TemplateEngine $tpl
 * @param int $db_id
 */
function gen_page_post_data(&$tpl, $db_id) {

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

	if (isset($_POST['uaction']) && $_POST['uaction'] === 'add_user') {
		$tpl->assign(
			array(
				'USER_NAME' => (isset($_POST['user_name'])) ? clean_html($_POST['user_name'], true) : '',
				'USE_DMN_ID' => (isset($_POST['use_dmn_id']) && $_POST['use_dmn_id'] === 'on') ? $cfg->HTML_CHECKED : '',
				'START_ID_POS_CHECKED' => (isset($_POST['id_pos']) && $_POST['id_pos'] !== 'end') ? $cfg->HTML_CHECKED : '',
				'END_ID_POS_CHECKED' => (isset($_POST['id_pos']) && $_POST['id_pos'] === 'end') ? $cfg->HTML_CHECKED : ''
			)
		);
	} else {
		$tpl->assign(
			array(
				'USER_NAME' => '',
				'USE_DMN_ID' => '',
				'START_ID_POS_CHECKED' => '',
				'END_ID_POS_CHECKED' => $cfg->HTML_CHECKED
			)
		);
	}

	$tpl->assign('ID', $db_id);
}
?>