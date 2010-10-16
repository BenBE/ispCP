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

function get_domain_default_props(&$sql, $domain_admin_id, $returnWKeys = false) {

	// /!\ Note to dev:
	// Please, when you adds new field here, you must
	// report it in all scripts that calls this function.

	$query = "
		SELECT
			`domain_id`,
			`domain_name`,
			`domain_gid`,
			`domain_uid`,
			`domain_created_id`,
			`domain_created`,
			`domain_expires`,
			`domain_last_modified`,
			`domain_mailacc_limit`,
			`domain_ftpacc_limit`,
			`domain_traffic_limit`,
			`domain_sqld_limit`,
			`domain_sqlu_limit`,
			`domain_status`,
			`domain_alias_limit`,
			`domain_subd_limit`,
			`domain_ip_id`,
			`domain_disk_limit`,
			`domain_disk_usage`,
			`domain_php`,
			`domain_cgi`,
			`allowbackup`,
			`domain_dns`
		FROM
			`domain`
		WHERE
			`domain_admin_id` = ?
		;
	";

	$rs = exec_query($sql, $query, $domain_admin_id);

	if (!$returnWKeys) {
		return array(
			$rs->fields['domain_id'],
			$rs->fields['domain_name'],
			$rs->fields['domain_gid'],
			$rs->fields['domain_uid'],
			$rs->fields['domain_created_id'],
			$rs->fields['domain_created'],
			$rs->fields['domain_expires'],
			$rs->fields['domain_last_modified'],
			$rs->fields['domain_mailacc_limit'],
			$rs->fields['domain_ftpacc_limit'],
			$rs->fields['domain_traffic_limit'],
			$rs->fields['domain_sqld_limit'],
			$rs->fields['domain_sqlu_limit'],
			$rs->fields['domain_status'],
			$rs->fields['domain_alias_limit'],
			$rs->fields['domain_subd_limit'],
			$rs->fields['domain_ip_id'],
			$rs->fields['domain_disk_limit'],
			$rs->fields['domain_disk_usage'],
			$rs->fields['domain_php'],
			$rs->fields['domain_cgi'],
			$rs->fields['allowbackup'],
			$rs->fields['domain_dns']
		);
	} else {
		return $rs->fields;
	}
}

function get_domain_running_sub_cnt(&$sql, $domain_id) {

	$query = "
		SELECT
			COUNT(*) AS cnt
		FROM
			`subdomain`
		WHERE
			`domain_id` = ?
		;
	";

	$rs = exec_query($sql, $query, $domain_id);

	$sub_count = $rs->fields['cnt'];

	$query = "
		SELECT
			COUNT(`subdomain_alias_id`) AS cnt
		FROM
			`subdomain_alias`
		WHERE
			`alias_id` IN (SELECT `alias_id` FROM `domain_aliasses` WHERE `domain_id` = ?)
		;
	";

	$rs = exec_query($sql, $query, $domain_id);

	$alssub_count = $rs->fields['cnt'];

	return $sub_count+$alssub_count;
}

function get_domain_running_als_cnt(&$sql, $domain_id) {

	$query = "
		SELECT
			COUNT(*) AS cnt
		FROM
			`domain_aliasses`
		WHERE
			`domain_id` = ?
		;
	";

	$rs = exec_query($sql, $query, $domain_id);

	$als_count = $rs->fields['cnt'];

	return $als_count;
}

