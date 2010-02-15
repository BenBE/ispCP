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
check_login(__FILE__);

/**
 * Utility Class
 *
 * 
 * @author	Shin <sh1n@live.it>
 * @copyright 	2006-2010 by ispCP | http://isp-control.net
 * @version	1.0
 * 
 */
class UtilityManager{
	
	static $port	=	9876;
	static $address	=	"127.0.0.1"; 
	
	/**
	 *  Send Request
	 *	
	 *	This function will open a connection with
	 *	the process listening to port $port on $address
	 *  and will start a request sending the string 
	 *  "execute query\n"
	 *  
	 *  @return String 	@answer		The answer gave by the process
	 *  @return String	@errno		Error Code
	 */
	static function sendRequest() {
		
		global $Version;
		$code = 999;
		
		try{
			
			$socket = socket_create (AF_INET, SOCK_STREAM, 0);
				
			try{
	
				$result = socket_connect ($socket, self::$address, self::$port);
				
				/* read one line with welcome string */
				$out = self::readLine($socket);
		
				list($code) = explode(' ', $out);
				if ($code == 999)
					return $out;
						
				/* send hello query */
				$query = "helo  $Version\r\n";
				socket_write($socket, $query, strlen ($query));
		
				/* read one line with helo answer */
				$out = self::readLine($socket);
		
				list($code) = explode(' ', $out);
				if ($code == 999)
					return $out;
			
				/* send reg check query */
				$query = "execute query\r\n";
				socket_write ($socket, $query, strlen ($query));
				/* read one line key replay */
				$execute_reply = self::readLine($socket);
		
				list($code) = explode(' ', $execute_reply);
				if ($code == 999)
					return $out;
			
				/* send quit query */
				$quit_query = "bye\r\n";
				socket_write ($socket, $quit_query, strlen ($quit_query));
				/* read quit answer */
				$quit_reply = self::readLine($socket);
		
				list($code) = explode(' ', $quit_reply);
				if ($code == 999)
					return $out;
		
				list($answer) = explode(' ', $execute_reply);
		
				socket_close ($socket);
			
				return $answer;
			
			}catch(Exception $e){
				socket_close();
				return "socket_connect() failed: {$e->getMessage()}.\n";
			}	
		}catch(Exception $e){
			return "socket_create() failed: {$e->getMessage()}.\n";
		}
	}
	
	/**
	 * Read Line
	 * 
	 * This method will read a line from the provided socket
	 * A line ends with \n
	 * 
	 * @param	Socket 	$socket		Socket used for reading
	 * 
	 * @return	String	$line		The read line
	 */
	static function readLine(&$socket) {
		$line = '';
		do {
			$ch = socket_read($socket, 1);
			$line .= $ch;
		} while ($ch != "\r" && $ch != "\n");
		return $line;
	}
	
