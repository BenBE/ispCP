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
$template = 'sessions_manage.tpl';

// static page messages
$tpl->assign(
	array(
		'TR_PAGE_TITLE' => tr('ispCP - Admin/Manage Sessions'),
		'TR_MANAGE_USER_SESSIONS' => tr('Manage user sessions'),
		'TR_USERNAME' => tr('Username'),
		'TR_USERTYPE' => tr('User type'),
		'TR_LOGIN_ON' => tr('Last access'),
		'TR_OPTIONS' => tr('Options'),
		'TR_DELETE' => tr('Kill session'),
	)
);

gen_admin_mainmenu($tpl, 'main_menu_users_manage.tpl', true);
gen_admin_menu($tpl, 'menu_users_manage.tpl', true);

kill_session($sql);

gen_user_sessions($tpl, $sql);

gen_page_message($tpl);

$tpl->display($template);

if ($cfg->DUMP_GUI_DEBUG) {
	dump_gui_debug();
}

unset_messages();

function kill_session($sql) {

	if (isset($_GET['kill']) && $_GET['kill'] !== ''
		&& $_GET['kill'] !== $_SESSION['user_logged']) {
		$admin_name = $_GET['kill'];
		$query = "
			DELETE FROM
				`login`
			WHERE
				`session_id` = ?
		";

		exec_query($sql, $query, $admin_name);
		set_page_message(tr('User session was killed!'), 'notice');
		write_log($_SESSION['user_logged'] . ": killed user session: $admin_name!");
	}
}

/**
 * @param ispCP_TemplateEngine $tpl
 * @param ispCP_Database $sql
 */
function gen_user_sessions(&$tpl, &$sql) {
	$query = "
		SELECT
			*
		FROM
			`login`
	";

	$rs = exec_query($sql, $query);

	$row = 1;
	while (!$rs->EOF) {
		$tpl->assign(
			array(
				'ADMIN_CLASS' => ($row++ % 2 == 0) ? 'content2' : 'content',
			)
		);

		if ($rs->fields['user_name'] === NULL) {
			$tpl->assign(
				array(
					'ADMIN_USERNAME' => tr('Unknown'),
					'LOGIN_TIME' => date("G:i:s", $rs->fields['lastaccess'])
				)
			);
		} else {
			$tpl->assign(
				array(
					'ADMIN_USERNAME' => $rs->fields['user_name'],
					'LOGIN_TIME' => date("G:i:s", $rs->fields['lastaccess'])
				)
			);
		}

		$sess_id = session_id();

		if ($sess_id === $rs->fields['session_id']) {
			$tpl->assign('KILL_LINK', 'sessions_manage.php');
		} else {
			$tpl->assign('KILL_LINK', 'sessions_manage.php?kill=' . $rs->fields['session_id']);
		}


		$rs->moveNext();
	}
}
?>