function get_domain_running_mail_acc_cnt(&$sql, $domain_id) {

	$cfg = ispCP_Registry::get('Config');

	$qr_dmn = "
		SELECT
			COUNT(`mail_id`) AS cnt
		FROM
			`mail_users`
		WHERE
			`mail_type` RLIKE 'normal_'
		AND
			`mail_type` NOT LIKE 'normal_catchall'
		AND
			`domain_id` = ?
	";

	$qr_als = "
		SELECT
			COUNT(`mail_id`) AS cnt
		FROM
			`mail_users`
		WHERE
			`mail_type` RLIKE 'alias_'
		AND
			`mail_type` NOT LIKE 'alias_catchall'
		AND
			`domain_id` = ?
	";

	$qr_sub = "
		SELECT
			COUNT(`mail_id`) AS cnt
		FROM
			`mail_users`
		WHERE
			`mail_type` RLIKE 'subdom_'
		AND
			`mail_type` NOT LIKE 'subdom_catchall'
		AND
			`domain_id` = ?
	";

	$qr_alssub = "
		SELECT
			COUNT(`mail_id`) AS cnt
		FROM
			`mail_users`
		WHERE
			`mail_type` RLIKE 'alssub_'
		AND
			`mail_type` NOT LIKE 'alssub_catchall'
		AND
			`domain_id` = ?
	";

	if ($cfg->COUNT_DEFAULT_EMAIL_ADDRESSES == 0) {
		$qr_dmn .= "
			AND
				`mail_acc` != 'abuse'
			AND
				`mail_acc` != 'postmaster'
			AND
				`mail_acc` != 'webmaster'
			;
		";

		$qr_als .= "
			AND
				`mail_acc` != 'abuse'
			AND
				`mail_acc` != 'postmaster'
			AND
				`mail_acc` != 'webmaster'
			;
		";

		$qr_sub .= "
			AND
				`mail_acc` != 'abuse'
			AND
				`mail_acc` != 'postmaster'
			AND
				`mail_acc` != 'webmaster'
			;
		";

		$qr_alssub .= "
			AND
				`mail_acc` != 'abuse'
			AND
				`mail_acc` != 'postmaster'
			AND
				`mail_acc` != 'webmaster'
			;
		";
	}

	$rs = exec_query($sql, $qr_dmn, $domain_id);
	$dmn_mail_acc = $rs->fields['cnt'];

	$rs = exec_query($sql, $qr_als, $domain_id);
	$als_mail_acc = $rs->fields['cnt'];

	$rs = exec_query($sql, $qr_sub, $domain_id);
	$sub_mail_acc = $rs->fields['cnt'];

	$rs = exec_query($sql, $qr_alssub, $domain_id);
	$alssub_mail_acc = $rs->fields['cnt'];

	return array(
		$dmn_mail_acc + $als_mail_acc + $sub_mail_acc + $alssub_mail_acc,
		$dmn_mail_acc,
		$als_mail_acc,
		$sub_mail_acc,
		$alssub_mail_acc
	);
}

function get_domain_running_dmn_ftp_acc_cnt(&$sql, $domain_id) {

	$cfg = ispCP_Registry::get('Config');
	$ftp_separator = $cfg->FTP_USERNAME_SEPARATOR;

	$query = "
		SELECT
			`domain_name`
		FROM
			`domain`
		WHERE
			`domain_id` = ?
		;
	";

	$rs = exec_query($sql, $query, $domain_id);

	$dmn_name = $rs->fields['domain_name'];

	$query = "
		SELECT
			COUNT(*) AS cnt
		FROM
			`ftp_users`
		WHERE
			`userid` LIKE ?
		;
	";

	$rs = exec_query($sql, $query, '%' . $ftp_separator . $dmn_name);

	// domain ftp account count
	return $rs->fields['cnt'];
}

function get_domain_running_sub_ftp_acc_cnt(&$sql, $domain_id) {

	$cfg = ispCP_Registry::get('Config');
	$ftp_separator = $cfg->FTP_USERNAME_SEPARATOR;

	$query = "
		SELECT
			`subdomain_name`
		FROM
			`subdomain`
		WHERE
			`domain_id` = ?
		ORDER BY
			`subdomain_id`
		;
	";

	$query2 = "
		SELECT
			`domain_name`
		FROM
			`domain`
		WHERE
			`domain_id` = ?
		;
	";

	$dmn = exec_query($sql, $query2, $domain_id);
	$rs = exec_query($sql, $query, $domain_id);

	$sub_ftp_acc_cnt = 0;

	while (!$rs->EOF) {
		$sub_name = $rs->fields['subdomain_name'];

		$query = "
			SELECT
				COUNT(*) AS cnt
			FROM
				`ftp_users`
			WHERE
				`userid` LIKE ?
			;
		";

		$rs_cnt = exec_query($sql, $query, '%' . $ftp_separator . $sub_name . '.' . $dmn->fields['domain_name']);

		$sub_ftp_acc_cnt += $rs_cnt->fields['cnt'];

		$rs->moveNext();
	}

	return $sub_ftp_acc_cnt;
}

