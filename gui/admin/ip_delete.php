<?php
/* ispCP ω (OMEGA) a Virtual Hosting Control System
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

require '../include/ispcp-lib.php';
check_login(__FILE__);

/* Do we have a proper delete_id? */
if (!isset($_GET['delete_id'])) {
	user_goto('ip_manage.php');
}

if (!is_numeric($_GET['delete_id'])) {
	set_page_message(tr('You cannot delete the last active IP address!'));
	user_goto('ip_manage.php');
}

	$delete_id = $_GET['delete_id'];
	/* 
	 * Get Ip Type & Address Value
	 * */
	$query = "
		SELECT
			`ip_type`, `ip_number`
		FROM
			`server_ips`
		WHERE
			`ip_id` = ?
		";
	
	$rs = exec_query($sql, $query, array($delete_id));
	
	
	// check if the IP is assigned to reseller
	$query = "
		SELECT 
			`reseller_ips`
		FROM
			`reseller_props`
		";
	$res = exec_query($sql, $query, array());
	while (($data = $res->FetchRow())) {
		if (preg_match("/$delete_id;/", $data['reseller_ips'])) {
			set_page_message(tr('Error: we have a reseller using this IP!'));
			user_goto('ip_manage.php');
		}
	}
	
	try{
		($rs->fields['ip_type'] == 4) ? (Ipv4Address::removeAddress($rs->fields['ip_number'], $sql)) : (Ipv6Address::removeAddress($rs->fields['ip_number'], $sql));
	}catch(Exception $ex){
		if($ex->message == "IPMNG_ADRID_NOTF")
			set_page_message(tr('Error: contact support with code 145!'));
		elseif($ex->message == "IPMNG_DOMAIN_ASSOCIATED")
			set_page_message(tr('Error: we have a domain using this IP!'));
		user_goto('ip_manage.php');
	}
?>
