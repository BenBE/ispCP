<?php
/**
 * ispCP ω (OMEGA) a Virtual Hosting Control System
 *
 * @copyright 	2006-2009 by ispCP | http://isp-control.net
 * @version 	$Id$
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

/**
 *	This class could manage a set of ticket
 *
 **/
class TicketSystem{

	/**
	 * 	Add Ticket
	 * 
	 * 	This method will post a ticket in the system.
	 * 
	 *	@access static
	 *	@param		Ticket			$ticket		Ticket that needs to be added
	 *	@param		DBInterface		$facility	Database Handle
	 */
	static function addTicket(Ticket $ticket, $facility){
		$query = <<<SQL
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
SQL;
		$res = exec_query($facility, $query, array(
										$ticket->level,
										$ticket->mainMessage->replyFrom,
										$ticket->mainMessage->replyTo,
										$ticket->status,
										0,
										$ticket->urgency,
										$ticket->mainMessage->date,
										$ticket->title,
										$ticket->mainMessage->message														
						));
						
		TicketSystem::sendTicketMessage($ticket->mainMessage->replyTo, $ticket->mainMessage->replyFrom, $ticket->title, $ticket->mainMessage->message, 0, $ticket->urgency);
		
	}
	
	/**
	 * 	Delete Ticket
	 * 
	 *	This method will entirely remove a ticket with all of its replies.
	 *
	 *	@access static
	 *	@param	integer			$ticketId	Ticket Id
	 *	@param	DBInterface		$facility	Database Handle
	 *
	 */
	static function deleteTicket($ticketId, $sql){
		$query = <<<SQL_QUERY
					DELETE FROM
						`tickets`
					WHERE
						`ticket_id` = ?
					OR
						`ticket_reply` = ?
SQL_QUERY;

		$rs = exec_query($sql, $query, array($ticketId, $ticketId));	
	}
	
	/**
	 * 	Delete All Ticket
	 * 
	 *	This method will entirely remove all the tickets, with their own replies, whose
	 *	status it's passed as parameter
	 *
	 *	@access static
	 *	@param	integer			$userId	User Id
	 *	@param	DBInterface		$facility	Database Handle
	 *	@param	String			$status		open/closed
	 *
	 */
	static function deleteAllTicket($userId, $sql, $status = 'open'){
		
		switch($status){
			case "open":
					$query = <<<SQL_QUERY
						DELETE FROM
							`tickets`
						WHERE
							(`ticket_from` = ? OR `ticket_to` = ?)
						AND
							`ticket_status` != '0'
SQL_QUERY;
				break;
			
			case "closed":
				$query = <<<SQL_QUERY
					DELETE FROM
						`tickets`
					WHERE
						(`ticket_from` = ? OR `ticket_to` = ?)
					AND
						`ticket_status` = '0'
SQL_QUERY;
			break;
		}
		

		$rs = exec_query($sql, $query, array($userId, $userId));	
	}
	
	/**
	 * Get Ticket
	 *
	 * This method will return all the ticket(s) asssociated to the passed ID.
	 *
	 *	TODO: use type to manage different kind of $id
	 *
	 * @access static
	 * @param 		Integer		$id				Id 
	 * @param		String		$type			open/closed
	 * @param		Integer		$start_index	Default: 0, this represents the lower limit
	 * @param		Integer		$rows_per_page	Default: 25, this represents the upper limit
	 * @return 		Ticket[]		
 	 */
	static function getTicket($id, $type = 'user_id', $start_index = 0, $rows_per_page = 25, &$sql){
		
		switch($type){
			case "closed":
							$query = <<<SQL
						SELECT
							`tickets`.*
						FROM
							`tickets`
						WHERE
							(`ticket_from` = ? OR `ticket_to` = ?)
						AND
							`ticket_status` = 0
						AND
							`ticket_reply` = 0
						ORDER BY
							`ticket_date` DESC
						LIMIT
							$start_index, $rows_per_page		
SQL;
				break;
			default:
							$query = <<<SQL
						SELECT
							`tickets`.*
						FROM
							`tickets`
						WHERE
							(`ticket_from` = ? OR `ticket_to` = ?)
						AND
							`ticket_status` != 0
						AND
							`ticket_reply` = 0
						ORDER BY
							`ticket_date` DESC
						LIMIT
							$start_index, $rows_per_page		
SQL;
		}
		
		$results = exec_query($sql, $query, array($id, $id));
		if(!$results || ($results->RecordCount() == 0))
			return null;
		while (!$results->EOF) {
			$tickets[] = new Ticket(
								$results->fields['ticket_id'],
								$results->fields['ticket_subject'],
								$results->fields['ticket_urgency'],
								$results->fields['ticket_status'],
								new TicketReply(
											$results->fields['ticket_message'],
											$results->fields['ticket_from'],
											$results->fields['ticket_to'],
											$results->fields['ticket_date']				
								));
			$results->MoveNext();
		}
		return $tickets; 
	}
	
	
	// TODO
	// public function exportTicketAsXML(array $options = null);
	
