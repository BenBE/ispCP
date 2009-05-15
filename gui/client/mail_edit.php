<?php
/**
 * ispCP ω (OMEGA) a Virtual Hosting Control System
 *
 * @copyright	2001-2006 by moleSoftware GmbH
 * @copyright	2006-2009 by ispCP | http://isp-control.net
 * @version		SVN: $Id: mail_edit.php 1744 2009-05-07 03:21:47Z haeber $
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

$tpl = new pTemplate();
$tpl->define_dynamic('page', Config::get('CLIENT_TEMPLATE_PATH') . '/mail_edit.tpl');
$tpl->define_dynamic('page_message', 'page');
$tpl->define_dynamic('logged_from', 'page');
$tpl->define_dynamic('normal_mail', 'page');
$tpl->define_dynamic('forward_mail', 'page');

// page functions

function edit_mail_account(&$tpl, &$sql) {
	if (!UserIO::GET_isset('id') || UserIO::GET_Int('id') === '' || !is_numeric(UserIO::GET_Int('id'))) {
		set_page_message(tr('Email account not found!'));
		user_goto('mail_accounts.php');
	} else {
		$mail_id = UserIO::GET_Int('id');
	}

	$dmn_name = $_SESSION['user_logged'];

	$query = "
		SELECT
			t1.*, t2.`domain_id`, t2.`domain_name`
		FROM
			`mail_users` AS t1,
			`domain` AS t2
		WHERE
			t1.`mail_id` = ?
		AND
			t2.`domain_id` = t1.`domain_id`
		AND
			t2.`domain_name` = ?
	";

	$rs = exec_query($sql, $query, array($mail_id, $dmn_name));

	if ($rs->RecordCount() == 0) {
		set_page_message(tr('User does not exist or you do not have permission to access this interface!'));
		user_goto('mail_accounts.php');
	} else {
		$mail_acc = $rs->fields['mail_acc'];
		$domain_id = $rs->fields['domain_id'];
		$mail_type_list = $rs->fields['mail_type'];
		$mail_forward = $rs->fields['mail_forward'];
		$sub_id = $rs->fields['sub_id'];

		foreach (explode(',', $mail_type_list) as $mail_type) {
			if ($mail_type == MT_NORMAL_MAIL) {
				$mtype[] = 1;
				$res1 = exec_query($sql, "SELECT `domain_name` FROM `domain` WHERE `domain_id` = ?", array($domain_id));
				$tmp1 = $res1->FetchRow(0);
				$maildomain = $tmp1['domain_name'];
			} else if ($mail_type == MT_NORMAL_FORWARD) {
				$mtype[] = 4;
				$res1 = exec_query($sql, "SELECT `domain_name` FROM `domain` WHERE `domain_id` = ?", array($domain_id));
				$tmp1 = $res1->FetchRow(0);
				$maildomain = $tmp1['domain_name'];
			} else if ($mail_type == MT_ALIAS_MAIL) {
				$mtype[] = 2;
				$res1 = exec_query($sql, "SELECT `alias_name` FROM `domain_aliasses` WHERE `alias_id` = ?", array($sub_id));
				$tmp1 = $res1->FetchRow(0);
				$maildomain = $tmp1['alias_name'];
			} else if ($mail_type == MT_ALIAS_FORWARD) {
				$mtype[] = 5;
				$res1 = exec_query($sql, "SELECT `alias_name` FROM `domain_aliasses` WHERE `alias_id` = ?", array($sub_id));
				$tmp1 = $res1->FetchRow();
				$maildomain = $tmp1['alias_name'];
			} else if ($mail_type == MT_SUBDOM_MAIL) {
				$mtype[] = 3;
				$res1 = exec_query($sql, "SELECT `subdomain_name` FROM `subdomain` WHERE `subdomain_id` = ?", array($sub_id));
				$tmp1 = $res1->FetchRow();
				$maildomain = $tmp1['subdomain_name'];
				$res1 = exec_query($sql, "SELECT `domain_name` FROM `domain` WHERE `domain_id` = ?", array($domain_id));
				$tmp1 = $res1->FetchRow(0);
				$maildomain = $maildomain . "." . $tmp1['domain_name'];
			} else if ($mail_type == MT_SUBDOM_FORWARD) {
				$mtype[] = 6;
				$res1 = exec_query($sql, "SELECT `subdomain_name` FROM `subdomain` WHERE `subdomain_id` = ?", array($sub_id));
				$tmp1 = $res1->FetchRow();
				$maildomain = $tmp1['subdomain_name'];
				$res1 = exec_query($sql, "SELECT `domain_name` FROM `domain` WHERE `domain_id` = ?", array($domain_id));
				$tmp1 = $res1->FetchRow(0);
				$maildomain = $maildomain . "." . $tmp1['domain_name'];
			} else if ($mail_type == MT_ALSSUB_MAIL) {
				$mtype[] = 7;
				$res1 = exec_query($sql, "SELECT `subdomain_alias_name`, `alias_id` FROM `subdomain_alias` WHERE `subdomain_alias_id` = ?", array($sub_id));
				$tmp1 = $res1->FetchRow();
				$maildomain = $tmp1['subdomain_alias_name'];
				$alias_id = $tmp1['alias_id'];
				$res1 = exec_query($sql, "SELECT `alias_name` FROM `domain_aliasses` WHERE `alias_id` = ?", array($alias_id));
				$tmp1 = $res1->FetchRow(0);
				$maildomain = $maildomain . "." . $tmp1['alias_name'];
			} else if ($mail_type == MT_ALSSUB_FORWARD) {
				$mtype[] = 8;
				$res1 = exec_query($sql, "SELECT `subdomain_alias_name`, `alias_id` FROM `subdomain_alias` WHERE `subdomain_alias_id` = ?", array($sub_id));
				$tmp1 = $res1->FetchRow();
				$maildomain = $tmp1['subdomain_alias_name'];
				$alias_id = $tmp1['alias_id'];
				$res1 = exec_query($sql, "SELECT `alias_name` FROM `domain_aliasses` WHERE `alias_id` = ?", array($alias_id));
				$tmp1 = $res1->FetchRow(0);
				$maildomain = $maildomain . "." . $tmp1['alias_name'];
			}
		}

		$mail_forward = UserIO::POST_Memo('forward_list');
		$mail_acc = decode_idna($mail_acc);
		$maildomain = decode_idna($maildomain);
		$tpl->assign(
			array(
				'EMAIL_ACCOUNT'	=> UserIO::HTML($mail_acc . "@" . $maildomain),
				'FORWARD_LIST'	=> str_replace(',', "\n", UserIO::HTML($mail_forward)),
				'MTYPE'			=> implode(',', $mtype),
				'MAIL_TYPE'		=> $mail_type_list,
				'MAIL_ID'		=> $mail_id
			)
		);

		if (($mail_forward !== '_no_') && (count($mtype) > 1)) {
			$tpl->assign(
				array(
					'ACTION'				=> 'update_pass,update_forward',
					'FORWARD_MAIL'			=> '',
					'FORWARD_MAIL_CHECKED'	=> 'checked="checked"',
					'FORWARD_LIST_DISABLED'	=> 'false'
				)
			);
			$tpl->parse('NORMAL_MAIL', '.normal_mail');
		} else if ($mail_forward === '_no_') {
			$tpl->assign(
				array(
					'ACTION'				=> 'update_pass',
					'FORWARD_MAIL'			=> '',
					'FORWARD_MAIL_CHECKED'	=> '',
					'FORWARD_LIST'			=> '',
					'FORWARD_LIST_DISABLED'	=> 'true'
				)
			);
			$tpl->parse('NORMAL_MAIL', '.normal_mail');
		} else {
			$tpl->assign(
				array(
					'ACTION'				=> 'update_forward',
					'NORMAL_MAIL'			=> '',
					'FORWARD_LIST_DISABLED'	=> 'false'
				)
			);
			$tpl->parse('FORWARD_MAIL', '.forward_mail');
		}
	}
}

function update_email_pass($sql) {
	if (!UserIO::POST_isset('uaction')) {
		return false;
	}
	if (preg_match('/update_pass/', UserIO::POST_String('uaction')) == 0) {
		return true;
	}
	
	$pass = UserIO::POST_String('pass', false, true);
	$pass_rep = UserIO::POST_String('pass_rep', false, true);

	if (preg_match('/update_forward/', UserIO::POST_String('uaction')) == 1 || UserIO::POST_isset('mail_forward')) {
		// The user only wants to update the forward list, not the password
		if ($pass == '' && $pass_rep == '') {
			return true;
		}
	}

	$mail_id = UserIO::GET_Int('id');
	$mail_account = UserIO::POST_String('mail_account');

	if ($pass == '' || $pass_rep == '' || $mail_id == 0) {
		set_page_message(tr('Password data is missing!'));
		return false;
	} else if ($pass !== $pass_rep) {
		set_page_message(tr('Entered passwords differ!'));
		return false;
	} else if (!chk_password($pass, 50, "/[`\xb4'\"\\\\\x01-\x1f\015\012|<>^$]/i")) { // Not permitted chars
		if (Config::get('PASSWD_STRONG')) {
			set_page_message(sprintf(tr('The password must be at least %s long and contain letters and numbers to be valid.'), Config::get('PASSWD_CHARS')));
		} else {
			set_page_message(sprintf(tr('Password data is shorter than %s signs or includes not permitted signs!'), Config::get('PASSWD_CHARS')));
		}
		return false;
	} else {
		$pass=encrypt_db_password($pass);
		$status = Config::get('ITEM_CHANGE_STATUS');
		check_for_lock_file();
		$query = "UPDATE `mail_users` SET `mail_pass` = ?, `status` = ? WHERE `mail_id` = ?";
		$rs = exec_query($sql, $query, array($pass, $status, $mail_id));
		write_log($_SESSION['user_logged'] . ": change mail account password: $mail_account");
		return true;
	}
}

function update_email_forward(&$tpl, &$sql) {
	if (!UserIO::POST_isset('uaction')) {
		return false;
	}
	if (preg_match('/update_forward/', UserIO::POST_String('uaction')) == 0
		&& !UserIO::POST_isset('mail_forward')) {
		return true;
	}

	$mail_account = UserIO::POST_String('mail_account');
	$mail_id = UserIO::GET_Int('id');
	$forward_list = UserIO::POST_Memo('forward_list');
	$_mail_type = UserIO::POST_String('mail_type');
	$mail_accs = array();

	if (UserIO::POST_Int('mail_forward') == 1
		|| UserIO::POST_String('uaction') == 'update_forward') {
		$faray = preg_split ('/[\n\s,]+/', $forward_list);

		foreach ($faray as $value) {
			$value = trim($value);
			if (!chk_email($value) && $value !== '') {
				/* ERROR .. strange :) not email in this line - warning */
				set_page_message(tr("Mail forward list error!"));
				return false;
			} else if ($value === '') {
				set_page_message(tr("Mail forward list error!"));
				return false;
			}
			$mail_accs[] = $value;
		}

		$forward_list = implode(',', $mail_accs);

		// Check if the mail type doesn't contain xxx_forward and append it
		if (preg_match('/_forward/', $mail_type) == 0) {
			// Get mail account type and append the corresponding xxx_forward
			if ($_mail_type == MT_NORMAL_MAIL) {
				$mail_type = $mail_type . ',' . MT_NORMAL_FORWARD;
			} else if ($_mail_type == MT_ALIAS_MAIL) {
				$mail_type = $mail_type . ',' . MT_ALIAS_FORWARD;
			} else if ($_mail_type == MT_SUBDOM_MAIL) {
				$mail_type = $mail_type . ',' . MT_SUBDOM_FORWARD;
			} else if ($_mail_type == MT_ALSSUB_MAIL) {
				$mail_type = $mail_type . ',' . MT_ALSSUB_FORWARD;
			}
		} else {
			// The mail type already contains xxx_forward, so we can use _POST['mail_type']
			$mail_type = $_mail_type;
		}
	} else {
		$forward_list = '_no_';
		// Check if mail type was a forward type and remove it
		if (preg_match('/_forward/', $_mail_type) == 1) {
			$mail_type = preg_replace('/,[a-z]+_forward$/', '', $_mail_type);
		}
	}

	$status = Config::get('ITEM_CHANGE_STATUS');

	check_for_lock_file();

	$query = "UPDATE `mail_users` SET `mail_forward` = ?, `mail_type` = ?, `status` = ? WHERE `mail_id` = ?";

	$rs = exec_query($sql, $query, array($forward_list, $mail_type, $status, $mail_id));

	write_log($_SESSION['user_logged'] . ": change mail forward: $mail_account");
	return true;
}

