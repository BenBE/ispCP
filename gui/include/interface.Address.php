<?php
/**
 * ispCP ω (OMEGA) a Virtual Hosting Control System
 *
 * @copyright 	2006-2009 by ispCP | http://isp-control.net
 * @version 	$Id$
 * @link 		http://isp-control.net
 * @author 		Shin
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
require_once dirname(__FILE__).'/ispcp-lib.php';
check_login(__FILE__);


interface iAddress{
	
	/**
 	 * Address Insertion
 	 *
 	 * This function will add the provided address to the system, in according
 	 * to its role.
 	 * @version	1.0
 	 * 
 	 * @access	static
 	 *
 	 * @param	String 		$address	The address that will be added.
 	 * @param	Connection	$storage	Connection used to store the address
 	 * @param	Array		$options	Array of optional parameter
 	 * @return	Bool		 			The returned value
 	 */	
	static function addAddress($address, &$storage, $options = NULL);
	
	
	/**
 	 * Address Validation
 	 *
 	 * This function must be implemented to provide a method
 	 * for validating the string passed as parameter.
 	 *
 	 * @version	1.0
 	 * 
 	 * @access	static
 	 *
 	 * @param	String 	$address	The address that will be validated.
 	 * @return	Bool		 		The returned value
 	 */	
	static function validateAddress($address);
	
	/**
	 * Remove Address
	 * 
	 * This method will remove the address provided from the storage
	 * 
	 * @version 1.0
	 * 
	 * @access 	static
	 * @param 	String		$address	Address to be deleted
	 * @param	Connection	$storage	Connection to the storage
	 * 
	 * @return 	Boolean					True if the address is deleted correctly
	 */	
	static function removeAddress($address, &$storage);
	
	/**
 	 * Get Addresses
 	 *
 	 * This function will return a list of addresses.
 	 * @version	1.0
 	 * 
 	 * @access	static
 	 * @param	Connection	$storage	Connection used to store the address
 	 * @param	Array		$options	Array of optional parameter
 	 * @return	Object[]				The returned value
 	 */	
	static function getAddresses(&$storage, $options = NULL);
	
	
	/**
 	 * Get Info
 	 *
 	 * This function will return a list of addresses and all the 
 	 * information related to them.
 	 * @version	1.0
 	 * 
 	 * @deprecated 	WITH THE INTRODUCTION OF OPTIONS ARRAY YOU CAN OBTAIN
 	 * 				INFORMATION DIRECTLY WITH THE getAddresses
 	 * 				method.
 	 * 
 	 * 
 	 * @access	static
 	 * @param	Connection	$storage	Connection used to store the address
 	 * @param	Array		$options	Array of optional parameter
 	 * @return	Object[]				The returned value
 	 */	
	//static function getInfo($storage, $options = NULL);
	
	
	/**
	 * Address Exists
	 * 
	 * This method confirms if the address provided already exists
	 * into the storage system
	 * 
	 * @version 1.0
	 * 
	 * @access 	static
	 * @param 	String		$address	
	 * @param	Connection	$storage	Connection to the storage system
	 * 
	 * @return 	Boolean
	 */
	static function issetAddress($address, &$storage);	
}
?>