	/**
	 * Informs an user about a ticket creation/update and writes a line to the log.
	 *
	 * @author		ispCP Team
	 * @copyright	2006-2009 by ispCP | http://isp-control.net
	 * @version		1.0
	 *
	 * @access	static
	 * @param	string		$to_id				reference to sql connection
	 * @param	string		$from_id			ticket to get last date for
	 * @param	string		$ticket_subject		ticket subject
	 * @param	string  	$ticket_message		ticket content / message
	 * @param	int			$ticket_status		ticket status
	 * @param	int			$urgency			ticket urgency
	 */
	static function sendTicketMessage($to_id, $from_id, $ticket_subject, $ticket_message, $ticket_status, $urgency) {
		$sql = Database::getInstance();
		global $admin_login;
		// To information
		$query = "SELECT `fname`, `lname`, `email`, `admin_name` FROM `admin` WHERE `admin_id` = ?";
	
		$res = exec_query($sql, $query, $to_id);
		$to_email = $res->fields['email'];
		$to_fname = $res->fields['fname'];
		$to_lname = $res->fields['lname'];
		$to_uname = $res->fields['admin_name'];
		// From information
		$query = "SELECT `fname`, `lname`, `email`, `admin_name` FROM `admin` WHERE `admin_id` = ?";
	
		$res = exec_query($sql, $query, $from_id);
		$from_email = $res->fields['email'];
		$from_fname = $res->fields['fname'];
		$from_lname = $res->fields['lname'];
		$from_uname = $res->fields['admin_name'];
		// Prepare message
		$subject = tr("[Ticket]") . " {SUBJ}";
		if ($ticket_status == 0) {
			$message = tr("Hello %s!\n\nYou have a new ticket:\n", "{TO_NAME}");
		} else {
			$message = tr("Hello %s!\n\nYou have an answer for this ticket:\n", "{TO_NAME}");
		}
		$message .= "\n".tr("Priority: %s\n", "{PRIORITY}");
		$message .= "\n" . $ticket_message;
		$message .= "\n\n" . tr("Log in to answer") . ' ' . Config::getInstance()->get('BASE_SERVER_VHOST_PREFIX') . Config::getInstance()->get('BASE_SERVER_VHOST');
	
		// Format addresses
		if ($from_fname && $from_lname) {
			$from = '"' . encode($from_fname . ' ' . $from_lname) . "\" <" . $from_email . ">";
			$fromname = "$from_fname $from_lname";
		} else {
			$from = $from_email;
			$fromname = $from_uname;
		}
	
		if ($to_fname && $to_lname) {
			$to = '"' . encode($to_fname . ' ' . $to_lname) . "\" <" . $to_email . ">";
			$toname = "$to_fname $to_lname";
		} else {
			$toname = $to_uname;
			$to = $to_email;
		}
	
		$priority = get_ticket_urgency($urgency);
	
		// Prepare and send mail
		$search = array();
		$replace = array();
	
		$search [] = '{SUBJ}';
		$replace[] = $ticket_subject;
		$search [] = '{TO_NAME}';
		$replace[] = $toname;
		$search [] = '{FROM_NAME}';
		$replace[] = $fromname;
		$search [] = '{PRIORITY}';
		$replace[] = $priority;
	
		$subject = str_replace($search, $replace, $subject);
		$message = str_replace($search, $replace, $message);
	
		$headers = "From: " . $from . "\n";
	
		$headers .= "MIME-Version: 1.0\nContent-Type: text/plain; charset=utf-8\nContent-Transfer-Encoding: 8bit\n";
	
		$headers .= "X-Mailer: ispCP " . Config::getInstance()->get('Version') . " Tickets Mailer";
	
		$mail_result = mail($to, encode($subject), $message, $headers);
		$mail_status = ($mail_result) ? 'OK' : 'NOT OK';
		write_log(sprintf("%s send ticket To: %s, From: %s, Status: %s!", $_SESSION['user_logged'], $toname . ": " . $to_email, $fromname . ": " . $from_email, $mail_status));
	}
	
