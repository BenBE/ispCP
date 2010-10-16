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

$tpl = ispCP_Registry::get('template');
$tpl->assign('PAGE_TITLE', tr('ispCP - Virtual Hosting Control System'));
$tpl->assign('PAGE_CONTENT', 'ispcp_updates.tpl');


/* BEGIN common functions */
function get_update_infos(&$tpl) {

	$cfg = ispCP_Registry::get('Config');

	if (!$cfg->CHECK_FOR_UPDATES) {
		$tpl->assign(
			array(
				'UPDATE_MESSAGE'	=> '',
				'UPDATE'			=> tr('Update checking is disabled!'),
				'INFOS'				=> tr('Enable update at') . " <a href=\"settings.php\">" . tr('Settings') . "</a>"
			)
		);
		$tpl->assign('TABLE_HEADER', 'no');
		return false;
	}

	if (ispCP_Update_Version::getInstance()->checkUpdateExists()) {
		$tpl->assign(
			array(
				'UPDATE_MESSAGE' => '',
				'UPDATE' => tr('New ispCP update is now available'),
				'INFOS' => tr('Get it at') . " <a href=\"http://www.isp-control.net/download.html\" class=\"link\" target=\"ispcp\">http://www.isp-control.net/download.html</a>"
			)
		);

	} else {
		if (ispCP_Update_Version::getInstance()->getErrorMessage() != "") {
			$tpl->assign(array('TR_MESSAGE' => ispCP_Update_Version::getInstance()->getErrorMessage()));
		}
		$tpl->assign('UPDATE_INFOS', '');
	}
}
/* END system functions */

/*
 *
 * static page messages.
 *
 */

gen_admin_menu($tpl, 'system_tools');

$tpl->assign(
	array(
		'TR_UPDATES_TITLE' => tr('ispCP updates'),
		'TR_AVAILABLE_UPDATES' => tr('Available ispCP updates'),
		'TR_MESSAGE' => tr('No new ispCP updates available'),
		'TR_UPDATE' => tr('Update'),
		'TR_INFOS' => tr('Update details')
	)
);

gen_page_message($tpl);

get_update_infos($tpl);

$tpl->prnt();

if ($cfg->DUMP_GUI_DEBUG) {
	dump_gui_debug();
}

unset_messages();
