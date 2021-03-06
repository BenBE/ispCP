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
$template = 'server_status.tpl';

// static page messages

gen_admin_mainmenu($tpl, 'main_menu_general_information.tpl');
gen_admin_menu($tpl, 'menu_general_information.tpl');

$tpl->assign(
	array(
		'TR_PAGE_TITLE' => tr('ispCP Admin / System Tools / Server Status'),
		'TR_HOST' => tr('Host'),
		'TR_SERVICE' => tr('Service'),
		'TR_STATUS' => tr('Status'),
		'TR_SERVER_STATUS' => tr('Server status'),
	)
);

get_server_status($tpl, $sql);

gen_page_message($tpl);

if ($cfg->DUMP_GUI_DEBUG) {
	dump_gui_debug($tpl);
}

$tpl->display($template);

unset_messages();

/*
 * Site functions
 */

/**
 * @todo respect naming convention: getSth not GetSth and class Status not status
 */
class status {
	var $all = array();

	/**
	 * AddService adds a service to a multi-dimensional array
	 */
	function AddService($ip, $port, $service, $type) {
		$small_array = array('ip' => $ip, 'port' => $port, 'service' => $service, 'type' => $type, 'status' => '');
		array_push($this->all, $small_array);
		return $this->all;
	}

	/**
	 * GetCount returns the number of services added
	 */
	function GetCount() {
		return count($this->all);
	}

	/**
	 * CheckStatus checks the status
	 */
	function CheckStatus($timeout = 5) {
		for ($i = 0, $x = $this->GetCount() - 1; $i <= $x; $i++) {
			$ip = $this->all[$i]['ip'];
			$port = $this->all[$i]['port'];
			$errno = null;
			$errstr = null;

			if ($this->all[$i]['type'] == 'tcp') {
				$fp = @fsockopen($ip, $port, $errno, $errstr, $timeout);
			}
			else if ($this->all[$i]['type'] == 'udp') {
				$fp = @fsockopen('udp://' . $ip, $port, $errno, $errstr, $timeout);
			}
			else {
				write_log(sprintf('FIXME: %s:%d' . "\n" . 'Unknown connection type %s',__FILE__, __LINE__, $this->all[$i]['type']));
				throw new ispCP_Exception('FIXME: ' . __FILE__ . ':' . __LINE__);
			}

			if ($fp) {
				$this->all[$i]['status'] = true;
			}
			else {
				$this->all[$i]['status'] = false;
			}

			if ($fp)
				fclose($fp);
		}
	}

	/**
	 * GetStatus a unecessary function to return the status
	 */
	function GetStatus() {
		return $this->all;
	}

	/**
	 * GetSingleStatus will get the status of single address
	 */
	function GetSingleStatus($ip, $port, $type, $timeout = 5) {
		$errno = null;
		$errstr = null;
		if ($type == 'tcp') {
			$fp = @fsockopen($ip, $port, $errno, $errstr, $timeout);
		}
		else if ($type == 'udp') {
			$fp = @fsockopen('udp://' . $ip, $port, $errno, $errstr, $timeout);
		}
		else {
			write_log(sprintf('FIXME: %s:%d' . "\n" . 'Unknown connection type %s',__FILE__, __LINE__, $type));
			throw new ispCP_Exception('FIXME: ' . __FILE__ . ':' . __LINE__);
		}

		if (!$fp)
			return false;

		fclose($fp);
		return true;
	}
}

/**
 * @param ispCP_TemplateEngine $tpl
 * @param ispCP_Database $sql
 */
function get_server_status($tpl, $sql) {

	$cfg = ispCP_Registry::get('Config');

	$query = "
		SELECT
			*
		FROM
			`config`
		WHERE
			`name` LIKE 'PORT_%'
		ORDER BY
			`name` ASC
	";

	$rs = exec_query($sql, $query);

	$ispcp_status = new status;

	$ispcp_status->AddService('localhost', 9876, 'ispCP Daemon', 'tcp');

	// Dynamic added Ports
	while (!$rs->EOF) {
		$value = (count(explode(";", $rs->fields['value'])) < 6)
			? $rs->fields['value'].';'
			: $rs->fields['value'];
		list($port, $protocol, $name, $status, , $ip) = explode(";", $value);
		if ($status) {
			$ispcp_status->AddService(($ip == '127.0.0.1' ? 'localhost' : (empty($ip) ? $cfg->BASE_SERVER_IP : $ip)), (int)$port, $name, $protocol);
		}

		$rs->moveNext();
	} // end while

	$ispcp_status->CheckStatus(5);
	$data = $ispcp_status->GetStatus();
	$up = tr('UP');
	$down = tr('DOWN');

	for ($i = 0, $cnt_data = count($data); $i < $cnt_data; $i++) {
		if ($data[$i]['status']) {
			$img = $up;
			$class = "content up";
		} else {
			$img = '<strong>' . $down . '</strong>';
			$class = "content down";
		}

		if ($data[$i]['port'] == 23) { // 23 = telnet
			if ($data[$i]['status']) {
				$class = 'content2 down';
				$img = '<strong>' . $up . '</strong>';
			} else {
				$class = 'content2 up';
				$img = $down;
			}
		}

		$tpl->append(
			array(
				'HOST' => $data[$i]['ip'],
				'PORT' => $data[$i]['port'],
				'SERVICE' => tohtml($data[$i]['service']),
				'STATUS' => $img,
				'CLASS' => $class,
			)
		);

	}
}
?>