	/**
	 * genTicketTo
	 * 
	 * This method is used in the generation of the page. 
	 * 
	 * @access 	static
	 * @param 	Array		$toInfo		Informations about the receiver
	 * @param 	Integer		$user_id	User ID
	 * @param 	Boolean		$html		If true, returns the string in html format
	 * @return 	String
	 */
	static function genTicketTo($toInfo, $user_id, $html = false) {
		
		if(isset($toInfo(['getFullName'])))
			$fullName = ($html) ? $fullName = htmlspecialchars($toInfo['getFullName']) : $toInfo['getFullName'];
		else if(isset($toInfo['getUserName']))
			$fullName = ($html) ? $fullName = htmlspecialchars($toInfo['getUserName']) : $toInfo['getUserName'];
			
		return ($toInfo['getID'] == $user_id) ? "<b>$fullName</b>" : $fullName;
	}
	
	/**
	 * Generate Tickets List
	 * 
	 * This function will display a list of ticket. It's used in ticket_system/closed.php
	 * I've put it here since is shared between admin/reseller/client.
	 * 
	 * @access 	public
	 * @param	Template			$tpl
	 * @param	Database Handle		$sql
	 * @param	Integer				$user_id
	 * @param	String				$status		'open'/'closed'
	 * */
	static function genTicketsList(&$tpl, &$sql, $user_id, $status = 'open') {
		
		$start_index = (isset($_GET['psi'])) ? $_GET['psi'] : 0;
		
		$rows_per_page = Config::getInstance()->get('DOMAIN_ROWS_PER_PAGE');
		
		$tickets = TicketSystem::getTicket($user_id, $status, $start_index, $rows_per_page, $sql);
		
		if($tickets == null){
			$tpl->assign(
				array(
					'TICKETS_LIST'	=> '',
					'SCROLL_PREV'	=> '',
					'SCROLL_NEXT'	=> ''
				)
			);
	
			set_page_message(tr('You have no support tickets.'));
		
		} else {
			$prev_si = $start_index - $rows_per_page;
	
			if ($start_index == 0) {
				$tpl->assign('SCROLL_PREV', '');
			} else {
				$tpl->assign(
					array(
						'SCROLL_PREV_GRAY'	=> '',
						'PREV_PSI'			=> $prev_si
					)
				);
			}
	
			$next_si = $start_index + $rows_per_page;
	
			if ($next_si + 1 > count($tickets)) {
				$tpl->assign('SCROLL_NEXT', '');
			} else {
				$tpl->assign(
					array(
						'SCROLL_NEXT_GRAY'	=> '',
						'NEXT_PSI'	=> $next_si
					)
				);
			}
		
			$i = 0;
			foreach($tickets as $ticket){
				
				if($status == 'open'){
				$ticket_status	= $ticket->status;
				
					if ($ticket_status == 1 || $ticket_status == 2) {
						$tpl->assign(array('NEW' => tr("[New]")));
					} else if ($ticket_status == 4 || $ticket_status == 5) {
						$tpl->assign(array('NEW' => tr("[Re]")));
					} else {
						$tpl->assign(array('NEW' => " "));
					}
					
				}else
					$tpl->assign(array('NEW' => " "));
				
				$ticket->loadPost($sql);
					
				$tpl->assign(
					array(
						'ID'		=> $ticket->ID,
						'FROM'		=> htmlspecialchars($ticket->mainMessage->getTicketFrom($sql)),
						'TO'		=> TicketSystem::genTicketTo($ticket->mainMessage->getTicketTo($sql,array('getID','getFullName')), $user_id),
						'LAST_DATE'	=> ( ($res = $ticket->getLastDate($date_formt = Config::getInstance()->get('DATE_FORMAT'))) == null ) ? tr('Never') : $res,  
						'SUBJECT'	=> addslashes(clean_html($ticket->title)),
						'SUBJECT2'	=> addslashes(clean_html($ticket->title)),
						'CONTENT'	=> ($i++ % 2 == 0) ? 'content' : 'content2',
						'URGENCY' 	=> get_ticket_urgency($ticket->urgency)
					)
				);
				
				$tpl->parse('TICKETS_ITEM', '.tickets_item');
							
			}		
		}
	}

