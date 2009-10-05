<?php
/**
 * ispCP ω (OMEGA) a Virtual Hosting Control System
 *
 * @copyright	2001-2006 by moleSoftware GmbH
 * @copyright	2006-2009 by ispCP | http://isp-control.net
 * @version		SVN: $Id: hosting_plan_edit.php 1744 2009-05-07 03:21:47Z haeber $
 * @link		http://isp-control.net
 * @author		ispCP Team
 *
 * @license
 *   This program is free software; you can redistribute it and/or modify it under
 *   the terms of the MPL General Public License as published by the Free Software
 *   Foundation; either version 1.1 of the License, or (at your option) any later
 *   version.
 *   You should have received a copy of the MPL Mozilla Public License along with
 *   this program; if not, write to the Open Source Initiative (OSI)
 *   http://opensource.org | osi@opensource.org
 */

require '../include/ispcp-lib.php';

check_login(__FILE__);

if (strtolower(Config::get('HOSTING_PLANS_LEVEL')) != 'admin') {
	user_goto('index.php');
}

$tpl = new pTemplate();
$tpl->define_dynamic('page', Config::get('ADMIN_TEMPLATE_PATH') . '/hosting_plan_edit.tpl');
$tpl->define_dynamic('page_message', 'page');

$theme_color = Config::get('USER_INITIAL_THEME');

/*
 *
 * static page messages.
 *
 */

global $hpid;
// Show main menu
gen_admin_mainmenu($tpl, Config::get('ADMIN_TEMPLATE_PATH') . '/main_menu_hosting_plan.tpl');
gen_admin_menu($tpl, Config::get('ADMIN_TEMPLATE_PATH') . '/menu_hosting_plan.tpl');

$tpl->assign(
		array(
			'TR_RESELLER_MAIN_INDEX_PAGE_TITLE' => tr('ispCP - Administrator/Edit hosting plan'),
			'THEME_COLOR_PATH' => "../themes/$theme_color",
			'THEME_CHARSET' => tr('encoding'),
			'ISP_LOGO' => get_logo($_SESSION['user_id'])
		)
);

$tpl->assign(
		array(
				'TR_HOSTING PLAN PROPS'		=> tr('Hosting plan properties'),
				'TR_TEMPLATE_NAME'			=> tr('Template name'),
				'TR_MAX_SUBDOMAINS'		 	=> tr('Max subdomains<br><i>(-1 disabled, 0 unlimited)</i>'),
				'TR_MAX_ALIASES'			=> tr('Max aliases<br><i>(-1 disabled, 0 unlimited)</i>'),
				'TR_MAX_MAILACCOUNTS'		=> tr('Mail accounts limit<br><i>(-1 disabled, 0 unlimited)</i>'),
				'TR_MAX_FTP'				=> tr('FTP accounts limit<br><i>(-1 disabled, 0 unlimited)</i>'),
				'TR_MAX_SQL'				=> tr('SQL databases limit<br><i>(-1 disabled, 0 unlimited)</i>'),
				'TR_MAX_SQL_USERS'			=> tr('SQL users limit<br><i>(-1 disabled, 0 unlimited)</i>'),
				'TR_MAX_TRAFFIC'			=> tr('Traffic limit [MB]<br><i>(0 unlimited)</i>'),
				'TR_DISK_LIMIT'				=> tr('Disk limit [MB]<br><i>(0 unlimited)</i>'),
				'TR_PHP'					=> tr('PHP'),
				'TR_CGI'					=> tr('CGI / Perl'),
				'TR_DNS'					=> tr('Allow adding records to DNS zone'),
				'TR_BACKUP'					=> tr('Backup'),
				'TR_BACKUP_DOMAIN'			=> tr('Domain'),
				'TR_BACKUP_SQL'				=> tr('SQL'),
				'TR_BACKUP_FULL'			=> tr('Full'),
				'TR_BACKUP_NO'				=> tr('No'),
				'TR_APACHE_LOGS'			=> tr('Apache logfiles'),
				'TR_AWSTATS'				=> tr('AwStats'),
				'TR_YES'					=> tr('yes'),
				'TR_NO'						=> tr('no'),
				'TR_BILLING_PROPS'			=> tr('Billing Settings'),
				'TR_PRICE_STYLE'			=> tr('Price Style'),
				'TR_PRICE'					=> tr('Price'),
				'TR_SETUP_FEE'				=> tr('Setup fee'),
				'TR_VALUE'					=> tr('Currency'),
				'TR_PAYMENT'				=> tr('Payment period'),
				'TR_STATUS'					=> tr('Available for purchasing'),
				'TR_TEMPLATE_DESCRIPTON'	=> tr('Description'),
				'TR_EXAMPLE'				=> tr('(e.g. EUR)'),
				'TR_UPDATE_PLAN'			=> tr('Update plan')
		)
);

