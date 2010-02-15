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
 * Ipv4 Class
 *
 * This class will be used for handle an ipv4 type address. 
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
 * alias
 * ip_card
 * status
 * 
 * @implements	interface.Address
 */
class Ipv4Address implements iAddress{

	/*
	 * This variable will store the address and related info, this in case this class will be instantiated.
	 */
	private $data = array();

	
	static $type = "ipv4";
	/*
	 * Static Query
	 * 
	 * Declared here and used in the methods
	 */
	// Used in addAddress
	static $addQuery = "
							INSERT INTO `server_ips`
								(`ip_number`, `ip_type`, `ip_domain`, `ip_alias`, `ip_card`,
								`ip_ssl_domain_id`, `ip_status`, `ip_subnet` )
							VALUES
								(?, 4, ?, ?, ?, ?, ?, ?)
						";
	// used in removeAddress
	static $removeAddress = "
							UPDATE
								`server_ips`
							SET
								`ip_status` = ?
							WHERE
								`ip_number` = ?
							LIMIT 1
						";
	
	static $domainFromIpQuery = "
							SELECT
								COUNT(`domain_id`) AS dcnt
							FROM
								`domain`
							WHERE
								`domain_ip_id` = ?
						";
	
	static $getIdQuery = "
							SELECT
								`ip_id`
							FROM
								`server_ips`
							WHERE
								`ip_number` = ?
							LIMIT
								0,1
						";
	
	// used in getAddress
	static $getAddress = "
							SELECT
								`ip_id`, `ip_number`
							FROM
								`server_ips`
							WHERE
								`ip_type` = 4
						";
	
	// used in getAddress
	static $getAddressWithInfo = "
							SELECT
								*
							FROM
								`server_ips`
							WHERE
								`ip_type` = 4
						";
	
	// used in issetAddress
	static $findQuery = "
							SELECT
								*
							FROM
								`server_ips`
							WHERE
								`ip_number` = ?
							AND
								`ip_type` = 4
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
	function __construct($address, $domain = '', $alias = '', $ip_card = '', $status = '', $subnet = ''){
		if(self::validateAddress($address)){
			$this->data['address']	= $address;
			$this->data['domain'] 	= $domain;
			$this->data['alias'] 	= $alias;
			$this->data['ip_card'] 	= $ip_card;
			$this->data['status'] 	= $status;
			$this->data['subnet']	= (self::validateAddress($subnet)) ? $subnet : '0.0.0.0';
		}else
			throw new Exception("IPMNG_ADR_NOT_VALID");
	}
	
	
	/**
	 * Magic method used to access to object data.
	 */
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
 	 * @return  Boolean		True if the parameter provided will succed the test.
 	 */	
	static function validateAddress($address){
		
		if($address instanceof Ipv4Address)
			$address = $address->address;
		
		if(function_exists('filter_var'))
			return filter_var($address, FILTER_VALIDATE_IP, FILTER_FLAG_IPV4);
				
		if(preg_match("/^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$/",$address)){
			$ipParts = explode(".",$address);
			foreach($ipParts as $ipPart){
				if(intval($ipPart) > 255 || intval($ipPart) < 0)
     				return false;
			}
			return true;
		}			
	}
	
	
	/**
	 * Address Insertion
	 * 
	 * This function will store the address into the sql database
	 *
	 * @author	Shin <sh1n@live.it>
 	 * @copyright 	2006-2010 by ispCP | http://isp-control.net
 	 * @version	1.0
 	 * @access	public
 	 * @param	String 		$address	The address that will be stored.
 	 * @param	Connection 	$sql		The sql connection.
 	 * 
 	 * @return  Boolean					True if the parameter will be added correctly.
	 */
	static function addAddress($address, &$sql, $options = NULL){
		
		if( (self::validateAddress($address)) && (!self::issetAddress($address,$sql)) ) {
			
			if($address instanceof Ipv4Address)
				
				$rs = exec_query($sql, self::$addQuery, array(
													$address->address,
													htmlspecialchars( ($address->domain 	!= NULL) ? $address->domain 	: '' ,	 	ENT_QUOTES, "UTF-8"),
													htmlspecialchars( ($address->alias 		!= NULL) ? $address->alias 		: '' ,	 	ENT_QUOTES, "UTF-8"),
													htmlspecialchars( ($address->ip_card	!= NULL) ? $address->ip_card 	: '' ,		ENT_QUOTES, "UTF-8"),
													NULL,
													Config::get('ITEM_ADD_STATUS'),
													$address->subnet
												)
											);
			else
							
				$rs = exec_query($sql, self::$addQuery, array(
													$address,
													htmlspecialchars( ($options['domain']	!= NULL) ? $options['domain'] 	: '' ,	 	ENT_QUOTES, "UTF-8"),
													htmlspecialchars( ($options['alias'] 	!= NULL) ? $options['alias'] 	: '' ,	 	ENT_QUOTES, "UTF-8"),
													htmlspecialchars( ($options['ip_card']	!= NULL) ? $options['ip_card']	: '' ,		ENT_QUOTES, "UTF-8"),
													NULL,
													Config::get('ITEM_ADD_STATUS'),
													( (isset($options['subnet'])) && (self::validateAddress($options['subnet'])) ) ? $options['subnet'] : '0.0.0.0'
												)
											);
			
			/*
			 * Here something like 
			 * $requestManager->send();
			 */
			UtilityManager::sendRequest();
			/*
			 * Here something like 
			 * $requestManager->send();
			 * $logger->writeLog("{$_SESSION['user_logged']}: adds new Ipv4 address: {$address}!");
			 */											
			write_log("{$_SESSION['user_logged']}: adds new Ipv4 address: {$address}!");
			
			return true;
		}
		return false;
	}
	

