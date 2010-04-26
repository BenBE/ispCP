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
 * TicketReply class
 *
 * 
 * @author	Francesco Bux <francesco.bux@isp-control.net>
 * @copyright 	2006-2010 by ispCP | http://isp-control.net
 * @version	1.0
 */ 
class TicketReply{

	/**
	 * Fields
	 * @field	Integer			$rID		Reply ID	
	 * @field	String			$message	Ticket message
	 * @field	Integer			$date		Reply date
	 * @field	Integer			$replyFrom	From ID
	 * @field	Integer			$replyTo	To ID
	 */
	private $data = array();
	
	public function __get($name) {
        if (array_key_exists($name, $this->data)) {
            return $this->data[$name];
        }
	}
	
	/**
 	 *	Constructor
 	 *	
 	 *	@param	String 		$message	Reply Message
 	 *	@param	Integer		$replyFrom	Reply Sender
 	 *	@param	Integer		$replyTo	Reply Receiver
 	 *	@param	String		$date		Reply Date
 	 *
 	 */	
 	function __construct( $message, $replyFrom, $replyTo, $date) {
		$this->data["message"]		= $message;
		$this->data["replyFrom"]	= $replyFrom;
		$this->data["replyTo"]		= $replyTo;
		$this->data["date"]			= $date;
 	}
	
	/**
	 *	Append To Ticket
	 *	
	 *	This method will update the tID associated to the reply
	 *
	 *	@access public
	 *	@param	Integer $tID	Ticket ID
	 */
	function appendTo( $tID){
		$this->data["tID"]	= $tID;
	}
	
	/**
	 * 	getTicketFrom
	 * 
	 *	Get the name of the sender
	 *
	 *	You can pass an array with the following options:
	 *		'getID'			: will return the userID
	 *		'getFullName'	: will return the fullName
	 *		'getUserName'	: will return only the username
	 *
	 *	More than 1 option can be used, in any case it will return an array of strings
	 *
	 *	@version 2.0:	If $options isn't passed it will return a String with getFullName as content
	 *
	 *	@access public
	 *	@param	DBInterface		$facility	Database Handle
	 *  @param 	Array			$options	Options array
	 *	@return String[]
	 */
	function getTicketFrom(&$facility,$options = null){
			$query = <<<SQL
				SELECT
					`admin_name`,
					`admin_id`,
					`fname`,
					`lname`
				FROM
					`admin`
				WHERE
					`admin_id` = ?
								  		
SQL;
		
			$results = exec_query($facility, $query, array($this->replyFrom));
			$from_user_name = decode_idna($results->fields['admin_name']);
		
		if(isset($options) && in_array('getID',$options))
			$info['getID'] = $results->fields['admin_id'];

		if(isset($options) && in_array('getFullName',$options))
			$info['getFullName'] = $results->fields['fname'] . " " . $results->fields['lname'] . " (" . $from_user_name . ")";
		
		if(isset($options) && in_array('getUserName',$options))
			$info['getUserName'] = $from_user_name;
			
		if($options == null)
			return $results->fields['fname'] . " " . $results->fields['lname'] . " (" . $from_user_name . ")";
		
		return $info;
	
	}
	 
	/**
	 * 	getTicketTo
	 * 
	 *	Get the name of the receiver
	 *
	 *	You can pass an array with the following options:
	 *		'getID'			: will return the userID
	 *		'getFullName'	: will return the fullName
	 *		'getUserName'	: will return only the username
	 *
	 *	More than 1 option can be used, in any case it will return an array of strings
	 *
	 *	@version 2.0:	If $options isn't passed it will return a String with getFullName as content
	 *
	 *	@access public
	 *	@param	DBInterface	$facility	Database Handle
	 *	@param 	Array		$options	Options array
	 *	@return String[]
	 */
	function getTicketTo(&$facility, $options = null){
		$query = <<<SQL
				SELECT
					`admin_name`,
					`admin_id`,
					`fname`,
					`lname`
				FROM
					`admin`
				WHERE
					`admin_id` = ?
								  		
SQL;
		
		$results = exec_query($facility, $query, array($this->replyTo));
		$from_user_name = decode_idna($results->fields['admin_name']);
		
		if(isset($options) && in_array('getID',$options))
			$info['getID'] = $results->fields['admin_id'];

		if(isset($options) && in_array('getFullName',$options))
			$info['getFullName'] = $results->fields['fname'] . " " . $results->fields['lname'] . " (" . $from_user_name . ")";
		
		if(isset($options) && in_array('getUserName',$options))
			$info['getUserName'] = $from_user_name;
			
		if($options == null)
			return $results->fields['fname'] . " " . $results->fields['lname'] . " (" . $from_user_name . ")";
		
		return $info;
	}

}
?>