// end page functions.

$theme_color = Config::get('USER_INITIAL_THEME');

$tpl->assign(
	array(
		'TR_CLIENT_EDIT_EMAIL_PAGE_TITLE'	=> tr('ispCP - Manage Mail and FTP / Edit mail account'),
		'THEME_COLOR_PATH'					=> "../themes/$theme_color",
		'THEME_CHARSET'						=> tr('encoding'),
		'ISP_LOGO'							=> get_logo($_SESSION['user_id'])
	)
);

// dynamic page data.

edit_mail_account($tpl, $sql);

if (update_email_pass($sql) && update_email_forward($tpl, $sql)) {
	set_page_message(tr("Mail were updated successfully!"));
	send_request();
	user_goto('mail_accounts.php');
}

// static page messages.

gen_client_mainmenu($tpl, Config::get('CLIENT_TEMPLATE_PATH') . '/main_menu_email_accounts.tpl');
gen_client_menu($tpl, Config::get('CLIENT_TEMPLATE_PATH') . '/menu_email_accounts.tpl');

gen_logged_from($tpl);

check_permissions($tpl);

$tpl->assign(
	array(
		'TR_EDIT_EMAIL_ACCOUNT'	=> tr('Edit email account'),
		'TR_SAVE'				=> tr('Save'),
		'TR_PASSWORD'			=> tr('Password'),
		'TR_PASSWORD_REPEAT'	=> tr('Repeat password'),
		'TR_FORWARD_MAIL'		=> tr('Forward mail'),
		'TR_FORWARD_TO'			=> tr('Forward to'),
		'TR_FWD_HELP'			=> tr("Separate multiple email addresses with a line-break."),
		'TR_EDIT'				=> tr('Edit')
	)
);

gen_page_message($tpl);
$tpl->parse('PAGE', 'page');
$tpl->prnt();

if (Config::get('DUMP_GUI_DEBUG')) {
	dump_gui_debug();
}
unset_messages();
