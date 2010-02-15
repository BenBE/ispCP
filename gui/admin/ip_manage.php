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

require '../include/ispcp-lib.php';

check_login(__FILE__);



$tpl = new pTemplate();

$interfaces = new networkCard();

$tpl->define_dynamic('page', Config::get('ADMIN_TEMPLATE_PATH') . '/ip_manage.tpl');
$tpl->define_dynamic('page_message', 'page');
$tpl->define_dynamic('hosting_plans', 'page');
$tpl->define_dynamic('ip_row', 'page');
$tpl->define_dynamic('ip_row_six', 'page');
$tpl->define_dynamic('card_list', 'page');
$tpl->define_dynamic('ip_type_list', 'page');
$tpl->define_dynamic('ip_delete_show', 'ip_row');
$tpl->define_dynamic('ip_delete_link', 'ip_row');

$theme_color = Config::get('USER_INITIAL_THEME');

$tpl->assign(
	array(
		'TR_ADMIN_IP_MANAGE_PAGE_TITLE'	=> tr('ispCP - Admin/IP manage'),
		'THEME_COLOR_PATH'				=> "../themes/$theme_color",
		'THEME_CHARSET'					=> tr('encoding'),
		'ISP_LOGO'						=> get_logo($_SESSION['user_id'])
	)
);

function gen_ip_action($ip_id, $status) {
	if ($status === Config::get('ITEM_OK_STATUS')) {
		return array(tr('Remove IP'), 'ip_delete.php?delete_id=' . $ip_id);
	} else {
		return array(tr('N/A'), '#');
	}
}

/*
 * Show Ip Address 
 * 
 */