function get_domain_running_als_ftp_acc_cnt(&$sql, $domain_id) {

	$cfg = ispCP_Registry::get('Config');

	$ftp_separator = $cfg->FTP_USERNAME_SEPARATOR;

	$query = "
		SELECT
			`alias_name`
		FROM
			`domain_aliasses`
		WHERE
			`domain_id` = ?
		ORDER BY
			`alias_id`
		;
	";

	$rs = exec_query($sql, $query, $domain_id);

	$als_ftp_acc_cnt = 0;

	while (!$rs->EOF) {
		$als_name = $rs->fields['alias_name'];

		$query = "
			SELECT
				COUNT(*) AS cnt
			FROM
				`ftp_users`
			WHERE
				`userid` LIKE ?
			;
		";

		$rs_cnt = exec_query($sql, $query, '%' . $ftp_separator . $als_name);

		$als_ftp_acc_cnt += $rs_cnt->fields['cnt'];

		$rs->moveNext();
	}

	return $als_ftp_acc_cnt;
}

function get_domain_running_ftp_acc_cnt(&$sql, $domain_id) {

	$dmn_ftp_acc_cnt = get_domain_running_dmn_ftp_acc_cnt($sql, $domain_id);
	$sub_ftp_acc_cnt = get_domain_running_sub_ftp_acc_cnt($sql, $domain_id);
	$als_ftp_acc_cnt = get_domain_running_als_ftp_acc_cnt($sql, $domain_id);

	return array(
		$dmn_ftp_acc_cnt + $sub_ftp_acc_cnt + $als_ftp_acc_cnt,
		$dmn_ftp_acc_cnt,
		$sub_ftp_acc_cnt,
		$als_ftp_acc_cnt
	);
}

function get_domain_running_sqld_acc_cnt(&$sql, $domain_id) {

	$query = "
		SELECT
			COUNT(*) AS cnt
		FROM
			`sql_database`
		WHERE
			`domain_id` = ?
		;
	";

	$rs = exec_query($sql, $query, $domain_id);

	$sqld_acc_cnt = $rs->fields['cnt'];

	return $sqld_acc_cnt;
}

function get_domain_running_sqlu_acc_cnt(&$sql, $domain_id) {

	$query = "
		SELECT DISTINCT
			t1.`sqlu_name`
		FROM
			`sql_user` AS t1, `sql_database` AS t2
		WHERE
			t2.`domain_id` = ?
		AND
			t2.`sqld_id` = t1.`sqld_id`
		;
	";

	$rs = exec_query($sql, $query, $domain_id);

	$sqlu_acc_cnt = $rs->recordCount();

	return $sqlu_acc_cnt;
}

function get_domain_running_sql_acc_cnt(&$sql, $domain_id) {

	$sqld_acc_cnt = get_domain_running_sqld_acc_cnt($sql, $domain_id);
	$sqlu_acc_cnt = get_domain_running_sqlu_acc_cnt($sql, $domain_id);

	return array($sqld_acc_cnt, $sqlu_acc_cnt);
}

function get_domain_running_props_cnt(&$sql, $domain_id) {

	$sub_cnt = get_domain_running_sub_cnt($sql, $domain_id);
	$als_cnt = get_domain_running_als_cnt($sql, $domain_id);

	list($mail_acc_cnt, $dmn_mail_acc_cnt, $sub_mail_acc_cnt, $als_mail_acc_cnt, $alssub_mail_acc_cnt) = get_domain_running_mail_acc_cnt($sql, $domain_id);
	list($ftp_acc_cnt, $dmn_ftp_acc_cnt, $sub_ftp_acc_cnt, $als_ftp_acc_cnt) = get_domain_running_ftp_acc_cnt($sql, $domain_id);
	list($sqld_acc_cnt, $sqlu_acc_cnt) = get_domain_running_sql_acc_cnt($sql, $domain_id);

	return array($sub_cnt, $als_cnt, $mail_acc_cnt, $ftp_acc_cnt, $sqld_acc_cnt, $sqlu_acc_cnt);
}

