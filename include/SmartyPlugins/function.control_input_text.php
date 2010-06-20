<?php
/**
 * ispCP ω (OMEGA) a Virtual Hosting Control System
 *
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
 * The Original Code is "ispCP - ISP Control Panel".
 *
 * The Initial Developer of the Original Code is ispCP Team.
 * Portions created by Initial Developer are Copyright (C) 2006-2010 by
 * isp Control Panel. All Rights Reserved.
 */

/**
 * Smarty plugin function for a simple text control
 */
function smarty_function_control_input_text($params, $smarty, $template)
{
	$params['addition_html'] = '';
	$addition_attributes = array('style', 'size', 'maxlength', 'id');
	foreach ($params as $key => $val) {
		if (in_array($key, $addition_attributes)) {
			$params['addition_html'] .= ' '.$key.'="'.htmlentities($val, ENT_COMPAT, 'UTF-8').'"';
		}
	}

	$smarty_control = new ispcp_Smarty;
	$smarty_control->tpl_vars = $smarty->tpl_vars;
	$result = $smarty_control->fetch($smarty->root_template_path . 'controls/control_input_text.tpl');
	unset($smarty_control);

	return $result;
}
