<?php
/**
 * ispCP ω (OMEGA) a Virtual Hosting Control System
 *
 * @copyright 	2001-2006 by moleSoftware GmbH
 * @copyright 	2006-2011 by ispCP | http://isp-control.net
 * @version 	SVN: $Id$
 * @link 		http://isp-control.net
 * @author		Klaas Tammling <klaas.tammling@st-city.net>
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
 * The Initial Developer of the Original Code is ispCP Team.
 * Portions created by Initial Developer are Copyright (C) 2006-2011 by
 * isp Control Panel. All Rights Reserved.
 */

require '../include/ispcp-lib.php';

check_login(__FILE__);

$cfg = ispCP_Registry::get('Config');

$tpl = ispCP_TemplateEngine::getInstance();
$template = 'ip_usage.tpl';

$reseller_id = $_SESSION['user_id'];

// static page messages
gen_logged_from($tpl);

listIPDomains($tpl, $sql);

$tpl->assign(
	array(
		'TR_PAGE_TITLE' => tr('ispCP - Reseller/IP Usage'),
		'TR_DOMAIN_STATISTICS' => tr('Domain statistics'),
		'IP_USAGE'		=> tr('IP Usage'),
		'TR_DOMAIN_NAME'	=> tr('Domain Name')
	)
);

gen_reseller_mainmenu($tpl, 'main_menu_statistics.tpl');
gen_reseller_menu($tpl, 'menu_statistics.tpl');

gen_page_message($tpl);

$tpl->display($template);

if ($cfg->DUMP_GUI_DEBUG) {
	dump_gui_debug();
}

unset_messages();

/**
 * Generate List of Domains assigned to IPs
 *
 * @param ispCP_TemplateEngine $tpl	The TPL object
 * @param ispCP_Database $sql	The SQL object
 */
function listIPDomains(&$tpl, &$sql) {

	global $reseller_id;

	$query = "
		SELECT
			`reseller_ips`
		FROM
			`reseller_props`
		WHERE
			`reseller_id` = ?;
	";

	$res = exec_query($sql, $query, $reseller_id);

	$data = $res->fetchRow();

	$reseller_ips =  explode(";", substr($data['reseller_ips'], 0, -1));

	$query = "
		SELECT
			`ip_id`, `ip_number`
		FROM
			`server_ips`
		WHERE
			`ip_id`
		IN
			(".implode(',', $reseller_ips).");
	";

	$rs = exec_query($sql, $query);

	while (!$rs->EOF) {

		$no_domains = false;
		$no_alias_domains = false;

		$query = "
			SELECT
				`d`.`domain_name`, `a`.`admin_name`
			FROM
				`domain` d
			INNER JOIN
				`admin` a
			ON
				(`a`.`admin_id` = `d`.`domain_created_id`)
			WHERE
				`d`.`domain_ip_id` = ?
			AND
				`d`.`domain_created_id` = ?
			ORDER BY
				`d`.`domain_name`;
		";

		$rs2 = exec_query($sql, $query, array($rs->fields['ip_id'], $reseller_id));
		$domain_count = $rs2->recordCount();

		if ($rs2->recordCount() == 0) {
			$no_domains = true;
		}

		while(!$rs2->EOF) {
			$tpl->assign(
				array(
					'DOMAIN_NAME'	=>	$rs2->fields['domain_name']
				)
			);

			$rs2->moveNext();
		}

		$query = "
			SELECT
				`da`.`alias_name`, `a`.`admin_name`
			FROM
				`domain_aliasses` da
			INNER JOIN
				`domain` d
			ON
				(`d`.`domain_id` = `da`.`domain_id`)
			INNER JOIN
				`admin` a
			ON
				(`a`.`admin_id` = `d`.`domain_created_id`)
			WHERE
				`da`.`alias_ip_id` = ?
			AND
				`d`.`domain_created_id` = ?
			ORDER BY
				`da`.`alias_name`;
		";

		$rs3 = exec_query($sql, $query, array($rs->fields['ip_id'], $reseller_id));
		$alias_count = $rs3->recordCount();

		if ($rs3->recordCount() == 0) {
			$no_alias_domains = true;
		}

		while(!$rs3->EOF) {
			$tpl->assign(
				array(
					'DOMAIN_NAME'	=> $rs3->fields['alias_name']
				)
			);

			$rs3->moveNext();
		}

		$tpl->assign(
			array(
				'IP'			=> $rs->fields['ip_number'],
				'RECORD_COUNT'	=> tr('Total Domains') . " : " .($domain_count+$alias_count)
			)
		);

		if ($no_domains && $no_alias_domains) {
			$tpl->assign(
				array(
					'DOMAIN_NAME'	=> tr("No records found"),
					'RESELLER_NAME'	=> ''
				)
			);
		}

		$tpl->assign('DOMAIN_ROW', '');
		$rs->moveNext();
	} // end while
}
?>