function show_IPs(&$tpl, &$sql) {
	$i = 0;
	foreach( ($ips = Ipv4Address::getAddresses($sql,array('asObject' => 1, 'withInfo' => 1))) as $ipId => $ipAdr){
		$tpl->assign('IP_CLASS', ($i++ % 2 == 0) ? 'content' : 'content2');
		list($ip_action, $ip_action_script) = gen_ip_action($ipId, $ipAdr->status);
		$tpl->assign(
			array(
				'IP'			=> $ipAdr->address,
				'IP_SUBNET'		=> $ipAdr->subnet,
				'DOMAIN'		=> $ipAdr->domain,
				'ALIAS'			=> ($ipAdr->alias === NULL) ? '' : $ipAdr->alias,
				'NETWORK_CARD'	=> ($ipAdr->ip_card === NULL) ? '' : $ipAdr->ip_card
			)
		);
		if (count ($ips) < 2) {
			$tpl->assign(
				array(
					'IP_DELETE_LINK' 	=>	'',
					'IP_ACTION' 		=>	tr('N/A')
				)
			);
			$tpl->parse('IP_DELETE_SHOW', 'ip_delete_show');
		} else {
			$tpl->assign(
				array(
					'IP_DELETE_SHOW'	=> '',
					'IP_ACTION'			=> (Config::get('BASE_SERVER_IP') == $ipAdr->address) ? tr('N/A') : $ip_action,
					'IP_ACTION_SCRIPT'	=> (Config::get('BASE_SERVER_IP') == $ipAdr->address) ? '#' : $ip_action_script
				)
			);
			$tpl->parse('IP_DELETE_LINK', 'ip_delete_link');
		}

		$tpl->parse('IP_ROW', '.ip_row');
	}

	$i = 0;
	foreach( ($ips = Ipv6Address::getAddresses($sql,array('asObject' => 1, 'withInfo' => 1))) as $ipId => $ipAdr){
		count($ips);
		$tpl->assign('IP_CLASS', ($i++ % 2 == 0) ? 'content' : 'content2');
		list($ip_action, $ip_action_script) = gen_ip_action($ipId, $ipAdr->status);
		$tpl->assign(
			array(
				'IP6'			=> $ipAdr->address,
				'DOMAIN'		=> ($ipAdr->domain === NULL) ? '' : $ipAdr->domain,
				'NETWORK_CARD'	=> ($ipAdr->ip_card === NULL) ? '' : $ipAdr->ip_card
			)
		);
		if (count ($ips) < 2) {
			$tpl->assign(
				array(
					'IP_DELETE_LINK' =>'',
					'IP_ACTION' => tr('N/A')
				)
			);
			$tpl->parse('IP_DELETE_SHOW', 'ip_delete_show');
		} else {
			$tpl->assign(
				array(
					'IP_DELETE_SHOW'	=> '',
					'IP_ACTION'			=> (Config::get('BASE_SERVER_IP') == $ipAdr->address) ? tr('N/A') : $ip_action,
					'IP_ACTION_SCRIPT'	=> (Config::get('BASE_SERVER_IP') == $ipAdr->address) ? '#' : $ip_action_script
				)
			);
			$tpl->parse('IP_DELETE_LINK', 'ip_delete_link');
		}

		$tpl->parse('IP_ROW_SIX', '.ip_row_six');
	}	
}
// TODO
function add_ip(&$tpl, &$sql) {
	
	if (isset($_POST['uaction']) && $_POST['uaction'] === 'add_ip') {
		/*
		 * Parse POST DATA
		 * */
		$ip_type = (clean_input($_POST["ip_type"]) == "IPv4") ? 4 : 6;
		if($ip_type == 4 && checkPost($sql)){
			$ip_number = trim($_POST['ip_number_1'])
						. '.' . trim($_POST['ip_number_2'])
						. '.' . trim($_POST['ip_number_3'])
						. '.' . trim($_POST['ip_number_4']);
			$subnet = trim($_POST['ip_subnet_1'])
						. '.' . trim($_POST['ip_subnet_2'])
						. '.' . trim($_POST['ip_subnet_3'])
						. '.' . trim($_POST['ip_subnet_4']);			
			if(Ipv4Address::addAddress($ip_number,$sql,array(
										"domain" 	=>	clean_input($_POST['domain']),
										"alias" 	=>	clean_input($_POST['alias']),
										"ip_card"	=>	clean_input($_POST['ip_card']),
										"subnet" 	=>	$subnet
									)))
					$success = true;
					
		}else if($ip_type == 6){
			$ip_number = trim($_POST['ip_number_1'])
				. ':' . trim($_POST['ip_number_2'])
				. ':' . trim($_POST['ip_number_3'])
				. ':' . trim($_POST['ip_number_4'])
				. ':' . trim($_POST['ip_number_5'])
				. ':' . trim($_POST['ip_number_6'])
				. ':' . trim($_POST['ip_number_7'])
				. ':' . trim($_POST['ip_number_8']);
			if(Ipv6Address::addAddress($ip_number,$sql,array(
										"domain" 	=>	clean_input($_POST['domain']),
										"ip_card"	=>	clean_input($_POST['ip_card'])
									)))
					$success = true;
		}
		if(isset($success))
			set_page_message(tr('New IP was added!'));	
	}

	if (!isset($success) && isset($_POST['ip_number_1'])) {
		$tpl->assign(
			array(
				'VALUE_IP1'		=> $_POST['ip_number_1'],
				'VALUE_IP2'		=> $_POST['ip_number_2'],
				'VALUE_IP3'		=> $_POST['ip_number_3'],
				'VALUE_IP4'		=> $_POST['ip_number_4'],
			// SUBNET
				'VALUE_SB1'		=> $_POST['ip_subnet_1'],
				'VALUE_SB2'		=> $_POST['ip_subnet_2'],
				'VALUE_SB3'		=> $_POST['ip_subnet_3'],
				'VALUE_SB4'		=> $_POST['ip_subnet_4'],
			// BEGIN IPv6 MOD
				'VALUE_IP5'		=> $_POST['ip_number_5'],
				'VALUE_IP6'		=> $_POST['ip_number_6'],
				'VALUE_IP7'		=> $_POST['ip_number_7'],
				'VALUE_IP8'		=> $_POST['ip_number_8'],
			//END IPv6 MOD
				'VALUE_DOMAIN'	=> clean_input($_POST['domain'], true),
				'VALUE_ALIAS'	=> clean_input($_POST['alias'], true),
			)
		);
	} else {
		$tpl->assign(
			array(
				'VALUE_IP1'		=> '',
				'VALUE_IP2'		=> '',
				'VALUE_IP3'		=> '',
				'VALUE_IP4'		=> '',
			// SUBNET
				'VALUE_SB1'		=> '',
				'VALUE_SB2'		=> '',
				'VALUE_SB3'		=> '',
				'VALUE_SB4'		=> '',
			
			// BEGIN IPv6 MOD
				'VALUE_IP5'		=> '',
				'VALUE_IP6'		=> '',
				'VALUE_IP7'		=> '',
				'VALUE_IP8'		=> '',
			// END IPv6 MOD
				'VALUE_DOMAIN'	=> '',
				'VALUE_ALIAS'	=> '',
			)
		);
	}
}