	/**
	 * Generate Ticket View
	 * 
	 * This function will generate the details of a ticket, used in ticket_view.php
	 * 
	 * @access static
	 * @param 	Template			$tpl
	 * @param 	Database Handle		$sql
	 * @param 	Ticket				$ticket
	 * @param 	Integer				$screenwidth
	 */
	
	static function genTicketView(&$tpl, &$sql, Ticket $ticket, $screenwidth = null) {
		
		$user_id = $_SESSION['user_id'];
		
		try{
			
			$ticket_urgency = $ticket->urgency;
			$ticket_subject = $ticket->title;
			$ticket_status 	= $ticket->status;
	
			if ($ticket_status == 0) {
				$tr_action = tr("Open ticket");
				$action = "open";
			} else {
				$tr_action = tr("Close ticket");
				$action = "close";
			}
			
			$name = $ticket->mainMessage->getTicketFrom($sql,array('getFullName'));
	
			$tpl->assign(array(
					'URGENCY' 		=> get_ticket_urgency($ticket_urgency),
					'URGENCY_ID' 	=> $ticket_urgency,
					'FROM'			=> htmlspecialchars($name['getFullName'])
				));
			
				
			$ticket_content = wordwrap($ticket->mainMessage->message, round(($screenwidth-200) / 7), "\n");
	
			$tpl->assign(
				array(
					'TR_ACTION' 		=> $tr_action,
					'ACTION' 			=> $action,
					'DATE' 				=> date(Config::getInstance()->get('DATE_FORMAT'), $ticket->getOpenDate($sql)),
					'SUBJECT' 			=> htmlspecialchars($ticket->title),
					'TICKET_CONTENT' 	=> nl2br(htmlspecialchars($ticket_content)),
					'ID' 				=> $ticket->ID
				)
			);
	
			$tpl->parse('TICKETS_ITEM', 'tickets_item');
	
			
			{
				if(!empty($ticket->replies)){
					/*
					 *	Since replies in the ticket are ordered in DESC... 
					 */	
					foreach(array_reverse($ticket->replies) as $reply){
						
						$from = $reply->getTicketFrom($sql, array('getFullName'));
						
						$tpl->assign(
								array(
									'FROM' 				=> htmlspecialchars($from['getFullName']),
									'DATE' 				=> date(Config::getInstance()->get('DATE_FORMAT'), $reply->date),
									'TICKET_CONTENT'	=> nl2br(htmlspecialchars(wordwrap($reply->message, round(($screenwidth-200) / 7), "\n")))
								)
							);
							
						$tpl->parse('TICKETS_ITEM', '.tickets_item');
					}
				}
			}
				
		}catch(Exception $ex){
			set_page_message(tr($ex->getMessage()));
		}	
	}
	
}
 
?>
