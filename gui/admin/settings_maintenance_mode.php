<?php
/**
 * ispCP ω (OMEGA) a Virtual Hosting Control System
 *
 * @copyright 	2001-2006 by moleSoftware GmbH
 * @copyright 	2006-2010 by ispCP | http://isp-control.net
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
 * Portions created by the ispCP Team are Copyright (C) 2006-2010 by
 * isp Control Panel. All Rights Reserved.
 */

require '../include/ispcp-lib.php';

check_login(__FILE__);

$cfg = ispCP_Registry::get('Config');

$tpl = new ispCP_pTemplate();
$tpl->define_dynamic('page', $cfg->ADMIN_TEMPLATE_PATH . '/settings_maintenance_mode.tpl');

$tpl->assign(
	array(
		'TR_ADMIN_MAINTENANCEMODE_PAGE_TITLE' => tr('ispCP - Admin/Maintenance mode'),
		'THEME_COLOR_PATH' => "../themes/{$cfg->USER_INITIAL_THEME}",
		'THEME_CHARSET' => tr('encoding'),
		'ISP_LOGO' => get_logo($_SESSION['user_id'])
	)
);

$selected_on = '';
$selected_off = '';

if (isset($_POST['uaction']) AND $_POST['uaction'] == 'apply') {

	$maintenancemode = $_POST['maintenancemode'];
	$maintenancemode_message = clean_input($_POST['maintenancemode_message']);

	$db_cfg = ispCP_Registry::get('Db_Config');

	$db_cfg->MAINTENANCEMODE = $maintenancemode;
	$db_cfg->MAINTENANCEMODE_MESSAGE = $maintenancemode_message;

	$cfg->replaceWith($db_cfg);

	set_page_message(
		tr('Settings saved !'),
		'success'
	);
}

if ($cfg->MAINTENANCEMODE) {
	$selected_on = $cfg->HTML_SELECTED;
} else {
	$selected_off = $cfg->HTML_SELECTED;
}

// static page messages
gen_admin_mainmenu($tpl, $cfg->ADMIN_TEMPLATE_PATH . '/main_menu_system_tools.tpl');
gen_admin_menu($tpl, $cfg->ADMIN_TEMPLATE_PATH . '/menu_system_tools.tpl');

$tpl->assign(
	array(
		'TR_MAINTENANCEMODE' => tr('Maintenance mode'),
		'TR_MESSAGE_TEMPLATE_INFO' => tr('Under this mode only administrators can login'),
		'TR_MESSAGE_TYPE' => 'warning',
		'TR_MESSAGE' => tr('Message'),
		'MESSAGE_VALUE' => $cfg->MAINTENANCEMODE_MESSAGE,
		'SELECTED_ON' => $selected_on,
		'SELECTED_OFF' => $selected_off,
		'TR_ENABLED' => tr('Enabled'),
		'TR_DISABLED' => tr('Disabled'),
		'TR_APPLY_CHANGES' => tr('Apply changes')
	)
);

gen_page_message($tpl);

$tpl->parse('PAGE', 'page');
$tpl->prnt();

if ($cfg->DUMP_GUI_DEBUG) {
	dump_gui_debug();
}

unset_messages();
?>