/*
 * Dynamic page process
 */
if (UserIO::POST_String('uaction') == 'add_plan') {
	// Process data
	if (check_data_iscorrect($tpl)) { // Save data to db
		save_data_to_db();
	} else {
		restore_form($tpl);
	}
} else {
	// Get hosting plan id that comes for edit
	$hpid = UserIO::GET_Int('hpid');

	gen_load_ehp_page($tpl, $sql, $hpid, $_SESSION['user_id']);
	$tpl->assign('MESSAGE', "");
}

gen_page_message($tpl);
$tpl->parse('PAGE', 'page');
$tpl->prnt();

if (Config::get('DUMP_GUI_DEBUG')) {
	dump_gui_debug();
}
/*
 * Function definitions
 */

/**
 * Restore form on any error
 */
function restore_form(&$tpl) {
	$tpl->assign(
		array(
			'HP_NAME_VALUE' => UserIO::HTML(UserIO::POST_String('hp_name')),
			'HP_DESCRIPTION_VALUE' => UserIO::HTML(UserIO::POST_String('hp_description')),
			'TR_MAX_SUB_LIMITS' => UserIO::HTML(UserIO::POST_String('hp_sub')),
			'TR_MAX_ALS_VALUES' => UserIO::HTML(UserIO::POST_String('hp_als')),
			'HP_MAIL_VALUE' => UserIO::HTML(UserIO::POST_String('hp_mail')),
			'HP_FTP_VALUE' => UserIO::HTML(UserIO::POST_String('hp_ftp')),
			'HP_SQL_DB_VALUE' => UserIO::HTML(UserIO::POST_String('hp_sql_db')),
			'HP_SQL_USER_VALUE' => UserIO::HTML(UserIO::POST_String('hp_sql_user')),
			'HP_TRAFF_VALUE' => UserIO::HTML(UserIO::POST_String('hp_traff')),
			'HP_TRAFF' => UserIO::HTML(UserIO::POST_String('hp_traff')),
			'HP_DISK_VALUE' => UserIO::HTML(UserIO::POST_String('hp_disk')),
			'HP_PRICE_STYLE' => format_price(UserIO::HTML(UserIO::POST_String('hp_style'))),
			'HP_PRICE' => UserIO::HTML(UserIO::POST_String('hp_price')),
			'HP_SETUPFEE' => UserIO::HTML(UserIO::POST_String('hp_setupfee')),
			'HP_CURRENCY' => UserIO::HTML(UserIO::POST_String('hp_currency')),
			'HP_PAYMENT' => UserIO::HTML(UserIO::POST_String('hp_payment'))
		)
	);

	$tpl->assign(
			array(
					'TR_PHP_YES'	=> (UserIO::POST_String('php') == '_yes_') 	? 'checked="checked"' : '',
					'TR_PHP_NO'		=> (UserIO::POST_String('php') == '_no_')  	? 'checked="checked"' : '',
					'TR_CGI_YES'	=> (UserIO::POST_String('cgi') == '_yes_') 	? 'checked="checked"' : '',
					'TR_CGI_NO'		=> (UserIO::POST_String('cgi') == '_no_') 	? 'checked="checked"' : '',
					'VL_BACKUPD'	=> ($hp_backup == '_dmn_')    				? 'checked="checked"' : '',
					'VL_BACKUPS'	=> ($hp_backup == '_sql_')    				? 'checked="checked"' : '',
					'VL_BACKUPF'	=> ($hp_backup == '_full_')   				? 'checked="checked"' : '',
					'VL_BACKUPN'	=> ($hp_backup == '_no_')     				? 'checked="checked"' : '',
					'TR_DNS_YES'	=> (UserIO::POST_String('dns') == '_yes_') 	? 'checked="checked"' : '',
					'TR_DNS_NO'		=> (UserIO::POST_String('dns') == '_no_')  	? 'checked="checked"' : '',
					'TR_STATUS_YES'	=> (UserIO::POST_String('status')) 			? 'checked="checked"' : '',
					'TR_STATUS_NO'	=> (UserIO::POST_String('status')) 			? '' : 'checked="checked"',
			)
	);

} // end of function restore_form()

