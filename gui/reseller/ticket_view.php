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

$query = "
  SELECT
    `support_system`
  FROM
    `reseller_props`
  WHERE
    `reseller_id` = ?
";

$rs = exec_query($sql, $query, array($_SESSION['user_id']));

if (!Config::getInstance()->get('ISPCP_SUPPORT_SYSTEM') || $rs->fields['support_system'] == 'no') {
	user_goto('index.php');
}

$tpl = new pTemplate();
$tpl->define_dynamic('page', Config::getInstance()->get('RESELLER_TEMPLATE_PATH') . '/ticket_view.tpl');
$tpl->define_dynamic('page_message', 'page');
$tpl->define_dynamic('logged_from', 'page');
$tpl->define_dynamic('tickets_list', 'page');
$tpl->define_dynamic('tickets_item', 'tickets_list');

// page functions.


// common page data.

$theme_color = Config::getInstance()->get('USER_INITIAL_THEME');

$tpl->assign(
	array(
		'TR_CLIENT_VIEW_TICKET_PAGE_TITLE' => tr('ispCP - Reseller: Support System: View Ticket'),
		'THEME_COLOR_PATH' => "../themes/$theme_color",
		'THEME_CHARSET' => tr('encoding'),
		'ISP_LOGO' => get_logo($_SESSION['user_id'])
	)
);

function send_user_message(&$sql, $user_id, $reseller_id, Ticket $ticket, &$screenwidth) {
	
	if (!isset($_POST['uaction'])) {
		return;
	} elseif (empty($_POST['user_message'])) { // no message check->error
		if (($_POST['uaction'] != "open") && ($_POST['uaction'] != "close")) {
			set_page_message(tr('Please type your message!'));
			return;
		}
	}

	$user_message = clean_input($_POST["user_message"]);
	
	$ticket_level = $ticket->level;

	if ($ticket_level != 1) {
		$ticket_to = $ticket->mainMessage->replyFrom;
		$ticket_from = $ticket->mainMessage->replyTo;
	} else {
		$ticket_to = $ticket->mainMessage->replyTo;
		$ticket_from = $ticket->mainMessage->replyFrom;
	}

	$urgency = $ticket->urgency;

	$ticket->addReply(new TicketReply($user_message, $ticket_to, $ticket_from, time()), $sql);
		
	$ticket->changeStatus(2, $sql);


	// close ticket
	if ($_POST['uaction'] == "close") {
		$ticket->changeStatus(0, $sql);
		set_page_message(tr('Ticket was closed!'));
	} elseif ($_POST['uaction'] == "open") { // open ticket
		$ticket->changeStatus(3, $sql);
		set_page_message(tr('Ticket was reopened!'));
	}

	set_page_message(tr('Message was sent.'));

	if ($_POST['uaction'] == "close") {
		if ($user_message != '') {
			$user_message .= "\n\n";
		}
		$user_message .= tr("Ticket was closed!");
	} elseif ($_POST['uaction'] == "open") {
		if ($user_message != '') {
			$user_message .= "\n\n";
		}
		$user_message .= tr("Ticket was reopened!");
	}

	TicketSystem::sendTicketMessage($ticket_from, $ticket_to, $ticket->title, $user_message, $ticket->ID, $ticket->urgency);
	
	user_goto('ticket_system.php');
}


function change_ticket_status_view($sql, Ticket $ticket) {
	
	$ticket_level = $ticket->level;
	
	if ($ticket->status == 0) return;

	$ticket_status = 3;
	// Did the reseller write an answer?
	if (isset($_POST['uaction'])
		&& $_POST['uaction'] != "open"
		&& $_POST['uaction'] != "close") {
		if ($ticket_level != 2) {
			// if ticket to user
			$ticket->changeStatus(2, $sql);
		} else {
			// if ticket to admin
			$ticket->changeStatus(5, $sql);
		}
	} else {
		$ticket->changeStatus(3, $sql);
	}

}

// dynamic page data.

$reseller_id = $_SESSION['user_created_by'];

if (isset($_GET['ticket_id'])) {
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
	
	change_ticket_status_view($sql, $ticket);

	send_user_message($sql, $_SESSION['user_id'], $reseller_id, $ticket, $screenwidth);

	TicketSystem::genTicketView($tpl, $sql, $ticket, $screenwidth);
} else {
	set_page_message(tr('Ticket not found!'));

	user_goto('ticket_system.php');
}

// static page messages.

gen_reseller_mainmenu($tpl, Config::getInstance()->get('RESELLER_TEMPLATE_PATH') . '/main_menu_ticket_system.tpl');
gen_reseller_menu($tpl, Config::getInstance()->get('RESELLER_TEMPLATE_PATH') . '/menu_ticket_system.tpl');

gen_logged_from($tpl);

$tpl->assign(
	array('TR_VIEW_SUPPORT_TICKET' => tr('View support ticket'),
		'TR_TICKET_URGENCY' => tr('Priority'),
		'TR_TICKET_SUBJECT' => tr('Subject'),
		'TR_TICKET_DATE' => tr('Date'),
		'TR_DELETE' => tr('Delete'),
		'TR_NEW_TICKET_REPLY' => tr('Send message reply'),
		'TR_REPLY' => tr('Send reply'),
		'TR_TICKET_FROM' => tr('From'),
		'TR_OPEN_TICKETS' => tr('Open tickets'),
		'TR_CLOSED_TICKETS' => tr('Closed tickets'),
	)
);

gen_page_message($tpl);

$tpl->parse('PAGE', 'page');
$tpl->prnt();

if (Config::getInstance()->get('DUMP_GUI_DEBUG')) {
	dump_gui_debug();
}
unset_messages();
