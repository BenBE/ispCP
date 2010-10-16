<?php
/**
 * ispCP ω (OMEGA) a Virtual Hosting Control System
 *
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
 *
 * @category	ispCP
 * @package		Smarty
 * @copyright	2006-2010 by ispCP | http://isp-control.net
 * @author		Daniel Hofer <q@zpin.ch>
 * @version		SVN: $Id$
 * @link		http://isp-control.net ispCP Home Site
 * @license		http://www.mozilla.org/MPL/ MPL 1.1
 * @filesource
 */

require('libs/Smarty.class.php');

 
/**
 * Smarty wrapper for ispCP
 *
 * Uses prnt() to display templates and defaults to 'layout.tpl' as the main
 * template
 *
 * @category	ispCP
 * @package		Smarty
 * @author		Daniel Hofer <q@zpin.ch>
 * @copyright 	2006-2008 by ispCP | http://isp-control.net
 */
class ispCP_Smarty  extends Smarty {
	function __construct() 	{
		parent::__construct();
	}

	function prnt($template = false) {
		$this->display($template ? $template : 'layout.tpl');
	}
}