/**
 * Populate the main & sub menus
 *
 * @param object $tpl template object
 * @param string $name section name
 */
function gen_client_menu(&$tpl, $name) {
	$cfg = ispCP_Registry::get('Config');
	$sql = ispCP_Registry::get('Db');
      
	add_main_menu_item($tpl, tr('General information'), 'general', 'index.php', $name == 'general_information');
	
    list(,,,,,,,,$dmn_mailacc_limit,$dmn_ftpacc_limit,,$dmn_sqld_limit,,,$dmn_als_limit,$dmn_subd_limit,,,,,,,$domain_dns)
		= get_domain_default_props($sql, $_SESSION['user_id']);

	if ($dmn_als_limit != -1 || $dmn_subd_limit != -1 || $domain_dns == 'yes')
        add_main_menu_item($tpl, tr('Manage domains'), 'domains', 'domains_manage.php', $name == 'manage_domains');

	if ($dmn_mailacc_limit != -1)
        add_main_menu_item($tpl,  tr('Email Accounts'), 'email', 'mail_accounts.php', $name == 'email_accounts');

	if ($dmn_ftpacc_limit != -1)
        add_main_menu_item($tpl,  tr('FTP Accounts'), 'ftp', 'ftp_accounts.php', $name == 'ftp_accounts');

    if ($dmn_sqld_limit != -1)
        add_main_menu_item($tpl,  tr('Manage SQL'), 'database', 'sql_manage.php', $name == 'manage_sql');
    
    add_main_menu_item($tpl,  tr('Webtools'), 'webtools', 'webtools.php', $name == 'webtools');
    add_main_menu_item($tpl,  tr('Domain statistics'), 'statistics', 'domain_statistics.php', $name == 'domain_statistics');

	$query = "
		SELECT
			`support_system`
		FROM
			`reseller_props`
		WHERE
			`reseller_id` = ?
		;
	";

	$rs = exec_query($sql, $query, $_SESSION['user_created_by']);

	if ($cfg->ISPCP_SUPPORT_SYSTEM && $rs->fields['support_system'] == 'yes')
		add_main_menu_item($tpl, tr('Support system'), 'support',
			$cfg->ISPCP_SUPPORT_SYSTEM_PATH, $name == 'ticket_system',
			$cfg->ISPCP_SUPPORT_SYSTEM_TARGET);

/*	if ($cfg->AWSTATS_ACTIVE == 'yes')
        add_main_menu_item($tpl, tr('Web statistics'), 'statistics', 'http://' . $_SESSION['user_logged'] . '/stats/', false, '_blank');
*/

	$query = "
		SELECT
			*
		FROM
			`custom_menus`
		WHERE
			`menu_level` = 'user'
		OR
			`menu_level` = 'all'
		;
	";

	$rs = exec_query($sql, $query);

	if ( $rs->recordCount() > 0) {
		global $i;
		$i = 100;

		while (!$rs->EOF) {
			$menu_name = $rs->fields['menu_name'];
			$menu_link = get_menu_vars($rs->fields['menu_link']);
			$menu_target = $rs->fields['menu_target'];
			$menu_link = str_replace('{ispcp_uname}', $_SESSION['user_logged'], $menu_link);

			if ($menu_target !== '') {
				$menu_target = 'target="' . tohtml($menu_target) . '"';
			}

			add_main_menu_item($tpl, tohtml($menu_name), 'custom_link', tohtml($menu_link), $menu_target);

			$rs->moveNext();
			$i++;
		}
	}

	switch ($name) {
	case 'general_information':
		$tpl->assign( 'SIDE_MENU_TITLE', tr('General information') );
		$tpl->assign( 'SIDE_MENU_ICON', 'general_big.png' );

		add_sub_menu_item($tpl, tr('Overview'), 'index.php');
		add_sub_menu_item($tpl, tr('Change password'), 'password_change.php');
		add_sub_menu_item($tpl, tr('Change personal data'), 'personal_change.php');
		add_sub_menu_item($tpl, tr('Language'), 'language.php');

		// Hide 'Update Hosting Package'-Button, if there are none
		$query = "
			SELECT
				`id`
			FROM
				`hosting_plans`
			WHERE
				`reseller_id` = ?
			AND
				`status` = '1';
		";

		$rs = exec_query($sql, $query, $_SESSION['user_created_by']);
		if ($rs->recordCount() > 0 && $cfg->HOSTING_PLANS_LEVEL != 'admin')
			add_sub_menu_item($tpl, tr('Update Hosting Package'), 'hosting_plan_update.php');
		break;
	case 'manage_domains':
		$query = "
			SELECT
				`domain_id`, `domain_alias_limit`, `domain_subd_limit`, `domain_dns`
			FROM
				`domain`
			WHERE
				`domain_admin_id` = ?;
		";
		$rs = exec_query($sql, $query, $_SESSION['user_id']);

		$tpl->assign('SIDE_MENU_TITLE', tr('Manage domains'));
		$tpl->assign('SIDE_MENU_ICON', 'domain_big.png');

		add_sub_menu_item($tpl, tr('Overview'), 'domains_manage.php');
		if ($rs->fields['domain_subd_limit'] == 0
			|| get_domain_running_sub_cnt($sql, $rs->fields['domain_id']) < $rs->fields['domain_subd_limit'])
		{
			$tpl->assign( 'SUBDOMAIN_ADD', true );
			add_sub_menu_item($tpl, tr('Add subdomain'), 'subdomain_add.php');
		}
		if ($rs->fields['domain_alias_limit'] == 0
			|| get_domain_running_als_cnt($sql, $rs->fields['domain_id']) < $rs->fields['domain_alias_limit'])
		{
			$tpl->assign( 'ALIAS_ADD', true );
			add_sub_menu_item($tpl, tr('Add alias'), 'alias_add.php');
		}
		if ($rs->fields['domain_dns'] == 'yes')
		{
			$tpl->assign( 'ISACTIVE_DNS', true );
			add_sub_menu_item($tpl, tr("Add DNS zone's record"), 'dns_add.php');
		}
		break;
	case 'email_accounts':
		$tpl->assign('SIDE_MENU_TITLE', tr('Email Accounts'));
		$tpl->assign('SIDE_MENU_ICON', 'email_big.png');

		add_sub_menu_item($tpl, tr('Overview'), 'mail_accounts.php');
		add_sub_menu_item($tpl, tr('Add mail user'), 'mail_add.php');
		add_sub_menu_item($tpl, tr('Catch all'), 'mail_catchall.php');
		add_sub_menu_item($tpl, tr('Webmail'), $cfg->WEBMAIL_PATH, $cfg->WEBMAIL_TARGET);
		break;
	case 'ftp_accounts':
		$tpl->assign('SIDE_MENU_TITLE', tr('FTP Accounts'));
		$tpl->assign('SIDE_MENU_ICON', 'ftp_big.png');

		add_sub_menu_item($tpl, tr('Overview'), 'ftp_accounts.php');
		add_sub_menu_item($tpl, tr('Add FTP user'), 'ftp_add.php');
		add_sub_menu_item($tpl, tr('Filemanager'), $cfg->FILEMANAGER_PATH, $cfg->FILEMANAGER_TARGET);
		break;
	case 'manage_sql':
		$tpl->assign('SIDE_MENU_TITLE', tr('Manage SQL'));
		$tpl->assign('SIDE_MENU_ICON', 'database_big.png');

		add_sub_menu_item($tpl, tr('Overview'), 'sql_manage.php');
		add_sub_menu_item($tpl, tr('Add SQL database'), 'sql_database_add.php');
		add_sub_menu_item($tpl, tr('PhpMyAdmin'), $cfg->PMA_PATH, $cfg->PMA_TARGET);
		break;
	case 'webtools':
		$query = "
			SELECT
				`domain_mailacc_limit`, `allowbackup`, `domain_dns`
			FROM
				`domain`
			WHERE
				`domain_admin_id` = ?;
		";
		$rs = exec_query($sql, $query, $_SESSION['user_id']);

		$tpl->assign('SIDE_MENU_TITLE', tr('Webtools'));
		$tpl->assign('SIDE_MENU_ICON', 'webtools_big.png');

		add_sub_menu_item($tpl, tr('Overview'), 'webtools.php');
		add_sub_menu_item($tpl, tr('Protected areas'), 'protected_areas.php');
		add_sub_menu_item($tpl, tr('Group/User management'), 'protected_user_manage.php');
		add_sub_menu_item($tpl, tr('Error pages'), 'error_pages.php');
		if ($rs->fields['allowbackup'] == 'yes')
			add_sub_menu_item($tpl, tr('Daily backup'), 'backup.php');
		if ($rs->fields['domain_mailacc_limit'] != -1)
			add_sub_menu_item($tpl, tr('Webmail'), $cfg->WEBMAIL_PATH, $cfg->WEBMAIL_TARGET);
		add_sub_menu_item($tpl, tr('Filemanager'), $cfg->FILEMANAGER_PATH, $cfg->FILEMANAGER_TARGET);
		if ($cfg->AWSTATS_ACTIVE == 'yes')
		{
			$tpl->assign('ACTIVE_AWSTATS', true);
			add_sub_menu_item($tpl, tr('Web statistics'), 'http://' . $_SESSION['user_logged'] . '/stats/', '_blank');
		}
		break;
	case 'domain_statistics':
		$tpl->assign('SIDE_MENU_TITLE', tr('Domain statistics'));
		$tpl->assign('SIDE_MENU_ICON', 'statistics_big.png');

		add_sub_menu_item($tpl, tr('Overview'), 'domain_statistics.php');
		if ($cfg->AWSTATS_ACTIVE == 'yes')
		{
			$tpl->assign('ACTIVE_AWSTATS', true);
			add_sub_menu_item($tpl, tr('Web statistics'), 'http://' . $_SESSION['user_logged'] . '/stats/', '_blank');
		}
		break;
	case 'ticket_system':
		$tpl->assign('SIDE_MENU_TITLE', tr('Support system'));
		$tpl->assign('SIDE_MENU_ICON', 'support_big.png');

		add_sub_menu_item($tpl, tr('Open tickets'), $cfg->ISPCP_SUPPORT_SYSTEM_PATH, $cfg->ISPCP_SUPPORT_SYSTEM_TARGET);
		add_sub_menu_item($tpl, tr('Closed tickets'), 'ticket_closed.php');
		add_sub_menu_item($tpl, tr('New ticket'), 'ticket_create.php');
		break;
	}
	
    $tpl->assign(
		array(
			'TR_MENU_LOGOUT' => tr('Logout'),
			'VERSION' => $cfg->Version,
			'BUILDDATE' => $cfg->BuildDate,
			'CODENAME' => $cfg->CodeName
		)
	);
}