	/**
	 * Check for lock on file
	 * 
	 * This method will check if a lock is set on files 
	 *
	 *	@return Boolean		True if lock is set
	 *						False on fopen failure
	 */
	static function checkForLockFile(){
		
		$fh = fopen(Config::get('MR_LOCK_FILE'),'r');
    	if (!$fh)
        	return false;
    	
		while (!flock($fh, LOCK_EX|LOCK_NB)) {
        	usleep(rand(200, 600)*1000);
        	clearstatcache();
        	// and send header to keep connection
        	header("Cache-Control: no-store, no-cache, must-revalidate");
    	}

    	return true;
	
	}
	
	
	/**
	 * Unset Messages
	 * 
	 * This method will clean $GLOBALS and $_SESSION
	 * removing (using unset) all the value which key
	 * is present in the array
	 * 
	 * @return Void
	 */
	static function unsetMessages(){
		
		$glToUnset = array();
		$glToUnset[] = 'user_page_message';
		$glToUnset[] = 'user_updated';
		$glToUnset[] = 'user_updated';
		$glToUnset[] = 'dmn_tpl';
		$glToUnset[] = 'chtpl';
		$glToUnset[] = 'step_one';
		$glToUnset[] = 'step_two_data';
		$glToUnset[] = 'ch_hpprops';
		$glToUnset[] = 'user_add3_added';
		$glToUnset[] = 'user_has_domain';
		$glToUnset[] = 'local_data';
		$glToUnset[] = 'reseller_added';
		$glToUnset[] = 'user_added';
		$glToUnset[] = 'aladd';
		$glToUnset[] = 'edit_ID';
		$glToUnset[] = 'hp_added';
		$glToUnset[] = 'aldel';
		$glToUnset[] = 'hpid';
		$glToUnset[] = 'user_deleted';
		$glToUnset[] = 'hdomain';
		$glToUnset[] = 'aledit';
		$glToUnset[] = 'acreated_by';
		$glToUnset[] = 'dhavesub';
		$glToUnset[] = 'ddel';
		$glToUnset[] = 'dhavealias';
		$glToUnset[] = 'dhavealias';
		$glToUnset[] = 'dadel';
		$glToUnset[] = 'local_data';

		foreach ($glToUnset as $toUnset) 
			if (array_key_exists($toUnset, $GLOBALS)) 
				unset($GLOBALS[$toUnset]);
	
		$sessToUnset = array();
		$sessToUnset[] = 'reseller_added';
		$sessToUnset[] = 'dmn_name';
		$sessToUnset[] = 'dmn_tpl';
		$sessToUnset[] = 'chtpl';
		$sessToUnset[] = 'step_one';
		$sessToUnset[] = 'step_two_data';
		$sessToUnset[] = 'ch_hpprops';
		$sessToUnset[] = 'user_add3_added';
		$sessToUnset[] = 'user_has_domain';
		$sessToUnset[] = 'user_added';
		$sessToUnset[] = 'aladd';
		$sessToUnset[] = 'edit_ID';
		$sessToUnset[] = 'hp_added';
		$sessToUnset[] = 'aldel';
		$sessToUnset[] = 'hpid';
		$sessToUnset[] = 'user_deleted';
		$sessToUnset[] = 'hdomain';
		$sessToUnset[] = 'aledit';
		$sessToUnset[] = 'acreated_by';
		$sessToUnset[] = 'dhavesub';
		$sessToUnset[] = 'ddel';
		$sessToUnset[] = 'dhavealias';
		$sessToUnset[] = 'dadel';
		$sessToUnset[] = 'local_data';

		foreach ($sessToUnset as $toUnset) 
			if (array_key_exists($toUnset, $_SESSION)) 
				unset($_SESSION[$toUnset]);		
	}
	
	
	/**
	 * Update Expire Date
	 * 
	 * Update the domain's expire date with the date provided
	 * 
	 * COMMENT: Hope we can add this method to a DomainManager class (Shin)
	 * TODO: checks on domainID and newDate
	 * @param	Int			$domainId	The id of the domain that will be updated
	 * @param	String		$newDate	The new date that will be set
	 * @param	Connection	$storage	Connection to the storage system where info are stored
	 * 
	 * @return	Boolean		True/False	
	 */
	static function updateExpireDate ( $domainId, $newDate, &$storage ) {
		
		$query = "
				UPDATE
					`domain`
				SET
					`domain_expires` = ?
				WHERE
					`domain_id` = ?
			";

		$rs = exec_query($storage, $query, array(
										$newDate,
										$domainId
									)
							);
		return true;
	}

	
	/**
	 * Strip HTML
	 * 
	 * @param 	String	 $input		String that will be stripped
	 * @return 	String				Stripped string with UTF-8
	 */
	static function stripHtml($input) {
		return htmlspecialchars($input, ENT_QUOTES, "UTF-8");
	}

	/**
	 * Is Number ?
	 * 
	 * This method will check if the $integer provided
	 * represents a number 
	 * 
	 * @param	String	$integer	String that will be parsed	 
	 * @return 	Boolean				True if $integer is numeric			
	 */
	static function is_number($integer) {
		return preg_match('/^[0-9]+$/D', $integer); 
	}

	/**
	 * 
	 * @param $string
	 * @return unknown_type
	 */
function is_basicString($string) {
	if (preg_match('/^[\w\-]+$/D', $string)) {
		return true;
	}
	return false;
}	
	
}
?>