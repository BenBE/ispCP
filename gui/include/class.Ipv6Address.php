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
require_once dirname(__FILE__).'/interface.Address.php';
check_login(__FILE__);
/**
 * Ipv6 Class
 *
 * This class will be used for handle an ipv6 type address. 
 * Il can be instantiated to represent it
 * 
 * @author	Shin <sh1n@live.it>
 * @copyright 	2006-2010 by ispCP | http://isp-control.net
 * @version	1.0
 * 
 * Private Fields Are
 * 
 * address		
 * domain
 * ip_card
 * status
 * 
 * @implements	interface.Address
 */
class Ipv6Address implements iAddress{

	/*
	 * This variable will store the address and related info, this in case this class will be instantiated.
	 */
	private $data = array();
	
	/*
	 * Static Query
	 * 
	 * Declared here and used in the methods
	 */
	// Used in addAddress
	static $addQuery = "
							INSERT INTO `server_ips`
								(`ip_number`, `ip_type`, `ip_domain`, `ip_card`,
								`ip_ssl_domain_id`, `ip_status`)
							VALUES
								(?, 6, ?, ?, ?, ?)
						";
	
	// used in removeAddress
	static $removeAddress = "
							DELETE FROM 
								`server_ips`
							WHERE
							 	`ip_number` = ?
						";
	
	// used in getAddress
	static $getAddress = "
							SELECT
								`ip_id`, `ip_number`
							FROM
								`server_ips_v6`
							WHERE
								`ip_type` = 6
						";
	
	// used in getAddress
	static $getAddressWithInfo =
						"
							SELECT
								*
							FROM
								`server_ips`
							WHERE
								`ip_type` = 6
						";
	
	// used in addressExists
	static $findQuery = "
							SELECT
								*
							FROM
								`server_ips`
							WHERE
								`ip_number` = ?
						";
	
	/**
 	 * Class Constructor
 	 *
 	 * @author	Shin <sh1n@live.it>
 	 * @copyright 	2006-2010 by ispCP | http://isp-control.net
 	 * @version	1.0
 	 * @access	public
 	 * @param	String 	$address	The address that will be stored in the private field.
 	 */	
	function __construct($address, $domain = '', $ip_card = '', $status = ''){
		if(self::validateAddress($address)){
			$this->data['address']	= $address;
			$this->data['domain'] 	= $domain;
			$this->data['ip_card'] 	= $ip_card;
			$this->data['status'] 	= $status;
			
		}
	}
	
	public function __get($name) {
		if (array_key_exists($name, $this->data)) 
            return $this->data[$name];
    }
	
	/**
 	 * Validate
 	 *
 	 * This function will be used to validate the address provided
 	 * 
 	 * @author	Shin <sh1n@live.it>
 	 * @copyright 	2006-2010 by ispCP | http://isp-control.net
 	 * @version	1.0
 	 * @access	public
 	 * @param	String 	$address	The address that will be validate.
 	 * @return  Boolean				True if the parameter provided will succed the test.
 	 */	
	static function validateAddress($address){
		
		if($address instanceof Ipv6Address)
			$address = $address->address;
		
		
		if(function_exists('filter_var'))
			return filter_var($address, FILTER_VALIDATE_IP, FILTER_FLAG_IPV6);
	
		if(substr_count($address, ":") < 2)
			return false;
				
		if(substr_count($value, "::") > 1)
			return false; 
			
		$ipParts = explode(':', $address);
		if( (count($ipParts) > 8) || (count($groups) < 3) )
			return false;
			
		$emptyParts = 0;
		foreach ($ipParts as $ipPart){
			
			$ipPart = trim($ipPart);
		
			if((!empty($ipPart)) && ( (!is_numeric($ipPart) && ($ipPart == 0)) )) 
				if(!preg_match('#([a-fA-F0-9]{0,4})#', $ipPart))
					return false;
			else
				++$emptyParts;
		}
		return ($emptyParts < count($ipParts)) ? true : false;
	}
	
	/**
	 * Address Insertion
	 * 
	 * This function will store the address into the sql database.
	 * The address is stored in its shortest version
	 *
	 * @author	Shin <sh1n@live.it>
 	 * @copyright 	2006-2010 by ispCP | http://isp-control.net
 	 * @version	1.0
 	 * @access	public
 	 * @param	String 		$address	The address that will be stored.
 	 * @param	Connection 	$sql		The sql connection.
 	 * @return  Boolean					True if the parameter will be added correctly.
	 */
	static function addAddress($address, &$sql, $options = NULL){
		
		if( (self::validateAddress($address)) && (!self::issetAddress($address,$sql)) ) {
			
			if($address instanceof Ipv6Address)
				$rs = exec_query($sql, self::$addQuery, array(
													self::createShortVersion($address->address),
													htmlspecialchars( ($address->domain 	!= NULL) ? $address->domain 	: '' ,	 	ENT_QUOTES, "UTF-8"),
													htmlspecialchars( ($address->ip_card	!= NULL) ? $address->ip_card 	: '' ,		ENT_QUOTES, "UTF-8"),
													NULL,
													Config::get('ITEM_ADD_STATUS')
												)
											);
			else
				$rs = exec_query($sql, self::$addQuery, array(
													self::createShortVersion($address),
													htmlspecialchars( ($options['domain']	!= NULL) ? $options['domain'] 	: '' ,	 	ENT_QUOTES, "UTF-8"),
													htmlspecialchars( ($options['ip_card']	!= NULL) ? $options['ip_card']	: '' ,		ENT_QUOTES, "UTF-8"),
													NULL,
													Config::get('ITEM_ADD_STATUS')
												)
											);
		/*
		 * Here something like 
		 * $requestManager->send();
		 */
		//	send_request();
		/*
		 * Here something like 
		 * $requestManager->send();
		 * $logger->writeLog("{$_SESSION['user_logged']}: adds new Ipv6 address: {$address}!");
		 */											
		//	write_log("{$_SESSION['user_logged']}: adds new Ipv6 address: {$address}!");
			return true;
		}
		return false;
	}

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
	static function removeAddress($address, &$storage){
		
		if( (self::validateAddress($address)) && (self::issetAddress($address)) ){
			if($address instanceof self)
				$rs = exec_query($storage, self::$removeQuery,  array($address->address));
			else
				$rs = exec_query($storage, self::$removeQuery,  array($address));
			return true;
		}
		return false;		
	}	
	