function checkPost(&$sql) {
	$ip_type 	=	 clean_input($_POST["ip_type"]);
	$domain 	=	 clean_input($_POST["domain"]);
	$alias 		=	 clean_input($_POST["alias"]);
	$ip_card 	=	 clean_input($_POST["ip_card"]);
	if($ip_type == 'IPv4'){
		$ip_type = 4;
		$ip_number = trim($_POST['ip_number_1'])
			. '.' . trim($_POST['ip_number_2'])
			. '.' . trim($_POST['ip_number_3'])
			. '.' . trim($_POST['ip_number_4']);
		$subnet = trim($_POST['ip_subnet_1'])
			. '.' . trim($_POST['ip_subnet_2'])
			. '.' . trim($_POST['ip_subnet_3'])
			. '.' . trim($_POST['ip_subnet_4']);		
	}else if($ip_type == 'IPv6'){
		$ip_type = 6;
		$ip_number = trim($_POST['ip_number_1'])
			. ':' . trim($_POST['ip_number_2'])
			. ':' . trim($_POST['ip_number_3'])
			. ':' . trim($_POST['ip_number_4'])
			. ':' . trim($_POST['ip_number_5'])
			. ':' . trim($_POST['ip_number_6'])
			. ':' . trim($_POST['ip_number_7'])
			. ':' . trim($_POST['ip_number_8']);
		echo $ip_number;
	}
	global $interfaces;
	$err_msg = '_off_';

	if (($ip_type == 4) && !Ipv4Address::validateAddress($ip_number)) {
		$err_msg = tr('Wrong IP(4) number!');
	} elseif (($ip_type == 6) && !Ipv6Address::validateAddress($ip_number)){
		$err_msg = tr('Wrong IP(6) number!');
	} elseif ($domain == '') {
		$err_msg = tr('Please specify domain!');
	} elseif (($ip_type == 4) & !Ipv4Address::validateAddress($subnet,$sql)) {
		$err_msg = tr('Wrong Subnet!');
	} elseif (($ip_type == 4) & Ipv4Address::issetAddress($ip_number,$sql)) {
		$err_msg = tr('This IP already exist!');
	} elseif (($ip_type == 6) & Ipv6Address::issetAddress($ip_number,$sql)) {
		$err_msg = tr('This IP already exist!');
	} elseif (!in_array($ip_card, $interfaces->getAvailableInterface())) {
		$err_msg = tr('Please select network interface!');
	}

	if ($err_msg == '_off_') {
		return true;
	} else {
		set_page_message($err_msg);
		return false;
	}
}

// TODO
function show_Network_Cards(&$tpl, &$interfaces) {
	if ($interfaces->getErrors() != '') {
		set_page_message($interfaces->getErrors());
	}
	if ($interfaces->getAvailableInterface() != array()) {
		foreach ($interfaces->getAvailableInterface() as $interface) {
			$tpl->assign(
				array(
					'NETWORK_CARDS'	=> $interface
				)
			);
			$tpl->parse('CARD_LIST', '.card_list');
		}
	} else {
		$tpl->assign(
			array(
				'NETWORK_CARDS'	=> ''
			)
		);
		$tpl->parse('CARD_LIST', '.card_list');
	}
}


/*
 *
 * static page messages.
 *
 */
gen_admin_mainmenu($tpl, Config::get('ADMIN_TEMPLATE_PATH') . '/main_menu_settings.tpl');
gen_admin_menu($tpl, Config::get('ADMIN_TEMPLATE_PATH') . '/menu_settings.tpl');

show_Network_Cards($tpl, $interfaces);

add_ip($tpl, $sql);

show_IPs($tpl, $sql);

$tpl->assign(
	array(
		'MANAGE_IPS'		=> tr('Manage IPs'),
		'TR_AVAILABLE_IPS'	=> tr('Available IPs version 4'),
		'TR_AVAILABLE_IPS6'	=> tr('Available IPs version 6'),
		'TR_IP'				=> tr('IP'),
		'TR_TYPE'			=> tr('Address Type'),
		'TR_SUBNET'			=> tr('Subnet'),
		'TR_DOMAIN'			=> tr('Domain'),
		'TR_ALIAS'			=> tr('Alias'),
		'TR_ACTION'			=> tr('Action'),
		'TR_NETWORK_CARD'	=> tr('Network interface'),
		'TR_ADD'			=> tr('Add'),
		'TR_ADD_NEW_IP'		=> tr('Add new IP'),
		'TR_MESSAGE_DELETE'	=> tr('Are you sure you want to delete this IP: %s?', true, '%s')
	)
);

// MOD IPv6
$tpl->assign(
	array(
		'IP_TYPES'			=> 'IPv4',
	)		
);
$tpl->parse('IP_TYPE_LIST', '.ip_type_list');

$tpl->assign(
	array(
		'IP_TYPES'			=> 'IPv6',
	)		
);
$tpl->parse('IP_TYPE_LIST', '.ip_type_list');

// MOD IPv6

gen_page_message($tpl);

$tpl->parse('PAGE', 'page');
$tpl->prnt();

if (Config::get('DUMP_GUI_DEBUG')) {
	dump_gui_debug();
}
unset_messages();
