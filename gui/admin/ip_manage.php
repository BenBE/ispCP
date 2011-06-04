<?php
/**
 * ispCP ω (OMEGA) a Virtual Hosting Control System
 *
 * @copyright 	2001-2006 by moleSoftware GmbH
 * @copyright 	2006-2011 by ispCP | http://isp-control.net
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
 * The Original Code is "VHCS - Virtual Hosting Control System".
 *
 * The Initial Developer of the Original Code is moleSoftware GmbH.
 * Portions created by Initial Developer are Copyright (C) 2001-2006
 * by moleSoftware GmbH. All Rights Reserved.
 * Portions created by the ispCP Team are Copyright (C) 2006-2011 by
 * isp Control Panel. All Rights Reserved.
 */

require '../include/ispcp-lib.php';

check_login(__FILE__);

$cfg = ispCP_Registry::get('Config');

$tpl = ispCP_TemplateEngine::getInstance();
$template = 'ip_manage.tpl';

$interfaces=new ispCP_NetworkCard();

show_Network_Cards($tpl, $interfaces);

add_ip($tpl, $sql);

show_IPs($tpl, $sql);

// static page messages
$tpl->assign(
	array(
		'TR_PAGE_TITLE'		=> tr('ispCP - Admin/IP manage'),
		'TR_SETTINGS'		=> tr('Settings'),
		'MANAGE_IPS'		=> tr('Manage IPs'),
		'TR_AVAILABLE_IPS'	=> tr('Available IPs'),
		'TR_IP'				=> tr('IP'),
		'TR_DOMAIN'			=> tr('Domain'),
		'TR_ALIAS'			=> tr('Alias'),
		'TR_ACTION'			=> tr('Action'),
		'TR_NETWORK_CARD'	=> tr('Network interface'),
		'TR_ADD'			=> tr('Add'),
		'TR_ADD_NEW_IP'		=> tr('Add new IP'),
		'TR_MESSAGE_DELETE'	=> tr('Are you sure you want to delete this IP: %s?', true, '%s')
	)
);

gen_admin_mainmenu($tpl, 'main_menu_settings.tpl');
gen_admin_menu($tpl, 'menu_settings.tpl');

gen_page_message($tpl);

$tpl->display($template);

if ($cfg->DUMP_GUI_DEBUG) {
	dump_gui_debug();
}

unset_messages();

function gen_ip_action($ip_id, $status) {

	$cfg = ispCP_Registry::get('Config');

	if ($status == $cfg->ITEM_OK_STATUS) {
		return array(tr('Remove IP'), 'ip_delete.php?delete_id=' . $ip_id);
	} else {
		return array(tr('N/A'), '#');
	}
}

/**
 * @param ispCP_TemplateEngine $tpl
 * @param ispCP_Database $sql
 */
function show_IPs($tpl, $sql) {

	$cfg = ispCP_Registry::get('Config');

	$query = "
		SELECT
			*
		FROM
			`server_ips`
	";
	$rs = exec_query($sql, $query);

	$row = 1;
	$single = false;

	if ($rs->recordCount() < 2) {
		$single = true;
	}

	while (!$rs->EOF) {
		$tpl->assign('IP_CLASS', ($row++ % 2 == 0) ? 'content' : 'content2');

		list($ip_action, $ip_action_script) = gen_ip_action($rs->fields['ip_id'], $rs->fields['ip_status']);

		$tpl->append(
			array(
				'IP'			=> $rs->fields['ip_number'],
				'DOMAIN'		=> tohtml($rs->fields['ip_domain']),
				'ALIAS'			=> tohtml($rs->fields['ip_alias']),
				'NETWORK_CARD'	=> ($rs->fields['ip_card'] === NULL) ? '' : tohtml($rs->fields['ip_card'])
			)
		);

		if ($single == true) {
			$tpl->append('IP_ACTION', false);
		} else {
			$tpl->append(
				array(
					'IP_DELETE_SHOW'	=> '',
					'IP_ACTION'			=> ($cfg->BASE_SERVER_IP == $rs->fields['ip_number']) ? false : $ip_action,
					'IP_ACTION_SCRIPT'	=> ($cfg->BASE_SERVER_IP == $rs->fields['ip_number']) ? '#' : $ip_action_script
				)
			);
		}


		$rs->moveNext();
	} // end while
}

