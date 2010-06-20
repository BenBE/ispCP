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
 * ispCP View (the V from MVC)
 *
 * @copyright 	2006-2010 by ispCP | http://isp-control.net
 * @author 		Thomas Wacker <thomas.wacker@ispcp.net>
 */
class ispcp_View
{
	protected $engine;
	protected $_title;

	public function __construct()
	{
		$this->engine = new ispcp_Smarty;
	}

	public function assign($key, $value)
	{
		$this->assign($key, $value);
	}

    public function parse($key, $value)
    {
        $this->assign($key, $value);
    }

	public function render($template)
	{
		$this->engine->display($template);
	}

	public function setTitle($title)
	{
		$this->engine->assign('application_title', $this->_title);
	}
}
