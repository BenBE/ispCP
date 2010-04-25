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
$tpl->define_dynamic('page', Config::getInstance()->get('RESELLER_TEMPLATE_PATH') . '/ticket_create.tpl');
$tpl->define_dynamic('page_message', 'page');
$tpl->define_dynamic('logged_from', 'page');

// page functions.

function send_user_message(&$sql, $user_id, $user_created_by) {
	if (!isset($_POST['uaction']))
		return;

	if (empty($_POST['subj'])) {
		set_page_message(tr('Please specify message subject!'));
		return;
	}

	if (empty($_POST['user_message'])) {
		set_page_message(tr('Please type your message!'));
		return;
	}

	$user_message = clean_input($_POST["user_message"]);
	$ticket_status = 2;
	$ticket_level = 2;

	$ticket = new Ticket(null,
							clean_input($_POST['subj']),
							$_POST['urgency'],
							$ticket_status, 
							new TicketReply($user_message, $user_id, $user_created_by, time()),
							$ticket_level);
	
	TicketSystem::addTicket($ticket, $sql);
	
	set_page_message(tr('Message was sent.'));
	
	header('Location: ticket_system.php');
}

// common page data.

$theme_color = Config::getInstance()->get('USER_INITIAL_THEME');

$tpl->assign(
	array(
		'TR_CLIENT_NEW_TICKET_PAGE_TITLE' => tr('ispCP - Support system - New ticket'),
		'THEME_COLOR_PATH' => "../themes/$theme_color",
		'THEME_CHARSET' => tr('encoding'),
		'ISP_LOGO' => get_logo($_SESSION['user_id']),
	)
);

// dynamic page data.
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

send_user_message($sql, $_SESSION['user_id'], $_SESSION['user_created_by']);

// static page messages.

gen_reseller_mainmenu($tpl, Config::getInstance()->get('RESELLER_TEMPLATE_PATH') . '/main_menu_ticket_system.tpl');
gen_reseller_menu($tpl, Config::getInstance()->get('RESELLER_TEMPLATE_PATH') . '/menu_ticket_system.tpl');

gen_logged_from($tpl);

$userdata = array('OPT_URGENCY_1'=>'', 'OPT_URGENCY_2'=>'', 'OPT_URGENCY_3'=>'', 'OPT_URGENCY_4'=>'');
if (isset($_POST['urgency'])) {
	$userdata['URGENCY'] = intval($_POST['urgency']);
} else {
	$userdata['URGENCY'] = 2;
}
switch ($userdata['URGENCY']) {
	case 1:
		$userdata['OPT_URGENCY_1'] = ' selected="selected"';
		break;
	case 3:
		$userdata['OPT_URGENCY_3'] = ' selected="selected"';
		break;
	case 4:
		$userdata['OPT_URGENCY_4'] = ' selected="selected"';
		break;
	default:
		$userdata['OPT_URGENCY_2'] = ' selected="selected"';
		break;
}
$userdata['SUBJECT'] = isset($_POST['subj']) ? clean_input($_POST['subj'], true) : '';
$userdata['USER_MESSAGE'] = isset($_POST['user_message']) ? clean_input($_POST['user_message'], true) : '';
$tpl->assign($userdata);

$tpl->assign(
	array(
		'TR_NEW_TICKET' => tr('New ticket'),
		'TR_LOW' => tr('Low'),
		'TR_MEDIUM' => tr('Medium'),
		'TR_HIGH' => tr('High'),
		'TR_VERI_HIGH' => tr('Very high'),
		'TR_URGENCY' => tr('Priority'),
		'TR_EMAIL' => tr('Email'),
		'TR_SUBJECT' => tr('Subject'),
		'TR_YOUR_MESSAGE' => tr('Your message'),
		'TR_SEND_MESSAGE' => tr('Send message'),
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
