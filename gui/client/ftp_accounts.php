<?php
/**
 * ispCP ω (OMEGA) a Virtual Hosting Control System
 *
 * @copyright 	2001-2006 by moleSoftware GmbH
 * @copyright 	2006-2010 by ispCP | http://isp-control.net
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
 * Portions created by the ispCP Team are Copyright (C) 2006-2010 by
 * isp Control Panel. All Rights Reserved.
 */

require '../include/ispcp-lib.php';

check_login(__FILE__);

$cfg = ispCP_Registry::get('Config');

$tpl = ispCP_Registry::get('template');
$tpl->assign('PAGE_TITLE', tr('ispCP - Client/Manage Users'));
$tpl->assign('PAGE_CONTENT', 'ftp_accounts.tpl');

// page functions.

function gen_page_ftp_list(&$tpl, &$sql, $dmn_id, $dmn_name) {
	$query = "
		SELECT
			`gid`,
			`members`
		FROM
			`ftp_group`
		WHERE
			`groupname` = ?
	";

	$rs = exec_query($sql, $query, $dmn_name);

	if ($rs->recordCount() == 0) {
		$tpl->assign('FTP_MSG', tr('FTP list is empty!'));
	} else {
		$ftp_accs = explode(',', $rs->fields['members']);
		sort($ftp_accs);
		reset($ftp_accs);

		for ($i = 0, $cnt_ftp_accs = count($ftp_accs); $i < $cnt_ftp_accs; $i++) {
			$tpl->append('ITEM_CLASS', ($i % 2 == 0) ? 'content' : 'content2');

			$ftp_accs_encode[$i] = decode_idna($ftp_accs[$i]);

			$tpl->append(
				array(
					'FTP_ACCOUNT' => tohtml($ftp_accs_encode[$i]),
					'UID' => urlencode($ftp_accs[$i])
				)
			);
		}
		$tpl->assign('TOTAL_FTP_ACCOUNTS', count($ftp_accs));
	}
}

function gen_page_lists(&$tpl, &$sql, $user_id) {

	list($dmn_id,
		$dmn_name,
		$dmn_gid,
		$dmn_uid,
		$dmn_created_id,
		$dmn_created,
		$dmn_expires,
		$dmn_last_modified,
		$dmn_mailacc_limit,
		$dmn_ftpacc_limit,
		$dmn_traff_limit,
		$dmn_sqld_limit,
		$dmn_sqlu_limit,
		$dmn_status,
		$dmn_als_limit,
		$dmn_subd_limit,
		$dmn_ip_id,
		$dmn_disk_limit,
		$dmn_disk_usage,
		$dmn_php,
		$dmn_cgi,
		$allowbackup,
		$dmn_dns
	) = get_domain_default_props($sql, $user_id);

	gen_page_ftp_list($tpl, $sql, $dmn_id, $dmn_name);
	// return $total_mails;
}

// dynamic page data.


gen_page_lists($tpl, $sql, $_SESSION['user_id']);

// static page messages.

gen_client_menu($tpl, 'ftp_accounts');

gen_logged_from($tpl);

check_permissions($tpl);

$tpl->assign(
	array(
		'TR_MANAGE_USERS' => tr('Manage users'),
		'TR_TYPE' => tr('Type'),
		'TR_STATUS' => tr('Status'),
		'TR_ACTION' => tr('Action'),
		'TR_TOTAL_FTP_ACCOUNTS' => tr('FTPs total'),
		'TR_DOMAIN' => tr('Domain'),
		'TR_FTP_USERS' => tr('FTP users'),
		'TR_FTP_ACCOUNT' => tr('FTP account'),
		'TR_FTP_ACTION' => tr('Action'),
		'TR_EDIT' => tr('Edit'),
		'TR_DELETE' => tr('Delete'),
		'TR_MESSAGE_DELETE' => tr('Are you sure you want to delete %s?', true, '%s')
	)
);

gen_page_message($tpl);

$tpl->prnt();

if ($cfg->DUMP_GUI_DEBUG) {
	dump_gui_debug();
}

unset_messages();
