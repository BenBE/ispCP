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

if (!Config::getInstance()->get('ISPCP_SUPPORT_SYSTEM')) {
	user_goto('index.php');
}

$tpl = new pTemplate();
$tpl->define_dynamic('page', Config::getInstance()->get('ADMIN_TEMPLATE_PATH') . '/ticket_system.tpl');
$tpl->define_dynamic('page_message', 'page');
$tpl->define_dynamic('tickets_list', 'page');
$tpl->define_dynamic('tickets_item', 'tickets_list');
$tpl->define_dynamic('scroll_prev_gray', 'page');
$tpl->define_dynamic('scroll_prev', 'page');
$tpl->define_dynamic('scroll_next_gray', 'page');
$tpl->define_dynamic('scroll_next', 'page');


// common page data.
$theme_color = Config::getInstance()->get('USER_INITIAL_THEME');
$tpl->assign(
	array(
		'TR_CLIENT_ENABLE_AUTORESPOND_PAGE_TITLE'	=> tr('ispCP - Client/Enable Mail Autoresponder'),
		'THEME_COLOR_PATH'							=> "../themes/$theme_color",
		'THEME_CHARSET'								=> tr('encoding'),
		'ISP_LOGO'									=> get_logo($_SESSION['user_id'])
	)
);

// dynamic page data.
TicketSystem::genTicketsList($tpl, $sql, $_SESSION['user_id']);
// static page messages.

gen_admin_mainmenu($tpl, Config::getInstance()->get('ADMIN_TEMPLATE_PATH') . '/main_menu_ticket_system.tpl');
gen_admin_menu($tpl, Config::getInstance()->get('ADMIN_TEMPLATE_PATH') . '/menu_ticket_system.tpl');

$tpl->assign(
	array(
		'TR_SUPPORT_SYSTEM'	=> tr('Support system'),
		'TR_SUPPORT_TICKETS'=> tr('Support tickets'),
		'TR_TICKET_FROM'	=> tr('From'),
		'TR_TICKET_TO'		=> tr('To'),
		'TR_STATUS'			=> tr('Status'),
		'TR_NEW'			=> ' ',
		'TR_ACTION'			=> tr('Action'),
		'TR_URGENCY'		=> tr('Priority'),
		'TR_SUBJECT'		=> tr('Subject'),
		'TR_LAST_DATA'		=> tr('Last reply'),
		'TR_DELETE_ALL'		=> tr('Delete all'),
		'TR_OPEN_TICKETS'	=> tr('Open tickets'),
		'TR_CLOSED_TICKETS'	=> tr('Closed tickets'),
		'TR_DELETE'			=> tr('Delete'),
		'TR_MESSAGE_DELETE'	=> tr('Are you sure you want to delete %s?', true, '%s') ,
		)
	);

gen_page_message($tpl);

$tpl->parse('PAGE', 'page');
$tpl->prnt();

if (Config::getInstance()->get('DUMP_GUI_DEBUG')) {
	dump_gui_debug();
}
unset_messages();