/**
 * @param ispCP_TemplateEngine $tpl
 * @param ispCP_Database $sql
 */
function add_ip($tpl, $sql) {

	global $ip_number, $domain, $alias, $ip_card;
	$cfg = ispCP_Registry::get('Config');

	if (isset($_POST['uaction']) && $_POST['uaction'] === 'add_ip') {
		if (check_user_data()) {

			$query = "
				INSERT INTO `server_ips`
					(`ip_number`, `ip_domain`, `ip_alias`, `ip_card`,
					`ip_ssl_domain_id`, `ip_status`)
				VALUES
					(?, ?, ?, ?, ?, ?)
			";
			exec_query($sql, $query, array($ip_number, htmlspecialchars($domain, ENT_QUOTES, "UTF-8"),
			htmlspecialchars($alias, ENT_QUOTES, "UTF-8"), htmlspecialchars($ip_card, ENT_QUOTES, "UTF-8"), NULL, $cfg->ITEM_ADD_STATUS));

			send_request();

			set_page_message(tr('New IP was added!'), 'success');

			write_log("{$_SESSION['user_logged']}: adds new IPv4 address: {$ip_number}!");

			$sucess = true;
		}
	}

	if (!isset($sucess) && isset($_POST['ip_number_1'])) {
		$tpl->assign(
			array(
				'VALUE_IP1'		=> tohtml($_POST['ip_number_1']),
				'VALUE_IP2'		=> tohtml($_POST['ip_number_2']),
				'VALUE_IP3'		=> tohtml($_POST['ip_number_3']),
				'VALUE_IP4'		=> tohtml($_POST['ip_number_4']),
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
				'VALUE_DOMAIN'	=> '',
				'VALUE_ALIAS'	=> '',
			)
		);
	}
}

function check_user_data() {
	global $ip_number, $interfaces;

	$ip_number = trim($_POST['ip_number_1'])
		. '.' . trim($_POST['ip_number_2'])
		. '.' . trim($_POST['ip_number_3'])
		. '.' . trim($_POST['ip_number_4']);

	global $domain, $alias, $ip_card;

	$domain = clean_input($_POST['domain']);
	$alias = clean_input($_POST['alias']);
	$ip_card = clean_input($_POST['ip_card']);

	$err_msg = '_off_';

	if (filter_var($ip_number, FILTER_VALIDATE_IP, FILTER_FLAG_IPV4) === false) {
		$err_msg = tr('Wrong IP number!');
	} elseif ($domain == '') {
		$err_msg = tr('Please specify domain!');
	} elseif ($alias == '') {
		$err_msg = tr('Please specify alias!');
	} elseif (IP_exists()) {
		$err_msg = tr('This IP already exist!');
	} elseif (!in_array($ip_card, $interfaces->getAvailableInterface())) {
		$err_msg = tr('Please select nework interface!');
	}

	if ($err_msg == '_off_') {
		return true;
	} else {
		set_page_message($err_msg, 'error');
		return false;
	}
}

function IP_exists() {

	$sql = ispCP_Registry::get('Db');

	global $ip_number;

	$query = "
		SELECT
			*
		FROM
			`server_ips`
		WHERE
			`ip_number` = ?
	";

	$rs = exec_query($sql, $query, $ip_number);

	if ($rs->rowCount() == 0) {
		return false;
	}
	return true;
}

/**
 * @param ispCP_TemplateEngine $tpl
 * @param ispCP_NetworkCard $interfaces
 */
function show_Network_Cards($tpl, $interfaces) {

	if ($interfaces->getErrors() != '') {
		set_page_message($interfaces->getErrors(), 'error');
	}
	if ($interfaces->getAvailableInterface() != array()) {
		foreach ($interfaces->getAvailableInterface() as $interface) {
			$tpl->assign(
				array(
					'NETWORK_CARDS'	=> $interface
				)
			);
		}
	} else {
		$tpl->assign(
			array(
				'NETWORK_CARDS'	=> ''
			)
		);
	}
}
?>