function get_user_domain_id(&$sql, $user_id) {

	$query = "
		SELECT
			`domain_id`
		FROM
			`domain`
		WHERE
			`domain_admin_id` = ?
		;
	";

	$rs = exec_query($sql, $query, $user_id);

	return $rs->fields['domain_id'];
}

function user_trans_mail_type($mail_type) {

	if ($mail_type === MT_NORMAL_MAIL) {
		return tr('Domain mail');
	} else if ($mail_type === MT_NORMAL_FORWARD) {
		return tr('Email forward');
	} else if ($mail_type === MT_ALIAS_MAIL) {
		return tr('Alias mail');
	} else if ($mail_type === MT_ALIAS_FORWARD) {
		return tr('Alias forward');
	} else if ($mail_type === MT_SUBDOM_MAIL) {
		return tr('Subdomain mail');
	} else if ($mail_type === MT_SUBDOM_FORWARD) {
		return tr('Subdomain forward');
	} else if ($mail_type === MT_ALSSUB_MAIL) {
		return tr('Alias subdomain mail');
	} else if ($mail_type === MT_ALSSUB_FORWARD) {
		return tr('Alias subdomain forward');
	} else if ($mail_type === MT_NORMAL_CATCHALL) {
		return tr('Domain mail');
	} else if ($mail_type === MT_ALIAS_CATCHALL) {
		return tr('Domain mail');
	} else {
		return tr('Unknown type');
	}
}

