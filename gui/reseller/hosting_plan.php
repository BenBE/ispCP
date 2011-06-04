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

// Begin page line
require '../include/ispcp-lib.php';

check_login(__FILE__);

$cfg = ispCP_Registry::get('Config');

$tpl = ispCP_TemplateEngine::getInstance();
$template = 'hosting_plan.tpl';

// static page messages
gen_logged_from($tpl);

gen_hp_table($tpl, $_SESSION['user_id']);

$tpl->assign(
	array(
		'TR_PAGE_TITLE'				=> tr('ispCP - Reseller/Main Index'),
		'TR_HOSTING_PLANS'			=> tr('Hosting plans'),
		'TR_PAGE_MENU'				=> tr('Manage hosting plans'),
		'TR_PURCHASING'				=> tr('Purchasing'),
		'TR_ADD_HOSTING_PLAN'		=> tr('Add hosting plan'),
		'TR_TITLE_ADD_HOSTING_PLAN'	=> tr('Add new user hosting plan'),
		'TR_BACK'					=> tr('Back'),
		'TR_TITLE_BACK'				=> tr('Return to previous menu'),
		'TR_MESSAGE_DELETE'			=> tr('Are you sure you want to delete %s?', true, '%s')
	)
);

gen_reseller_mainmenu($tpl, 'main_menu_hosting_plan.tpl');
gen_reseller_menu($tpl, 'menu_hosting_plan.tpl');

gen_hp_message($tpl);
gen_page_message($tpl);

$tpl->display($template);

if ($cfg->DUMP_GUI_DEBUG) {
	dump_gui_debug();
}
unset_messages();

// BEGIN FUNCTION DECLARE PATH
function gen_hp_message($tpl) {
	// global $externel_event, $hp_added, $hp_deleted, $hp_updated;
	global $external_event;

	if (isset($_SESSION["hp_added"])
		&& $_SESSION["hp_added"] == '_yes_') {
		$external_event = '_on_';
		set_page_message(tr('Hosting plan added!'), 'success');
		unset($_SESSION["hp_added"]);
		unset($GLOBALS['hp_added']);
	} else if (isset($_SESSION["hp_deleted"])
		&& $_SESSION["hp_deleted"] == '_yes_') {
		$external_event = '_on_';
		set_page_message(tr('Hosting plan deleted!'), 'success');
		unset($_SESSION["hp_deleted"]);
		unset($GLOBALS['hp_deleted']);
	} else if (isset($_SESSION["hp_updated"])
		&& $_SESSION["hp_updated"] == '_yes_') {
		$external_event = '_on_';
		set_page_message(tr('Hosting plan updated!'), 'success');
		unset($_SESSION["hp_updated"]);
		unset($GLOBALS['hp_updated']);
	} else if (isset($_SESSION["hp_deleted_ordererror"])
		&& $_SESSION["hp_deleted_ordererror"] == '_yes_') {
		//$external_event = '_on_';
		set_page_message(
			tr('Hosting plan can\'t be deleted, there are orders!'),
			'warning'
		);
		unset($_SESSION["hp_deleted_ordererror"]);
	}

} // End of gen_hp_message()

/**
 * Extract and show data for hosting plans
 * @param ispCP_TemplateEngine $tpl
 * @param int $reseller_id
 */
function gen_hp_table($tpl, $reseller_id) {
	global $external_event;

	$sql = ispCP_Registry::get('Db');
	$cfg = ispCP_Registry::get('Config');

	if (isset($cfg->HOSTING_PLANS_LEVEL)
		&& $cfg->HOSTING_PLANS_LEVEL === 'admin') {
		$query = "
			SELECT
				t1.`id`, t1.`reseller_id`, t1.`name`, t1.`props`, t1.`status`,
				t2.`admin_id`, t2.`admin_type`
			FROM
				`hosting_plans` AS t1,
				`admin` AS t2
			WHERE
				t2.`admin_type` = ?
			AND
				t1.`reseller_id` = t2.`admin_id`
			AND
				t1.`status` = 1
			ORDER BY
				t1.`name`
		";

		$rs = exec_query($sql, $query, 'admin');
		$tr_edit = tr('View details');
		$tpl->assign('HP_MENU_ADD', '');
	} else {
		$query = "
			SELECT
				`id`, `name`, `props`, `status`
			FROM
				`hosting_plans`
			WHERE
				`reseller_id` = ?
			ORDER BY
				`name`
		";
		$rs = exec_query($sql, $query, $reseller_id);
	}

	if ($rs->rowCount() == 0) {
		set_page_message(tr('No hosting plans found!'), 'notice');
		$tpl->assign('HP_TABLE', '');
	} else { // There is data for hosting plans :-)
		if ($external_event == '_off_') {
			$tpl->assign('HP_MESSAGE', '');
		}

		$tpl->assign(
			array(
				'TR_HOSTING_PLANS' 	=> tr('Hosting plans'),
				'TR_NOM' 			=> tr('No.'),
				'TR_EDIT' 			=> tr('Edit'),
				'TR_DELETE'			=> tr('Delete'),
				'PLAN_SHOW'			=> tr('Show hosting plan'),
				'TR_PLAN_NAME' 		=> tr('Name'),
				'TR_ACTION' 		=> tr('Actions')
			)
		);

		$coid = isset($cfg->CUSTOM_ORDERPANEL_ID)
			? $cfg->CUSTOM_ORDERPANEL_ID
			: '';
		$i = 1;

		while ($data = $rs->fetchRow()) {
			$status = ($data['status']) ? tr('Enabled') : tr('Disabled');
			$tpl->append(
				array(
					'PLAN_NOM'				=> $i++,
					'PLAN_NAME'				=> tohtml($data['name']),
					'PLAN_NAME2'			=> addslashes(clean_html($data['name'])),
					'PURCHASING'			=> $status,
					'CUSTOM_ORDERPANEL_ID'	=> $coid,
					'HP_ID'					=> $data['id'],
					'RESELLER_ID'			=> $_SESSION['user_id']
				)
			);
		}
	}
}
?>