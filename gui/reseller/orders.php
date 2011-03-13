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
$template = 'orders.tpl';

// static page messages
gen_logged_from($tpl);

gen_order_page($tpl, $sql, $_SESSION['user_id']);

$tpl->assign(
	array(
		'TR_PAGE_TITLE'				=> tr('ispCP - Reseller/Order management'),
		'TR_MANAGE_ORDERS'			=> tr('Manage Orders'),
		'TR_ID'						=> tr('ID'),
		'TR_DOMAIN'					=> tr('Domain'),
		'TR_USER'					=> tr('Customer data'),
		'TR_ACTION'					=> tr('Action'),
		'TR_STATUS'					=> tr('Order'),
		'TR_EDIT'					=> tr('Edit'),
		'TR_DELETE'					=> tr('Delete'),
		'TR_DETAILS'				=> tr('Details'),
		'TR_HP'						=> tr('Hosting plan'),
		'TR_MESSAGE_DELETE_ACCOUNT'	=> tr('Are you sure you want to delete this order?', true),
		'TR_ADD'					=> tr('Add/Details')
	)
);

gen_reseller_mainmenu($tpl, 'main_menu_orders.tpl');
gen_reseller_menu($tpl, 'menu_orders.tpl');

gen_page_message($tpl);

$tpl->display($template);

if ($cfg->DUMP_GUI_DEBUG) {
	dump_gui_debug();
}
unset_messages();

/*
 * Functions
 */

/**
 * @param ispCP_TemplateEngine $tpl
 * @param ispCP_Database $sql
 * @param int $user_id
 */
function gen_order_page(&$tpl, &$sql, $user_id) {
	$cfg = ispCP_Registry::get('Config');

	$start_index = 0;
	// NXW: Unused variable so...
	// $current_psi = 0;

	if (isset($_GET['psi']) && is_numeric($_GET['psi'])) {
		$start_index = $_GET['psi'];
		// NXW: Unused variable so...
		// $current_psi = $_GET['psi'];
	}

	$rows_per_page = $cfg->DOMAIN_ROWS_PER_PAGE;
	// count query
	$count_query = "
		SELECT
			COUNT(`id`) AS cnt
		FROM
			`orders`
		WHERE
			`user_id` = ?
		AND
			`status` != ?
	";
	// let's count
	$rs = exec_query($sql, $count_query, array($user_id, 'added'));
	$records_count = $rs->fields['cnt'];

	$query = "
		SELECT
			*
		FROM
			`orders`
		WHERE
			`user_id` = ?
		AND
			`status` != ?
		ORDER BY
			`date` DESC
		LIMIT
			$start_index, $rows_per_page
	";
	$rs = exec_query($sql, $query, array($user_id, 'added'));

	$prev_si = $start_index - $rows_per_page;

	if ($start_index == 0) {
		$tpl->assign('SCROLL_PREV', '');
	} else {
		$tpl->assign(
			array(
				'SCROLL_PREV_GRAY' => '',
				'PREV_PSI' => $prev_si
			)
		);
	}

	$next_si = $start_index + $rows_per_page;

	if ($next_si + 1 > $records_count) {
		$tpl->assign('SCROLL_NEXT', '');
	} else {
		$tpl->assign(
			array(
				'SCROLL_NEXT_GRAY' => '',
				'NEXT_PSI' => $next_si
			)
		);
	}

	if ($rs->recordCount() == 0) {
		set_page_message(tr('You do not have new orders!'), 'notice');
		$tpl->assign('ORDERS_TABLE', '');
		$tpl->assign('SCROLL_NEXT_GRAY', '');
		$tpl->assign('SCROLL_PREV_GRAY', '');
	} else {
		while (!$rs->EOF) {
			$plan_id = $rs->fields['plan_id'];
			$order_status = tr('New order');
			// let's get hosting plan name
			$planname_query = "
				SELECT
					`name`
				FROM
					`hosting_plans`
				WHERE
					`id` = ?
			";
			$rs_planname = exec_query($sql, $planname_query, $plan_id);
			$plan_name = $rs_planname->fields['name'];

			$status = $rs->fields['status'];
			if ($status === 'update') {
				$customer_id = $rs->fields['customer_id'];
				$cusrtomer_query = "
					SELECT
						*
					FROM
						`admin`
					WHERE
						`admin_id` = ?
				";
				$rs_customer = exec_query($sql, $cusrtomer_query, $customer_id);
				$user_details = tohtml($rs_customer->fields['fname']) . "&nbsp;"
					. tohtml($rs_customer->fields['lname'])
					. "<br /><a href=\"mailto:" . tohtml($rs_customer->fields['email'])
					. "\" class=\"link\">" . tohtml($rs_customer->fields['email'])
					. "</a><br />" . tohtml($rs_customer->fields['zip'])
					. "&nbsp;" . tohtml($rs_customer->fields['city'])
					. "&nbsp;" . tohtml($rs_customer->fields['state'])
					. "&nbsp;" . tohtml($rs_customer->fields['country']);
				$order_status = tr('Update order');
				$tpl->assign('LINK', 'orders_update.php?order_id=' . $rs->fields['id']);
			} else {
				$user_details = $rs->fields['fname'] . "&nbsp;"
					. tohtml($rs->fields['lname'])
					. "<br /><a href=\"mailto:" . tohtml($rs->fields['email'])
					. "\" class=\"link\">" . tohtml($rs->fields['email'])
					. "</a><br />" . tohtml($rs->fields['zip'])
					. "&nbsp;" . tohtml($rs->fields['city'])
					. "&nbsp;" . tohtml($rs->fields['state'])
					. "&nbsp;" . tohtml($rs->fields['country']);
				$tpl->assign('LINK', 'orders_details.php?order_id=' . $rs->fields['id']);
			}
			$tpl->assign(
				array(
					'ID'		=> $rs->fields['id'],
					'HP'		=> tohtml($plan_name),
					'DOMAIN'	=> tohtml($rs->fields['domain_name']),
					'USER'		=> $user_details,
					'STATUS'	=> $order_status,
				)
			);

			$rs->moveNext();
		}
	}
}
?>