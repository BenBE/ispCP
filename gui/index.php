<?php
/**
 * ispCP ω (OMEGA) a Virtual Hosting Control System
 *
 * @copyright	2001-2006 by moleSoftware GmbH
 * @copyright	2006-2009 by ispCP | http://isp-control.net
 * @version		SVN: $Id: index.php 1744 2009-05-07 03:21:47Z haeber $
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

require 'include/ispcp-lib.php';

if (UserIO::GET_isset('logout')) {
	unset_user_login_data();
}

do_session_timeout();

init_login();

if (UserIO::GET_Domain('uname') != '' && UserIO::GET_String('upass') != '') {

	$uname = UserIO::POST_Domain('uname');
	$upass = UserIO::POST_String('upass', true, true);

	check_input($uname);
	check_input($upass);

	if (register_user($uname, $upass)) {
		redirect_to_level_page();
	}

	user_goto('index.php');
}

if (check_user_login() && !redirect_to_level_page()) {
	unset_user_login_data();
}

shall_user_wait();

$theme_color = isset($_SESSION['user_theme'])
	? $_SESSION['user_theme']
	: Config::get('USER_INITIAL_THEME');

$tpl = new pTemplate();

if ((Config::get('MAINTENANCEMODE')
		|| databaseUpdate::getInstance()->checkUpdateExists()
		|| criticalUpdate::getInstance()->checkUpdateExists())
	&& !UserIO::GET_isset('admin')) {

	$tpl->define_dynamic('page', Config::get('LOGIN_TEMPLATE_PATH') . '/maintenancemode.tpl');
	$tpl->assign(
		array(
			'TR_PAGE_TITLE'		=> tr('ispCP Omega a Virtual Hosting Control System'),
			'THEME_COLOR_PATH'	=> Config::get('LOGIN_TEMPLATE_PATH'),
			'THEME_CHARSET'		=> tr('encoding'),
			'TR_MESSAGE'		=> nl2br(Config::get('MAINTENANCEMODE_MESSAGE')),
			'TR_ADMINLOGIN'		=> tr('Administrator login')
		)
	);

} else {

	$tpl->define_dynamic('page', Config::get('LOGIN_TEMPLATE_PATH') . '/index.tpl');

	$tpl->assign(
		array(
			'TR_MAIN_INDEX_PAGE_TITLE'	=> tr('ispCP Omega a Virtual Hosting Control System'),
			'THEME_COLOR_PATH'			=> Config::get('LOGIN_TEMPLATE_PATH'),
			'THEME_CHARSET'				=> tr('encoding'),
			'TR_LOGIN'					=> tr('Login'),
			'TR_USERNAME'				=> tr('Username'),
			'TR_PASSWORD'				=> tr('Password'),
			'TR_LOGIN_INFO'				=> tr('Please enter your login information'),
			// @todo: make this configurable by ispcp-lib
			'TR_SSL_LINK'				=> isset($_SERVER['HTTPS']) ? 'http://' . htmlentities($_SERVER['HTTP_HOST']) : 'https://' . htmlentities($_SERVER['HTTP_HOST']),
			'TR_SSL_IMAGE'				=> isset($_SERVER['HTTPS']) ? 'lock.png' : 'unlock.png',
			'TR_SSL_DESCRIPTION'		=> !isset($_SERVER['HTTPS']) ? tr('Secure Connection') : tr('Normal Connection')
		)
	);

}

if (Config::get('LOSTPASSWORD')) {
	$tpl->assign('TR_LOSTPW', tr('Lost password'));
} else {
	$tpl->assign('TR_LOSTPW', '');
}

$tpl->define_dynamic('page_message', 'page');
gen_page_message($tpl);

$tpl->parse('PAGE', 'page');
$tpl->prnt();

if (Config::get('DUMP_GUI_DEBUG')) {
	dump_gui_debug();
}
