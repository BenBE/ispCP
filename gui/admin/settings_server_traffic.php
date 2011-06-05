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
$template = 'settings_server_traffic.tpl';

// static page messages
$tpl->assign(
	array(
		'TR_PAGE_TITLE' => tr('ispCP - Admin/Server Traffic Settings'),
		'TR_MODIFY' => tr('Modify'),
		'TR_SERVER_TRAFFIC_SETTINGS' => tr('Server traffic settings'),
		'TR_SET_SERVER_TRAFFIC_SETTINGS' => tr('Set server traffic (0 for unlimited)'),
		'TR_MAX_TRAFFIC' => tr('Max traffic [MB]'),
		'TR_WARNING' => tr('Warning traffic [MB]'),
	)
);

gen_admin_mainmenu($tpl, 'main_menu_settings.tpl');
gen_admin_menu($tpl, 'menu_settings.tpl');

update_server_settings($sql);

generate_server_data($tpl, $sql);

gen_page_message($tpl);

if ($cfg->DUMP_GUI_DEBUG) {
	dump_gui_debug($tpl);
}

$tpl->display($template);

unset_messages();

/**
 * @todo What's about the outcommented code?
 */
function update_server_settings($sql) {

	if (!isset($_POST['uaction']) && !isset($_POST['uaction'])) {
		return;
	}
	/*global $data;
	$match = array();
	preg_match("/^(-1|0|[1-9][0-9]*)$/D", $data, $match);*/

	$max_traffic = clean_input($_POST['max_traffic']);

	$traffic_warning = $_POST['traffic_warning'];

	if (!is_numeric($max_traffic) || !is_numeric($traffic_warning)) {
		set_page_message(tr('Wrong data input!'), 'warning');
	}

	if ($traffic_warning > $max_traffic) {
		set_page_message(
			tr('Warning traffic is bigger than max traffic!'),
			'warning'
		);
		return;
	}

	if ($max_traffic < 0) {
		$max_traffic = 0;
	}
	if ($traffic_warning < 0) {
		$traffic_warning = 0;
	}

	$query = "
		UPDATE
			`straff_settings`
		SET
			`straff_max` = ?,
			`straff_warn` = ?
	";
	exec_query($sql, $query, array($max_traffic, $traffic_warning));

	set_page_message(
		tr('Server traffic settings updated successfully!'),
		'success'
	);
}

/**
 * @param ispCP_TemplateEngine $tpl
 * @param ispCP_Database $sql
 */
function generate_server_data($tpl, $sql) {

	$query = "
		SELECT
			`straff_max`,
			`straff_warn`
		FROM
			`straff_settings`
	";

	$rs = exec_query($sql, $query);

	$tpl->assign(
		array(
			'MAX_TRAFFIC' => $rs->fields['straff_max'],
			'TRAFFIC_WARNING' => $rs->fields['straff_warn'],
		)
	);
}
?>