/**
 * goto the given destination file
 *
 * @param string $dest destination for header location (path + filename + params)
 */
function user_goto($dest) {
	header('Location: ' . $dest);
	die('FIXME: ' . __FILE__ . ':' . __LINE__);
}

function count_sql_user_by_name(&$sql, $sqlu_name) {

	$query = "
		SELECT
			COUNT(*) AS cnt
		FROM
			`sql_user`
		WHERE
			`sqlu_name` = ?
		;
	";

	$rs = exec_query($sql, $query, $sqlu_name);

	return $rs->fields['cnt'];
}

/**
 * @todo see dirty hack
 */
function sql_delete_user(&$sql, $dmn_id, $db_user_id) {

	// let's get sql user common data;
	$query = "
		SELECT
			t1.`sqld_id`, t1.`sqlu_name`, t2.`sqld_name`, t1.`sqlu_name`
		FROM
			`sql_user` AS t1,
			`sql_database` AS t2
		WHERE
			t1.`sqld_id` = t2.`sqld_id`
		AND
			t2.`domain_id` = ?
		AND
			t1.`sqlu_id` = ?
		;
	";

	$rs = exec_query($sql, $query, array($dmn_id, $db_user_id));

	if ($rs->recordCount() == 0) {
		// dirty hack admin can't delete users without database
		if ($_SESSION['user_type'] === 'admin'
			|| $_SESSION['user_type'] === 'reseller') {
			return;
		}
		user_goto('sql_manage.php');
	}

	// remove from ispcp sql_user table.
	$query = 'DELETE FROM `sql_user` WHERE `sqlu_id` = ?';
	exec_query($sql, $query, $db_user_id);

	update_reseller_c_props(get_reseller_id($dmn_id));

	$db_name = quoteIdentifier($rs->fields['sqld_name']);
	$db_user_name = $rs->fields['sqlu_name'];

	if (count_sql_user_by_name($sql, $rs->fields['sqlu_name']) == 0) {
		$db_id = $rs->fields['sqld_id'];

		// revoke grants on global level, if any;
		$query = "REVOKE ALL ON *.* FROM ?@'%';";
		$rs = exec_query($sql, $query, $db_user_name);

		$query = "REVOKE ALL ON *.* FROM ?@localhost;";
		$rs = exec_query($sql, $query, $db_user_name);

		// delete user record from mysql.user table;
		$query = "DROP USER ?@'%';";
		$rs = exec_query($sql, $query, $db_user_name);

		$query = "DROP USER ?@'localhost';";
		$rs = exec_query($sql, $query, $db_user_name);

		// flush privileges.
		$query = "FLUSH PRIVILEGES;";
		$rs = exec_query($sql, $query);
	} else {
		$query = "REVOKE ALL ON $db_name.* FROM ?@'%';";
		$rs = exec_query($sql, $query, $db_user_name);

		$query = "REVOKE ALL ON $db_name.* FROM ?@localhost;";
		$rs = exec_query($sql, $query, $db_user_name);
	}
}

