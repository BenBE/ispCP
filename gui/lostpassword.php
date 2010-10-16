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

require 'include/ispcp-lib.php';

$cfg = ispCP_Registry::get('Config');

if (!$cfg->LOSTPASSWORD) {
	throw new ispCP_Exception_Production(
		tr('Retrieving lost passwords is currently not possible')
	);
}

// check for gd >= 2.x
if (!check_gd()) {
	throw new ispCP_Exception("ERROR: php-extension 'gd' not loaded!");
}

if (!captcha_fontfile_exists()) {
	throw new ispCP_Exception("ERROR: captcha fontfile not found!");
}

// remove old uniqkeys
removeOldKeys($cfg->LOSTPASSWORD_TIMEOUT);

$tpl = ispCP_Registry::get('template');
$tpl->assign('PAGE_TITLE', tr('ispCP - Virtual Hosting Control System'));

if (isset($_GET['key'])) {
	if ($_GET['key'] != "") {
		check_input($_GET['key']);

		if (sendpassword($_GET['key'])) {
			$tpl->assign(
				array(
					'TR_MESSAGE' => tr('Your new password has been sent.'),
					'TR_LINK' => '<a class="link" href="index.php">' . tr('Login') . '</a>'
				)
			);
		} else {
			$tpl->assign(
				array(
					'TR_MESSAGE' => tr('New password could not been sent.'),
					'TR_LINK' => '<a class="link" href="index.php">' . tr('Login') . '</a>'
				)
			);
		}

		$tpl->prnt('lostpassword_message.tpl');

		if ($cfg->DUMP_GUI_DEBUG) {
			dump_gui_debug();
		}
		die();
	}
}

if (isset($_POST['uname'])) {
	check_ipaddr(getipaddr(), 'captcha');

	if (($_POST['uname'] != "") && isset($_SESSION['image']) && isset($_POST['capcode'])) {
		check_input(trim($_POST['uname']));
		check_input($_POST['capcode']);

		if ($_SESSION['image'] == $_POST['capcode'] && requestpassword($_POST['uname'])) {
			$tpl->assign(
				array(
					'TR_MESSAGE' => tr('Your password request has been initiated. You will receive an email with instructions to complete the process. This reset request will expire in %s minutes.', $cfg->LOSTPASSWORD_TIMEOUT),
					'TR_LINK' => '<a class="link" href="index.php">' . tr('Back') . '</a>'
				)
			);
		} else {
			$tpl->assign(
				array(
					'TR_MESSAGE' => tr('User or security code was incorrect!'),
					'TR_LINK' => '<a class="link" href="lostpassword.php">' . tr('Retry') . '</a>'
				)
			);
		}

		$tpl->prnt('lostpassword_message.tpl');

		if ($cfg->DUMP_GUI_DEBUG) {
			dump_gui_debug();
		}
		die();
	}
}

unblock($cfg->BRUTEFORCE_BLOCK_TIME, 'captcha');
is_ipaddr_blocked(null, 'captcha', true);

$tpl->assign(
	array(
		'TR_CAPCODE' => tr('Security code'),
		'TR_IMGCAPCODE_DESCRIPTION' => tr('(To avoid abuse, we ask you to write the combination of letters on the above picture into the field "Security code")'),
		'TR_IMGCAPCODE' => '<img src="imagecode.php" width="' . $cfg->LOSTPASSWORD_CAPTCHA_WIDTH . '" height="' . $cfg->LOSTPASSWORD_CAPTCHA_HEIGHT . '" border="0" alt="captcha image">',
		'TR_USERNAME' => tr('Username'),
		'TR_SEND' => tr('Request password'),
		'TR_BACK' => tr('Back')
	)
);

$tpl->prnt('lostpassword.tpl');

if ($cfg->DUMP_GUI_DEBUG) {
	dump_gui_debug();
}
