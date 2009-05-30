<?php
/**
 * ispCP ω (OMEGA) a Virtual Hosting Control System
 *
 * @copyright	2001-2006 by moleSoftware GmbH
 * @copyright	2006-2009 by ispCP | http://isp-control.net
 * @version		SVN: $Id: ticket_create.php 1744 2009-05-07 03:21:47Z haeber $
 * @link		http://isp-control.net
 * @author		ispCP Team
 *
 * @license
 *   This program is free software; you can redistribute it and/or modify it under
 *   the terms of the MPL General Public License as published by the Free Software
 *   Foundation; either version 1.1 of the License, or (at your option) any later
 *   version.
 *   You should have received a copy of the MPL Mozilla Public License along with
 *   this program; if not, write to the Open Source Initiative (OSI)
 *   http://opensource.org | osi@opensource.org
 */

require '../include/ispcp-lib.php';

check_login(__FILE__);

$tpl = new pTemplate();
$tpl->define_dynamic('page', Config::get('RESELLER_TEMPLATE_PATH') . '/ticket_create.tpl');
$tpl->define_dynamic('page_message', 'page');
$tpl->define_dynamic('logged_from', 'page');

// page functions.

function send_user_message(&$sql, $user_id, $user_created_by) {
	if (!UserIO::POST_isset('uaction'))
		return;

	if (UserIO::POST_String('subj') == '') {
		set_page_message(tr('Please specify message subject!'));
		return;
	}

	if (UserIO::POST_Memo('user_message') == '') {
		set_page_message(tr('Please type your message!'));
		return;
	}

	$ticket_date = time();
	$urgency = UserIO::POST_Int('urgency');
	$subject = UserIO::POST_String('subj');
	$user_message = UserIO::POST_Memo('user_message');
	$ticket_status = 2;
	$ticket_reply = 0;
	$ticket_level = 2;

	$query = <<<SQL_QUERY
		INSERT INTO `tickets`
			(`ticket_level`,
			`ticket_from`,
			`ticket_to`,
			`ticket_status`,
			`ticket_reply`,
			`ticket_urgency`,
			`ticket_date`,
			`ticket_subject`,
			`ticket_message`)
		VALUES
			(?, ?, ?, ?, ?, ?, ?, ?, ?)
SQL_QUERY;

	$rs = exec_query($sql, $query, array($ticket_level,	$user_id, $user_created_by,
			$ticket_status,	$ticket_reply, $urgency, $ticket_date, $subject, $user_message));

	set_page_message(tr('Message was sent.'));
	send_tickets_msg($user_created_by, $user_id, $subject, $user_message, $ticket_reply, $urgency);
	header('Location: ticket_system.php');
}

// common page data.

$theme_color = Config::get('USER_INITIAL_THEME');

$tpl->assign(
	array(
		'TR_CLIENT_NEW_TICKET_PAGE_TITLE' => tr('ispCP - Support system - New ticket'),
		'THEME_COLOR_PATH' => "../themes/$theme_color",
		'THEME_CHARSET' => tr('encoding'),
		'ISP_LOGO' => get_logo($_SESSION['user_id']),
	)
);

// dynamic page data.

if (!Config::get('ISPCP_SUPPORT_SYSTEM')) {
	user_goto('index.php');
}

send_user_message($sql, $_SESSION['user_id'], $_SESSION['user_created_by']);

// static page messages.

gen_reseller_mainmenu($tpl, Config::get('RESELLER_TEMPLATE_PATH') . '/main_menu_ticket_system.tpl');
gen_reseller_menu($tpl, Config::get('RESELLER_TEMPLATE_PATH') . '/menu_ticket_system.tpl');

gen_logged_from($tpl);

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

$userdata = array('OPT_URGENCY_1'=>'', 'OPT_URGENCY_2'=>'', 'OPT_URGENCY_3'=>'', 'OPT_URGENCY_4'=>'');
$userdata['URGENCY'] = UserIO::POST_Int('urgency');
if (empty($userdata['URGENCY'])) $userdata['URGENCY'] = 2;

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
$userdata['SUBJECT'] = UserIO::HTML(UserIO::POST_String('subj'));
$userdata['USER_MESSAGE'] = UserIO::HTML(UserIO::POST_Memo('user_message'));
$tpl->assign($userdata);

$tpl->parse('PAGE', 'page');

$tpl->prnt();

if (Config::get('DUMP_GUI_DEBUG')) {
	dump_gui_debug();
}
unset_messages();
