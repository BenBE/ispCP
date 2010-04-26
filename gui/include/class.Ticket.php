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
 * Ticket class
 *
 * @author	Francesco Bux <francesco.bux@isp-control.net>
 * @copyright 	2006-2010 by ispCP | http://isp-control.net
 * @version	1.0
 */
class Ticket {
 	
	/**
	 * Fields
	 * @field	Integer			$ID				Post ID	
	 * @field	Integer			$cID			Category ID		Not Used	
	 * @field	String			$title			Ticket title
	 * @field	integer			$status			Ticket status
	 * @field	Integer			$urgency		Urgency Level
	 * @field	TicketReply		$mainMessage
	 * @field	TicketReply[]	$replies		Array Of Replies	
	 */
	private $data = array();
	
	public function __get($name) {
        if (array_key_exists($name, $this->data)) {
        	return $this->data[$name];
        }
	}
	
	public function __isset($key)
    {
        if (isset($this->data[$key])) {
            return (false === empty($this->data[$key]));
        } else {
            return null;
        }
    }
	
	/**
 	 * Contructor
 	 *
	 * @param	Integer 		$tID		Ticket ID
 	 * @param	String 			$title		Ticket Title
     * @param	Integer			$urgency   	Urgency Level
     * @param	Integer			$status		Ticket Status
     * @param	Ticketreply		$message	Ticket Content
     * @param	Integer			$level		Ticket Level	
 	 */	
 	function __construct($tID = null,  $title = null,  $urgency = null,  $status = null, TicketReply $message = null, $level = null) {
		$this->data["ID"] 			= $tID;
		$this->data["title"]		= $title;
		$this->data["urgency"]		= $urgency;
		$this->data["status"]		= $status;
		$this->data["mainMessage"]	= $message;
		$this->data["level"]		= $level;
 	}
 	
 	/**
 	 * 	LoadAll
 	 * 
 	 *	This method will load all the ticket content, including
 	 *	all the replies associated to it.
 	 * 
 	 * @access 	public
 	 * @param	DBInterface		$facility	Database Handle
 	 * @throws	Exception		Ticket Id not provided
 	 * 
 	 */
 	function loadAll(&$facility){
 		if(isset($this->data["ID"])){
 			$query = <<<SQL
 						SELECT
 							`tickets`.*
 						FROM
 							`tickets`
 						WHERE
 							`tickets`.`ticket_id` = ?
SQL;
			$results = exec_query($facility, $query, array($this->ID));
			$this->data["title"] 	= $results->fields["ticket_subject"];
			$this->data["urgency"]	= $results->fields["ticket_urgency"];
			$this->data["status"]	= $results->fields["ticket_status"];
			$this->data["level"]	= $results->fields["ticket_level"];
			$this->data["mainMessage"]	= new TicketReply($results->fields["ticket_message"],
													  $results->fields["ticket_from"],
													  $results->fields["ticket_to"],
													  $results->fields["ticket_date"]);
			$this->loadPost($facility);
 		}else
 			throw new Exception("Ticket Id not provided");
 	}
 	
	
	/**
	 *	Change Status
	 *
	 *	This function will change the status of the ticket
	 *
	 *	@access	public
	 *	@param	Integer		$status		Ticket status: 0 closed, 1 open
	 *	@param	DBInterface	$facility	Database Handle
	 */
	function changeStatus($status,  &$facility = null){
		$this->status = $status;
		if($facility != null){
			$query = <<<SQL
			UPDATE
				`tickets`
			SET
				`ticket_status` = ?
			WHERE
				`ticket_id` = ?
			OR
				`ticket_reply`	= ?
SQL;
			//$facility->Execute($query,array($status, $this->ID));
			exec_query($facility, $query, array($status, $this->ID, $this->ID)); 
		}
	}
	
	/**
	 * 	Get Last Date
	 * 
	 * 	Get the last reply's date else will return null,
	 * 	We use 0 since they are ordered by DESC
	 * 
	 * 	@access public
	 * 	@param	String	$dateFormat		Date Format
	 */
	function getLastDate($dateFormat){
		if(!empty($this->data["replies"])){
			return date($dateFormat, $this->data["replies"][0]->date);
		}		
		return null;
	}
	
	
	/**
	 *	Load Ticket
	 *
	 *	This function will populate the replies array
	 *  querying the facility
	 *
	 *	@access	Public
	 *  @param	DBInterface		$facility	Database Handle
	 *	
	 */
	public function loadPost( &$facility){
		$query = <<<SQL
			SELECT
				`tickets`.*
			FROM
				`tickets`
			WHERE
				`ticket_reply` = ?
			ORDER BY
				`ticket_date` DESC
SQL;
		//$results = $facility->Execute($query, array($this->ID));
		$results = exec_query($facility, $query, array($this->ID));
		$this->data["replies"] = array();
		while (!$results->EOF){
			$this->data["replies"][] = new TicketReply($results->fields["ticket_message"], 
								   $results->fields["ticket_from"], 
								   $results->fields["ticket_to"],
								   $results->fields["ticket_date"]);
			$results->MoveNext();
		}
		
	}	
	
	/**
	 *	addReply
	 *
	 *	Adds a reply to the ticket. The reply will be stored in the DB only if
	 *	a database handle is passed.
	 *
	 *	@access public
	 *	@param	TicketReply		$reply		The Reply that will be added
	 *	@param	DBInterface		$facility	Database Handle
	 *	@return	Integer			$rID		Reply ID (if it's stored in the db)
	 */
	public function addReply(TicketReply $reply, $facility = null){
		$this->data["replies"][] = $reply;
		$reply->appendTo($this->data["ID"] +0);
		if($facility != null){
			$query = <<<SQL
				INSERT INTO
					`tickets`
					(`ticket_from`,
					`ticket_to`,
					`ticket_status`,
					`ticket_reply`,
					`ticket_urgency`,
					`ticket_date`,
					`ticket_subject`,
					`ticket_message`)
				VALUES
					(?, ?, ?, ?, ?, ?, ?, ?)
SQL;
			/*$facility->Execute($query,array(
									$this->data["ID"],
									$reply->message,
									$reply->reply_from,
									$reply->reply_to
									));
			return $facility->Insert_ID();*/
			$rs = exec_query($facility, $query, array(
													$reply->replyFrom,
													$reply->replyTo,
													$this->data["status"],
													$this->data["ID"],
													$this->data["urgency"],
													$reply->date,
													$this->data["title"],
													$reply->message
													));
		}
	}	
	
	/**
	 * 	getOpenDate
	 * 
	 * 	Return the date of when the ticket has beed opened
	 * 
	 * 	@access public
	 *	@param	DBInterface	$facility	Database Handle
	 *	@return String
	 */
	function getOpenDate(){
		if(isset($this->data["mainMessage"])){
			return $this->mainMessage->date;
		}else
 			throw new Exception("Ticket not loaded");	

	}
	
	
}
?>