	/**
	 * Remove Address
	 * TODO
	 * This method will remove the address provided from the storage
	 * Before deletion the method needs to check if any domain is 
	 * associated to the $address.  
	 * @version 1.0
	 * 
	 * @access 	static
	 * @param 	String		$address	Address to be deleted
	 * @param	Connection	$storage	Connection to the storage
	 * 
	 * @throws	Exception	IPMNG_DOMAIN_ASSOCIATED	Domain(s) is associated to the $address
	 * 
	 * @return 	Boolean					True if the address is deleted correctly
	 */	
	static function removeAddress($address, &$storage){
		
		if( (self::validateAddress($address)) && (self::issetAddress($address,$torage)) ){
			
			$rs = exec_query($sql, $getIdQuery, array($address));
			if($rs->fields['ip_id'] == NULL)
				throw new Exception("IPMNG_ADRID_NOTF");
			
			/**
			 * Check if domains are associated to the $address
			 * TODO{
			 * 	$domains::getFromIp($address);
			 * 	if(count($domains) == 0)
			 * 		changeStatus;
			 * }
			 */			
			$rs = exec_query($sql, $domainsFromIpQuery, array($rs->fields['ip_id']));
			if ($rs->fields['dcnt'] > 0) 
				throw new Exception('IPMNG_DOMAIN_ASSOCIATED');
			
			// User_logged is used for log	
			$user_logged = $_SESSION['user_logged'];
			if($address instanceof self){
				$rs = exec_query($storage, self::$removeQuery, array(Config::get('ITEM_DELETE_STATUS'), $address->address));
				write_log("$user_logged: deletes IP address $address->address");
			}else{
				$rs = exec_query($storage, self::$removeQuery, array(Config::get('ITEM_DELETE_STATUS'), $address));
				write_log("$user_logged: deletes IP address $address->");
				
			}
			
			send_request();
			set_page_message(tr('IP was deleted!'));
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
				$ipArray[$rs->fields['ip_id']] = new Ipv4Address(
																$rs->fields['ip_number'], 
																$rs->fields['ip_domain'], 
																$rs->fields['ip_alias'], 
																$rs->fields['ip_card'],
																$rs->fields['ip_status'],
																$rs->fields['ip_subnet']
																);
				
			$rs->MoveNext();
		} // end while
		return $ipArray;
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
				$rs = exec_query($sql, self::$findQuery,  array($address->address));
			else
				$rs = exec_query($sql, self::$findQuery,  array($address));
			
			if ($rs->RowCount() == 0) 
				return false;
			else
				return true;
		}
	}
	
	/**
	 * Is in range
	 * 
	 * This method confirms if the $address provided is in the range
	 * of the $subnet provided as second parameter
	 * 
	 * @version 1.0
	 * 
	 * @access 	static
	 * @param 	String		$address	The ipAddress
	 * @param	String		$subnet		The subnet mask
	 * 
	 * 
	 * @return 	Boolean
	 */
	static function isInRange($address, $subnet){
		$bcast = ip2long("192.168.1.0");
   	 	$smask = ip2long($subnet);
    	$ipadr = ip2long($address);
    	$nmask = $bcast & $smask;
    	return (($ipadr & $smask) == ($nmask & $smask));
	}
	
	
}


/* TESTING */
/*
	$fake 		= "890.sa,125.0";
	$correct 	= "192.168.1.1";
	echo var_dump(Ipv4Address::validateAddress($fake));
	echo var_dump(Ipv4Address::validateAddress($correct));
	echo "<br />";
//	var_dump(Ipv4Address::getAddresses(&$sql));
	echo "<br />";
	$options = array( 'asString' => 1);
//	var_dump(Ipv4Address::getAddresses(&$sql,$options));
	echo "<br />";
	$ips = (Ipv4Address::getAddresses(&$sql, array( 'asObject' => 1, 'withInfo' => 1)));
//	var_dump($ips);
	echo "<br />";
	$newIp = new Ipv4Address("192.168.1.45","dotshin.net","localhost",NULL,NULL,"255.255.255.230");
	//var_dump(Ipv4Address::addAddress($newIp,$sql));
	
//	var_dump(Ipv4Address::isInRange("192.168.1.80","255.255.255.220"));
//	var_dump(Ipv4Address::issetAddress(new Ipv4Address("192.168.1.85"),$sql));
*/
?>