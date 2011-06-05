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

function dump_gui_debug($tpl) {
	$gui_debug_data = '<div id="dump_gui_debug">';
	$gui_debug_data .= '<span style="color:#00f;text-decoration:underline;">Content of <strong>$_SESSION</strong>:<br /></span>';
	$gui_debug_data .= '<pre>';
	$gui_debug_data .= htmlentities(print_r($_SESSION, true));
	$gui_debug_data .= '</pre>';
	$gui_debug_data .= '<span style="color:#00f;text-decoration:underline;">Content of <strong>$_POST</strong>:<br /></span>';
	$gui_debug_data .= '<pre>';
	$gui_debug_data .= htmlentities(print_r($_POST, true));
	$gui_debug_data .= '</pre>';
	$gui_debug_data .= '<span style="color:#00f;text-decoration:underline;">Content of <strong>$_GET</strong>:<br /></span>';
	$gui_debug_data .= '<pre>';
	$gui_debug_data .= htmlentities(print_r($_GET, true));
	$gui_debug_data .= '</pre>';
	$gui_debug_data .= '<span style="color:#00f;text-decoration:underline;">Content of <strong>$_COOKIE</strong>:<br /></span>';
	$gui_debug_data .= '<pre>';
	$gui_debug_data .= htmlentities(print_r($_COOKIE, true));
	$gui_debug_data .= '</pre>';
	$gui_debug_data .= '<span style="color:#00f;text-decoration:underline;">Content of <strong>$_FILES</strong>:<br /></span>';
	$gui_debug_data .= '<pre>';
	$gui_debug_data .= htmlentities(print_r($_FILES, true));
	$gui_debug_data .= '</pre>';

	/* Activate debug code if needed
	$gui_debug_data .= '<span style="color:#00f;text-decoration:underline;">Content of <strong>$_SERVER</strong>:<br /></span>';
	$gui_debug_data .= '<pre>';
	$gui_debug_data .= htmlentities(print_r($_SERVER, true));
	$gui_debug_data .= '</pre>';
	*/

	$gui_debug_data .= '</div>';

	$tpl->assign('GUI_DEBUG', $gui_debug_data);
}
