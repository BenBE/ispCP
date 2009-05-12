<?php
/**
 * ispCP ω (OMEGA) a Virtual Hosting Control System
 *
 * @copyright	2001-2006 by moleSoftware GmbH
 * @copyright	2006-2009 by ispCP | http://isp-control.net
 * @version		SVN: $Id: admin_add.php 1744 2009-05-07 03:21:47Z haeber $
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
$tpl->define_dynamic('page', Config::get('ADMIN_TEMPLATE_PATH') . '/admin_add.tpl');
$tpl->define_dynamic('page_message', 'page');

$theme_color = Config::get('USER_INITIAL_THEME');

$tpl->assign(
	array(
		'TR_ADMIN_ADD_USER_PAGE_TITLE' => tr('ispCP - Admin/Manage users/Add User'),
		'THEME_COLOR_PATH' => "../themes/$theme_color",
		'THEME_CHARSET' => tr('encoding'),
		'ISP_LOGO' => get_logo($_SESSION['user_id'])
	)
);

function add_user(&$tpl, &$sql) {
	if (UserIO::POST_String('uaction') == 'add_user') {
		if (check_user_data()) {
			$upass = crypt_user_pass(UserIO::POST_String('pass'));

			$user_id = $_SESSION['user_id'];

			$username = UserIO::POST_String('username'); 
			$fname = UserIO::POST_String('fname');
			$lname = UserIO::POST_String('lname');
			$gender = UserIO::POST_String('gender');
			$firm = UserIO::POST_String('firm');
			$zip = UserIO::POST_String('zip');
			$city = UserIO::POST_String('city');
			$state = UserIO::POST_String('state');
			$country = UserIO::POST_String('country');
			$email = UserIO::POST_String('email');
			$phone = UserIO::POST_String('phone');
			$fax = UserIO::POST_String('fax');
			$street1 = UserIO::POST_String('street1');
			$street2 = UserIO::POST_String('street2');

			if (get_gender_by_code($gender, true) === null) {
				$gender = '';
			}

			$query = "
				INSERT INTO `admin`
					(
						`admin_name`,
						`admin_pass`,
						`admin_type`,
						`domain_created`,
						`created_by`,
						`fname`,
						`lname`,
						`firm`,
						`zip`,
						`city`,
						`state`,
						`country`,
						`email`,
						`phone`,
						`fax`,
						`street1`,
						`street2`,
						`gender`
					) VALUES (
						?,
						?,
						'admin',
						unix_timestamp(),
						?,
						?,
						?,
						?,
						?,
						?,
						?,
						?,
						?,
						?,
						?,
						?,
						?,
						?
					)
			";

			$rs = exec_query($sql, $query, array($username,
					$upass,
					$user_id,
					$fname,
					$lname,
					$firm,
					$zip,
					$city,
					$state,
					$country,
					$email,
					$phone,
					$fax,
					$street1,
					$street2,
					$gender));

			$new_admin_id = $sql->Insert_ID();

			$user_logged = $_SESSION['user_logged'];

			write_log("$user_logged: add admin: $username");

			$user_def_lang = $_SESSION['user_def_lang'];
			$user_theme_color = $_SESSION['user_theme'];
			$user_logo = 0;

			$query = "
				INSERT INTO `user_gui_props` (
					`user_id`,
					`lang`,
					`layout`,
					`logo`
				) VALUES (?,?,?,?)
			";

			$rs = exec_query($sql, $query, array($new_admin_id,
					$user_def_lang,
					$user_theme_color,
					$user_logo));

			send_add_user_auto_msg($user_id,
				UserIO::POST_String('username'),
				UserIO::POST_String('pass'),
				UserIO::POST_String('email'),
				UserIO::POST_String('fname'),
				UserIO::POST_String('lname'),
				tr('Administrator'),
				$gender
				);

			$_SESSION['user_added'] = 1;

			user_goto('manage_users.php');
		} else { // check user data
			$tpl->assign(
				array(
					'EMAIL' => UserIO::HTML(UserIO::POST_String('email')),
					'USERNAME' => UserIO::HTML(UserIO::POST_String('username')),
					'FIRST_NAME' => UserIO::HTML(UserIO::POST_String('fname')),
					'LAST_NAME' => UserIO::HTML(UserIO::POST_String('lname')),
					'FIRM' => UserIO::HTML(UserIO::POST_String('firm')),
					'ZIP' => UserIO::HTML(UserIO::POST_String('zip')),
					'CITY' => UserIO::HTML(UserIO::POST_String('city')),
					'STATE' => UserIO::HTML(UserIO::POST_String('state'),
					'COUNTRY' => UserIO::HTML(UserIO::POST_String('country')),
					'STREET_1' => UserIO::HTML(UserIO::POST_String('street1')),
					'STREET_2' => UserIO::HTML(UserIO::POST_String('street2')),
					'PHONE' => UserIO::HTML(UserIO::POST_String('phone')),
					'FAX' => UserIO::HTML(UserIO::POST_String('fax')),
					'VL_MALE' => ((UserIO::POST_String('gender') == 'M') ? 'selected="selected"' : ''),
					'VL_FEMALE' => ((UserIO::POST_String('gender') == 'F') ? 'selected="selected"' : ''),
					'VL_UNKNOWN' => (((UserIO::POST_String('gender') == 'U') 
						|| UserIO::POST_String('gender') == '')) ? 'selected="selected"' : '')
				)
			);
		}
	} else {
		$tpl->assign(
			array(
				'EMAIL' => '',
				'USERNAME' => '',
				'FIRST_NAME' => '',
				'LAST_NAME' => '',
				'FIRM' => '',
				'ZIP' => '',
				'CITY' => '',
				'STATE' => '',
				'COUNTRY' => '',
				'STREET_1' => '',
				'STREET_2' => '',
				'PHONE' => '',
				'FAX' => '',
				'VL_MALE' => '',
				'VL_FEMALE' => '',
				'VL_UNKNOWN' => 'selected="selected"'
			)
		);
	} // end else
}

function check_user_data() {
	$sql = Database::getInstance();

	if (!chk_username(UserIO::POST_String('username'))) {
		set_page_message(tr("Incorrect username length or syntax!"));

		return false;
	}
	if (!chk_password(UserIO::POST_String('pass'))) {
		if (Config::get('PASSWD_STRONG')) {
			set_page_message(sprintf(tr('The password must be at least %s long and contain letters and numbers to be valid.'), Config::get('PASSWD_CHARS')));
		} else {
			set_page_message(sprintf(tr('Password data is shorter than %s signs or includes not permitted signs!'), Config::get('PASSWD_CHARS')));
		}

		return false;
	}
	if (UserIO::POST_String('pass') != UserIO::POST_String('pass_rep')) {
		set_page_message(tr("Entered passwords do not match!"));

		return false;
	}
	if (!chk_email(UserIO::POST_String('email'))) {
		set_page_message(tr("Incorrect email length or syntax!"));

		return false;
	}

	$query = "
		SELECT
			`admin_id`
		FROM
			`admin`
		WHERE
			`admin_name` = ?
";

	$username = UserIO::POST_String('username');

	$rs = exec_query($sql, $query, array($username));

	if ($rs->RecordCount() != 0) {
		set_page_message(tr('This user name already exist!'));

		return false;
	}

	return true;
}

/*
 *
 * static page messages.
 *
 */

