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

if (isset($_GET['ticket_id']) && $_GET['ticket_id'] !== '' && is_int(intval($_GET['ticket_id']))) {
	
	$ticket = new Ticket($_GET['ticket_id']);

	$ticket->loadAll($sql);

	$back_url = ($ticket->status == 0) ? 'ticket_closed.php' : 'ticket_system.php';
		
	TicketSystem::deleteTicket($_GET['ticket_id'], $sql);
	
	set_page_message(tr('Support ticket deleted successfully!'));

	user_goto($back_url);
/*
 * Deletes all the ticket marked as open
 */
} elseif (isset($_GET['delete']) && $_GET['delete'] == 'open') {
	
	TicketSystem::deleteAllTicket($_SESSION['user_id'], $sql, 'open');
	
	set_page_message(tr('All open support tickets deleted successfully!'));

	user_goto('ticket_system.php');
/*
 * Deletes all the ticket marked as closed
 */
} elseif (isset($_GET['delete']) && $_GET['delete'] == 'closed') {
	
	TicketSystem::deleteAllTicket($_SESSION['user_id'], $sql, 'closed');
	
	set_page_message(tr('All closed support tickets deleted successfully!'));

	user_goto('ticket_closed.php');
	
} else {
	user_goto('ticket_system.php');
}