/**
 * Generate load data from sql for requested hosting plan
 */
function gen_load_ehp_page(&$tpl, &$sql, $hpid, $admin_id) {

	$_SESSION['hpid'] = $hpid;

	$query = <<<SQL_QUERY
		SELECT
			*
		FROM
			`hosting_plans`
		WHERE
			`id` = ?;
SQL_QUERY;
	$res = exec_query($sql, $query, array($hpid));

	$readonly = '';
	$disabled = '';
	$edit_hp = tr('Edit hosting plan');

	// $tpl->parse('FORM', 'page');
	if ($res->RowCount() !== 1) { // Error
		user_goto('hosting_plan.php');
	}

	$data = $res->FetchRow();
	$props = $data['props'];
	$description = $data['description'];
	$price = $data['price'];
	$setup_fee = $data['setup_fee'];
	$value = $data['value'];
	$payment = $data['payment'];
	$status = $data['status'];

	list(	
			$hp_php,
			$hp_cgi,
			$hp_sub,
			$hp_als,
			$hp_mail,
			$hp_ftp,
			$hp_sql_db,
			$hp_sql_user,
			$hp_traff,
			$hp_disk,
			$hp_backup,
			$hp_dns
		) = explode(";", $props);

	$hp_name = $data['name'];

	if ($description == '')
		$description = '';

	if ($payment == '')
		$payment = '';

	if ($value == '')
		$value = '';

	$tpl->assign(
		array(
			'HP_NAME_VALUE' => UserIO::HTML($hp_name),
			'TR_EDIT_HOSTING_PLAN' => UserIO::HTML($edit_hp),
			'TR_MAX_SUB_LIMITS' => $hp_sub,
			'TR_MAX_ALS_VALUES' => $hp_als,
			'HP_MAIL_VALUE' => $hp_mail,
			'HP_FTP_VALUE' => $hp_ftp,
			'HP_SQL_DB_VALUE' => $hp_sql_db,
			'HP_SQL_USER_VALUE' => $hp_sql_user,
			'HP_TRAFF_VALUE' => $hp_traff,
			'HP_DISK_VALUE' => $hp_disk,
			'HP_DESCRIPTION_VALUE' => UserIO::HTML($description),
			'HP_PRICE' => $price,
			'HP_SETUPFEE' => $setup_fee,
			'HP_CURRENCY' => UserIO::HTML($value),
			'READONLY' => $readonly,
			'DISBLED' => $disabled,
			'HP_PAYMENT' => UserIO::HTML($payment)
		)
	);

	$tpl->assign(
			array(
					'TR_PHP_YES'	=> (UserIO::POST_String('php') == '_yes_') 	? 'checked="checked"' : '',
					'TR_PHP_NO'		=> (UserIO::POST_String('php') == '_no_')  	? 'checked="checked"' : '',
					'TR_CGI_YES'	=> (UserIO::POST_String('cgi') == '_yes_') 	? 'checked="checked"' : '',
					'TR_CGI_NO'		=> (UserIO::POST_String('cgi') == '_no_') 	? 'checked="checked"' : '',
					'VL_BACKUPD'	=> ($hp_backup == '_dmn_')    				? 'checked="checked"' : '',
					'VL_BACKUPS'	=> ($hp_backup == '_sql_')    				? 'checked="checked"' : '',
					'VL_BACKUPF'	=> ($hp_backup == '_full_')   				? 'checked="checked"' : '',
					'VL_BACKUPN'	=> ($hp_backup == '_no_')     				? 'checked="checked"' : '',
					'TR_DNS_YES'	=> (UserIO::POST_String('dns') == '_yes_') 	? 'checked="checked"' : '',
					'TR_DNS_NO'		=> (UserIO::POST_String('dns') == '_no_')  	? 'checked="checked"' : '',
					'TR_STATUS_YES'	=> (UserIO::POST_String('status')) 			? 'checked="checked"' : '',
					'TR_STATUS_NO'	=> (UserIO::POST_String('status')) 			? '' : 'checked="checked"',
			)
	);

} // end of gen_load_ehp_page()

/**
 * Check correction of input data
 */