gen_admin_mainmenu($tpl, Config::get('ADMIN_TEMPLATE_PATH') . '/main_menu_users_manage.tpl');
gen_admin_menu($tpl, Config::get('ADMIN_TEMPLATE_PATH') . '/menu_users_manage.tpl');

add_user($tpl, $sql);

$tpl->assign(
	array(
		'TR_EMPTY_OR_WORNG_DATA' => tr('Empty data or wrong field!'),
		'TR_PASSWORD_NOT_MATCH' => tr("Passwords don't match!"),
		'TR_ADD_ADMIN' => tr('Add admin'),
		'TR_CORE_DATA' => tr('Core data'),
		'TR_USERNAME' => tr('Username'),
		'TR_PASSWORD' => tr('Password'),
		'TR_PASSWORD_REPEAT' => tr('Repeat password'),
		'TR_EMAIL' => tr('Email'),
		'TR_ADDITIONAL_DATA' => tr('Additional data'),
		'TR_FIRST_NAME' => tr('First name'),
		'TR_LAST_NAME' => tr('Last name'),
		'TR_GENDER' => tr('Gender'),
		'TR_MALE' => tr('Male'),
		'TR_FEMALE' => tr('Female'),
		'TR_UNKNOWN' => tr('Unknown'),
		'TR_COMPANY' => tr('Company'),
		'TR_ZIP_POSTAL_CODE' => tr('Zip/Postal code'),
		'TR_CITY' => tr('City'),
		'TR_STATE' => tr('State/Province'),
		'TR_COUNTRY' => tr('Country'),
		'TR_STREET_1' => tr('Street 1'),
		'TR_STREET_2' => tr('Street 2'),
		'TR_PHONE' => tr('Phone'),
		'TR_FAX' => tr('Fax'),
		'TR_PHONE' => tr('Phone'),
		'TR_ADD' => tr('Add'),
		'GENPAS' => passgen()
	)
);

gen_page_message($tpl);

$tpl->parse('PAGE', 'page');
$tpl->prnt();

if (Config::get('DUMP_GUI_DEBUG')) {
	dump_gui_debug();
}
unset_messages();
