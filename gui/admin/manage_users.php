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
$template = 'manage_users.tpl';

if (isset($_POST['details']) && !empty($_POST['details'])) {
	$_SESSION['details'] = $_POST['details'];
} else {
	if (!isset($_SESSION['details'])) {
		$_SESSION['details'] = "hide";
	}
}

if (isset($_SESSION['user_added'])) {
	unset($_SESSION['user_added']);

	set_page_message(tr('User added successfully'), 'success');
} else if (isset($_SESSION['reseller_added'])) {
	unset($_SESSION['reseller_added']);

	set_page_message(tr('Reseller added successfully'), 'success');
} else if (isset($_SESSION['user_updated'])) {
	unset($_SESSION['user_updated']);

	set_page_message(tr('User updated successfully'), 'success');
} else if (isset($_SESSION['user_deleted'])) {
	unset($_SESSION['user_deleted']);

	set_page_message(tr('User deleted successfully'), 'success');
} else if (isset($_SESSION['email_updated'])) {
	unset($_SESSION['email_updated']);

	set_page_message(tr('Email Updated successfully'), 'success');
} else if (isset($_SESSION['hdomain'])) {
	unset($_SESSION['hdomain']);

	set_page_message(
		tr('This user has a domain!<br />To delete the user first delete the domain!'),
		'warning'
	);
} else if (isset($_SESSION['user_disabled'])) {
	unset($_SESSION['user_disabled']);

	set_page_message(tr('User disabled successfully'), 'success');
}

// static page messages
$tpl->assign(
	array(
		'TR_PAGE_TITLE' => tr('ispCP - Admin/Manage Users')
	)
);

if (!$cfg->exists('HOSTING_PLANS_LEVEL')
	|| strtolower($cfg->HOSTING_PLANS_LEVEL) === 'admin') {
	$tpl->assign('EDIT_OPTION', true);
}

gen_admin_mainmenu($tpl, 'main_menu_users_manage.tpl');
gen_admin_menu($tpl, 'menu_users_manage.tpl');

get_admin_manage_users($tpl, $sql);

gen_page_message($tpl);

$tpl->display($template);

if ($cfg->DUMP_GUI_DEBUG) {
	dump_gui_debug();
}

unset_messages();
?>