function check_permissions(&$tpl) {

	if (isset($_SESSION['sql_support']) && $_SESSION['sql_support'] == "no") {
		$tpl->assign('SQL_SUPPORT', '');
	}
	if (isset($_SESSION['email_support']) && $_SESSION['email_support'] == "no") {
		$tpl->assign('ADD_EMAIL', '');
	}
	if (isset($_SESSION['subdomain_support']) && $_SESSION['subdomain_support'] == "no") {
		$tpl->assign('SUBDOMAIN_SUPPORT', '');
	}
	if (isset($_SESSION['alias_support']) && $_SESSION['alias_support'] == "no") {
		$tpl->assign('DOMAINALIAS_SUPPORT', '');
	}
	if (isset($_SESSION['subdomain_support']) && $_SESSION['subdomain_support'] == "no") {
		$tpl->assign('SUBDOMAIN_SUPPORT_CONTENT', '');
	}
	if (isset($_SESSION['alias_support']) && $_SESSION['alias_support'] == "no") {
		$tpl->assign('DOMAINALIAS_SUPPORT_CONTENT', '');
	}
	if (isset($_SESSION['alias_support']) && $_SESSION['alias_support'] == "no"
		&& isset($_SESSION['subdomain_support']) && $_SESSION['subdomain_support'] == "no") {
		$tpl->assign('DMN_MNGMNT', '');
	}
}