	/**
	 * Get Addresses
	 * 
	 * This function will return all the addresses stored
	 *
	 * @author	Shin <sh1n@live.it>
 	 * @copyright 	2006-2010 by ispCP | http://isp-control.net
 	 * @version	1.0
 	 * @access	public
 	 * @param	Array 		$option		An array with options for retrieval.
 	 * @param	Connection 	$sql		The sql connection.
 	 * @return  Object[]				A list with the stored addresses.
	 */
	static function getAddresses(&$sql, $options = NULL){
		
		$query = ($options == NULL) || (isset($options['asString']) && ($options['asString'] == 1) ) ?  self::$getAddress :  self::$getAddressWithInfo;
		
		$rs = exec_query($sql, $query, array());
		
		$ipArray = array();
		
		while (!$rs->EOF) {
			if( ($options == NULL) || ( (isset($options['asString'])) && ($options['asString'] == 1) ) )
				$ipArray[$rs->fields['ip_id']] = $rs->fields['ip_number'];
			else if( (isset($options['asObject'])) && ($options['asObject'] == 1) & (isset($options['withInfo'])) & ($options['withInfo'] == 1) )
				$ipArray[$rs->fields['ip_id']] = new Ipv6Address(
															$rs->fields['ip_number'], 
															$rs->fields['ip_domain'],
															$rs->fields['ip_card']
															);
				
			$rs->MoveNext();
		} // end while
		return $ipArray;
	}
	
	/**
	 * Create Short version
	 * 
	 * This method will create a short version of the addres provided
	 *
	 * @author	Shin <sh1n@live.it>
 	 * @copyright 	2006-2010 by ispCP | http://isp-control.net
 	 * @version	1.0
 	 * @access	public
 	 * @param	String 		$address	Address in Ipv6 Format.
 	 * @return  String					$address in the short version or 
 	 * 									NOT_VALID if the $addres provided 
 	 * 									isn't in the ipv6 format
	 */
	static function createShortVersion($address){
		if(self::validateAddress($address))
			return ($address instanceof Ipv6Address) ?  inet_ntop(inet_pton($address->address)) :  inet_ntop(inet_pton($address));
		else
			return "NOT_VALID";
	}
	
	/**
	 * Address Exists
	 * 
	 * This method confirms if the address provided already exists
	 * into the storage system. The address will be validated before
	 * the search.
	 * 
	 * @version 1.0
	 * 
	 * @access 	static
	 * @param 	String		$address	
	 * @param	Connection	$sql	
	 * 
	 * @return 	Boolean
	 */
	static function issetAddress($address,&$sql){
		if(self::validateAddress($address)){
			if($address instanceof self)
				$rs = exec_query($sql, self::$findQuery, array(self::createShortVersion($address->address)));
			else
				$rs = exec_query($sql, self::$findQuery, array(self::createShortVersion($address)));
			if ($rs->RowCount() == 0) 
				return false;
			else
				return true;
		}
	}	
}
//test
/*
	$ipTo = "0126:4587:0257:2504:7589:1200:0001:0002";
	echo $ipTo."<br />";
	echo Ipv6Address::createShortVersion($ipTo);
	$fake 		= "890.sa,125.0";
	$correct 	= "192.168.1.1";
	echo var_dump(Ipv6Address::validateAddress($fake));
	echo var_dump(Ipv6Address::validateAddress($ipTo));
	echo "<br />";
	var_dump(Ipv6Address::getAddresses(&$sql));
	echo "<br />";
	$options = array( 'asString' => 1);
	var_dump(Ipv6Address::getAddresses(&$sql,$options));
	echo "<br />";
	$ips = (Ipv6Address::getAddresses(&$sql, array( 'asObject' => 1, 'withInfo' => 1)));
	var_dump($ips);
	echo "<br />";
	var_dump(Ipv6Address::addAddress($ipTo,$sql));
	var_dump(Ipv6Address::addAddress($ipTo,$sql));
	
	$ipNew = new Ipv6Address("0126:4587:0257:2504:7589:1200:0001:0008", 'dotshin.net');
	var_dump(Ipv6Address::validateAddress($ipNew));
	//Ipv6Address::addAddress($ipNew,$sql);
	
	var_dump(Ipv6Address::issetAddress("0126:4587:0257:2504:7589:1200:0001:0008",$sql));

	var_dump(Ipv6Address::issetAddress(new Ipv6Address("0126:4587:0257:2504:7589:1200:0001:0808"),$sql));
	*/
?>