function check_data_iscorrect(&$tpl) {

	global $hp_name, $hp_php, $hp_cgi;
	global $hp_sub, $hp_als, $hp_mail;
	global $hp_ftp, $hp_sql_db, $hp_sql_user;
	global $hp_traff, $hp_disk;
	global $hpid;
	global $hp_backup, $hp_dns;
	global $hp_price, $hp_setupfee;

	$ahp_error		= '_off_';
	$hp_name		= UserIO::POST_String('hp_name');
	$hp_sub			= UserIO::POST_String('hp_sub');
	$hp_als			= UserIO::POST_String('hp_als');
	$hp_mail		= UserIO::POST_String('hp_mail');
	$hp_ftp			= UserIO::POST_String('hp_ftp');
	$hp_sql_db		= UserIO::POST_String('hp_sql_db');
	$hp_sql_user	= UserIO::POST_String('hp_sql_user');
	$hp_traff		= UserIO::POST_String('hp_traff');
	$hp_disk		= UserIO::POST_String('hp_disk');

	if (isset($_SESSION['hpid']))
	{
		$hpid = $_SESSION['hpid'];
	}
	else
	{
		$ahp_error = tr('Undefined reference to data!');
	}
	
	// put hosting plan id into session value
	$_SESSION['hpid'] = $hpid;

	// Get values from previous page and check them
	$hp_php = UserIO::POST_String('php');
	$hp_cgi = UserIO::POST_String('cgi');
        $hp_backup = UserIO::POST_String('backup');
	$hp_dns = UserIO::POST_String('dns');

	$hp_price = UserIO::POST_Float('hp_price', true);
	if ($hp_price === false) {
		$ahp_error = tr('Incorrect price. Example: 9.99');
	}

	$hp_setupfee = UserIO::POST_Float('hp_setupfee', true);
	if ($hp_setupfee === false) {
		$ahp_error = tr('Incorrect setup fee. Example: 19.99');
	}

	if (!ispcp_limit_check($hp_sub, -1)) {
		$ahp_error = tr('Incorrect subdomains limit!');
	} else if (!ispcp_limit_check($hp_als, -1)) {
		$ahp_error = tr('Incorrect aliases limit!');
	} else if (!ispcp_limit_check($hp_mail, -1)) {
		$ahp_error = tr('Incorrect mail accounts limit!');
	} else if (!ispcp_limit_check($hp_ftp, -1)) {
		$ahp_error = tr('Incorrect FTP accounts limit!');
	} else if (!ispcp_limit_check($hp_sql_user, -1)) {
		$ahp_error = tr('Incorrect SQL databases limit!');
	} else if (!ispcp_limit_check($hp_sql_db, -1)) {
		$ahp_error = tr('Incorrect SQL users limit!');
	} else if (!ispcp_limit_check($hp_traff, null)) {
		$ahp_error = tr('Incorrect traffic limit!');
	} else if (!ispcp_limit_check($hp_disk, null)) {
		$ahp_error = tr('Incorrect disk quota limit!');
	}

	if ($ahp_error == '_off_') {
		$tpl->assign('MESSAGE', '');
		return true;
	} else {
		set_page_message($ahp_error);
		return false;
	}
} // end of check_data_iscorrect()

/**
 * Add new host plan to DB
 */
function save_data_to_db() {

	global $hp_name, $hp_php, $hp_cgi;
	global $hp_sub, $hp_als, $hp_mail;
	global $hp_ftp, $hp_sql_db, $hp_sql_user;
	global $hp_traff, $hp_disk;
	global $hpid, $hp_backup, $hp_dns;
	global $hp_price, $hp_setupfee;
	$sql = Database::getInstance();
	
	$description		= UserIO::POST_Memo('hp_description');
	$value			= UserIO::POST_String('hp_currency');
	$payment		= UserIO::POST_String('hp_payment');
	$status			= UserIO::POST_String('status');

	$hp_props = "$hp_php;$hp_cgi;$hp_sub;$hp_als;$hp_mail;$hp_ftp;$hp_sql_db;$hp_sql_user;$hp_traff;$hp_disk;$hp_backup;$hp_dns";

	$query = <<<SQL_QUERY
		UPDATE
			`hosting_plans`
		SET
			`name` = ?,
			`description` = ?,
			`props` = ?,
			`price` = ?,
			`setup_fee` = ?,
			`value` = ?,
			`payment` = ?,
			`status` = ?
		WHERE
			`id` = ?
SQL_QUERY;

	$res = exec_query($sql, $query, array($hp_name, $description, $hp_props, $hp_price, $hp_setup_fee, $value, $payment, $status, $hpid));
	$_SESSION['hp_updated'] = "_yes_";
	user_goto('hosting_plan.php');

} // end of save_data_to_db()

die();