function check_usr_sql_perms(&$sql, $db_user_id) {

	if (who_owns_this($db_user_id, 'sqlu_id') != $_SESSION['user_id']) {
		set_page_message(tr('User does not exist or you do not have permission to access this interface!'));

		user_goto('sql_manage.php');
	}
}

function check_db_sql_perms(&$sql, $db_id) {

	if (who_owns_this($db_id, 'sqld_id') != $_SESSION['user_id']) {
		set_page_message(tr('User does not exist or you do not have permission to access this interface!'));

		user_goto('sql_manage.php');
	}
}

function check_ftp_perms($sql, $ftp_acc) {

	if (who_owns_this($ftp_acc, 'ftp_user') != $_SESSION['user_id']) {
		set_page_message(tr('User does not exist or you do not have permission to access this interface!'));

		user_goto('ftp_accounts.php');
	}
}

function delete_sql_database(&$sql, $dmn_id, $db_id) {

	$query = "
		SELECT
			`sqld_name` AS db_name
		FROM
			`sql_database`
		WHERE
			`domain_id` = ?
		AND
			`sqld_id` = ?
		;
	";

	$rs = exec_query($sql, $query, array($dmn_id, $db_id));

	if ($rs->recordCount() == 0) {
		if ($_SESSION['user_type'] === 'admin'
			|| $_SESSION['user_type'] === 'reseller') {
			return;
		}
		user_goto('sql_manage.php');
	}

	$db_name = quoteIdentifier($rs->fields['db_name']);

	// have we any users assigned to this database;
	$query = "
		SELECT
			t2.`sqlu_id` AS db_user_id,
			t2.`sqlu_name` AS db_user_name
		FROM
			`sql_database` AS t1,
			`sql_user` AS t2
		WHERE
			t1.`sqld_id` = t2.`sqld_id`
		AND
			t1.`domain_id` = ?
		AND
			t1.`sqld_id` = ?
		;
	";

	$rs = exec_query($sql, $query, array($dmn_id, $db_id));

	if ($rs->recordCount() != 0) {
		while (!$rs->EOF) {
			$db_user_id = $rs->fields['db_user_id'];

			$db_user_name = $rs->fields['db_user_name'];

			sql_delete_user($sql, $dmn_id, $db_user_id);

			$rs->moveNext();
		}
	}

	// drop desired database;
	$query = "DROP DATABASE IF EXISTS $db_name;";
	exec_query($sql, $query);

	write_log($_SESSION['user_logged'] . ": delete SQL database: " . $db_name);
	// delete desired database from the ispcp sql_database table;

	$query = "
		DELETE FROM
			`sql_database`
		WHERE
			`domain_id` = ?
		AND
			`sqld_id` = ?
		;
	";

	exec_query($sql, $query, array($dmn_id, $db_id));

	update_reseller_c_props(get_reseller_id($dmn_id));
}

function get_gender_by_code($code, $nullOnBad = false) {

	switch (strtolower($code)) {
		case 'm':
		case 'M':
			return tr('Male');
		case 'f':
		case 'F':
			return tr('Female');
		default:
			return (!$nullOnBad) ? tr('Unknown') : null;
	}
}

function mount_point_exists($dmn_id, $mnt_point) {

	$sql = ispCP_Registry::get('Db');

	$query = "
		SELECT
			t1.`domain_id`, t2.`alias_mount`, t3.`subdomain_mount`, t4.`subdomain_alias_mount`
		FROM
			`domain` AS t1
		LEFT JOIN
			(`domain_aliasses` AS t2)
		ON
			(t1.`domain_id` = t2.`domain_id`)
		LEFT JOIN
			(`subdomain` AS t3)
		ON
			(t1.`domain_id` = t3.`domain_id`)
		LEFT JOIN
			(`subdomain_alias` AS t4)
		ON
			(t2.`alias_id` = t4.`alias_id`)
		WHERE
			t1.`domain_id` = ?
		AND
			(
				`alias_mount` = ?
			OR
				`subdomain_mount` = ?
			OR
				`subdomain_alias_mount` = ?
			)
	";

	$rs = exec_query($sql, $query, array($dmn_id, $mnt_point, $mnt_point, $mnt_point));

	if ($rs->rowCount() > 0) {
		return true;
	}
	return false;
}
