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

/**
 * @todo possible session injection, check $_SESSION['user_theme'] for valid
 *	value
 */
function system_message($msg, $backButtonDestination = '') {

	$cfg = ispCP_Registry::get('Config');

	if (empty($backButtonDestination)) {
		$backButtonDestination = "javascript:history.go(-1)";
	}

	$tpl = ispCP_Registry::get('template');

	// Small workaround to be able to use the system_message() function during
	// IspCP initialization process without i18n support
	if (function_exists('tr')) {
		$tpl->assign(
			array(
				'TR_SYSTEM_MESSAGE_PAGE_TITLE' => tr('ispCP Error'),
				'TR_BACK' => tr('Back'),
				'TR_ERROR_MESSAGE' => tr('Error Message'),
				'MESSAGE' => $msg,
				'BACKBUTTONDESTINATION' => $backButtonDestination
			)
		);
	} else {
		$tpl->assign(
			array(
				'TR_SYSTEM_MESSAGE_PAGE_TITLE' => 'ispCP Error',
				'TR_BACK' => 'Back',
				'TR_ERROR_MESSAGE' => 'Error Message',
				'MESSAGE' => $msg,
				'BACKBUTTONDESTINATION' => $backButtonDestination
			)
		);
	}

	$tpl->prnt('system-message.tpl');

	exit;
}
