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

require 'include/ispcp-lib.php';

$cfg = ispCP_Registry::get('Config');

if (!$cfg->LOSTPASSWORD) {
	throw new ispCP_Exception_Production(
		tr('Retrieving lost passwords is currently not possible')
	);
}

// check if GD library is available
if (!check_gd()) {
	throw new ispCP_Exception(tr("ERROR: php-extension 'gd' not loaded!"));
}

// check if captch fonts exist
if (!captcha_fontfile_exists()) {
	throw new ispCP_Exception(tr("ERROR: captcha fontfile not found!"));
}

// remove old unique keys
removeOldKeys($cfg->LOSTPASSWORD_TIMEOUT);

if (isset($_SESSION['user_theme'])) {
	$theme_color = $_SESSION['user_theme'];
} else {
	$theme_color = $cfg->USER_INITIAL_THEME;
}

$tpl = ispCP_TemplateEngine::getInstance();
$tpl->assign(
	array(
		'TR_PAGE_TITLE'		=> tr('ispCP - Virtual Hosting Control System'),
		'TR_WEBMAIL_SSL_LINK'	=> 'webmail',
		'TR_FTP_SSL_LINK'	=> 'ftp',
		'TR_PMA_SSL_LINK'	=> 'pma'
	)
);

// Key request has been triggered
if (isset($_GET['key']) && !empty($_GET['key'])) {
	check_input($_GET['key']);

	$template = 'lostpassword_message.tpl';

	if (sendpassword($_GET['key'])) {
		$tpl->assign(
			array(
				'TR_MESSAGE' => tr('Your new password has been sent.'),
				'TR_LINK' => '<a href="index.php" class="button">' . tr('Login') . '</a>'
			)
		);
	} else {
		$tpl->assign(
			array(
				'TR_MESSAGE' => tr('New password could not be sent.'),
				'TR_LINK' => '<a href="index.php" class="button">' . tr('Login') . '</a>'
			)
		);
	}

} elseif (isset($_POST['uname'])) {
	check_ipaddr(getipaddr(), 'captcha');

	$template = 'lostpassword_message.tpl';

	if ((!empty($_POST['uname'])) && isset($_SESSION['image']) &&
			isset($_POST['capcode'])) {
		check_input(trim($_POST['uname']));
		check_input($_POST['capcode']);

		if ($_SESSION['image'] == $_POST['capcode'] && requestpassword($_POST['uname'])) {
			$tpl->assign(
				array(
					'TR_MESSAGE' => tr('Your password request has been initiated. You will receive an email with instructions to complete the process. This reset request will expire in %s minutes.', $cfg->LOSTPASSWORD_TIMEOUT),
					'TR_LINK' => '<a href="index.php" class="button">' . tr('Back') . '</a>'
				)
			);
		} else {
			$tpl->assign(
				array(
					'TR_MESSAGE' => tr('User or security code was incorrect!'),
					'TR_LINK' => '<a href="lostpassword.php" class="button">' . tr('Retry') . '</a>'
				)
			);
		}
	} else {
		$tpl->assign(
			array(
				'TR_MESSAGE' => tr('Please fill out all required fields!'),
				'TR_LINK' => '<a href="lostpassword.php" class="button">' . tr('Retry') . '</a>'
			)
		);
	}
} else {

	unblock($cfg->BRUTEFORCE_BLOCK_TIME, 'captcha');
	is_ipaddr_blocked(null, 'captcha', true);

	$template = 'lostpassword.tpl';
	$tpl->assign(
		array(
			'TR_CAPCODE' => tr('Security code'),
			'TR_IMGCAPCODE_DESCRIPTION' => tr('(To avoid abuse, we ask you to write the combination of letters on the above picture into the field "Security code")'),
			'TR_IMGCAPCODE' => '<img src="imagecode.php" style="border: none;height: '. $cfg->LOSTPASSWORD_CAPTCHA_HEIGHT .'px;width: '. $cfg->LOSTPASSWORD_CAPTCHA_WIDTH .'px;" alt="captcha image" />',
			'TR_USERNAME' => tr('Username'),
			'TR_SEND' => tr('Request password'),
			'TR_BACK' => tr('Back')
		)
	);

}

$tpl->display($template);

if ($cfg->DUMP_GUI_DEBUG) {
	dump_gui_debug();
}
?>