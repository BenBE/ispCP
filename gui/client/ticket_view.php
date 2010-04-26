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
 * The Original Code is "ispCP - ISP Control Panel".
 *
 * The Initial Developer of the Original is ispCP Team.
 * Portions created by Initial Developer are Copyright (C) 2006-2009 by
 * isp Control Panel. All Rights Reserved.
 */

require '../include/ispcp-lib.php';

check_login(__FILE__);

$tpl = new pTemplate();
$tpl->define_dynamic('page', Config::getInstance()->get('CLIENT_TEMPLATE_PATH') . '/ticket_view.tpl');
$tpl->define_dynamic('page_message', 'page');
$tpl->define_dynamic('logged_from', 'page');
$tpl->define_dynamic('tickets_list', 'page');
$tpl->define_dynamic('tickets_item', 'tickets_list');


// common page data.

$theme_color = Config::getInstance()->get('USER_INITIAL_THEME');

$tpl->assign(
	array(
		'TR_CLIENT_VIEW_TICKET_PAGE_TITLE' => tr('ispCP - Client: Support System: View Ticket'),
		'THEME_COLOR_PATH' => "../themes/$theme_color",
		'THEME_CHARSET' => tr('encoding'),
		'ISP_LOGO' => get_logo($_SESSION['user_id'])
	)
);

function send_user_message(&$sql, $user_id, $reseller_id, Ticket $ticket) {
	
	if (!isset($_POST['uaction'])) return;
	// close ticket
	elseif ($_POST['uaction'] == "close") {
		$ticket->changeStatus(0, $sql);
		return;
	} elseif ($_POST['uaction'] == "open") {
		// open ticket
		$ticket->changeStatus(3, $sql);
		return;
	} elseif (empty($_POST['user_message'])) {
		// no message check->error
		set_page_message(tr('Please type your message!'));
		return;
	}

	$ticket_date = time();
	$subject = clean_input($_POST['subject']);
	$user_message = clean_input($_POST["user_message"]);
	$ticket_status = 4;
	$ticket_reply = $_GET['ticket_id'];
	$urgency = $_POST['urgency'];
	$ticket_from = $user_id;
	$ticket_to = $reseller_id;

	$ticket->addReply(new TicketReply($user_message, $ticket_from, $ticket_to, time()), $sql);
	$ticket->changeStatus(1, $sql);
	
	set_page_message(tr('Message was sent.'));
	TicketSystem::sendTicketMessage($ticket_from, $ticket_to, $ticket->title, $user_message, $ticket->ID, $ticket->urgency);

}

function change_ticket_status($sql, Ticket $ticket) {

	if ($ticket->status == 0) {
		$ticket->changeStatus(0, $sql);
	} else if (!isset($_POST['uaction']) || $_POST['uaction'] == "open") {
		$ticket->changeStatus(3, $sql);
	} else {
		$ticket->changeStatus(4, $sql);
	}

}


// dynamic page data.
$query = "
  SELECT
    `support_system`
  FROM
    `reseller_props`
  WHERE
    `reseller_id` = ?
";

$rs = exec_query($sql, $query, array($_SESSION['user_created_by']));

if (!Config::getInstance()->get('ISPCP_SUPPORT_SYSTEM') || $rs->fields['support_system'] == 'no') {
	user_goto('index.php');
}

$reseller_id = $_SESSION['user_created_by'];
if (isset($_GET['ticket_id'])) {
	
	$ticket_id = $_GET['ticket_id'];

	if (isset($_GET['screenwidth'])) {
		$screenwidth = $_GET['screenwidth'];
	} else {
		$screenwidth = $_POST['screenwidth'];
	}

	if (!isset($screenwidth) || $screenwidth < 639) {
		$screenwidth = 1024;
	}
	$tpl->assign('SCREENWIDTH', $screenwidth);

	$ticket = new Ticket($_GET['ticket_id']);
	
	$ticket->loadAll($sql);
	
	send_user_message($sql, $_SESSION['user_id'], $reseller_id, $ticket);
	
	change_ticket_status($sql, $ticket);
	
	TicketSystem::genTicketView($tpl, $sql, $ticket, $screenwidth);
	
} else {
	set_page_message(tr('Ticket not found!'));
	user_goto('ticket_system.php');
}

// static page messages.

gen_client_mainmenu($tpl, Config::getInstance()->get('CLIENT_TEMPLATE_PATH') . '/main_menu_ticket_system.tpl');
gen_client_menu($tpl, Config::getInstance()->get('CLIENT_TEMPLATE_PATH') . '/menu_ticket_system.tpl');

gen_logged_from($tpl);

$tpl->assign(
	array(
		'TR_VIEW_SUPPORT_TICKET' => tr('View support ticket'),
		'TR_TICKET_URGENCY' => tr('Priority'),
		'TR_TICKET_SUBJECT' => tr('Subject'),
		'TR_TICKET_DATE' => tr('Date'),
		'TR_DELETE' => tr('Delete'),
		'TR_NEW_TICKET_REPLY' => tr('Send message reply'),
		'TR_REPLY' => tr('Send reply'),
		'TR_TICKET_FROM' => tr('From'),
		'TR_OPEN_TICKETS' => tr('Open tickets'),
		'TR_CLOSED_TICKETS' => tr('Closed tickets')
	)
);

gen_page_message($tpl);

$tpl->parse('PAGE', 'page');
$tpl->prnt();

if (Config::getInstance()->get('DUMP_GUI_DEBUG')) {
	dump_gui_debug();
}
