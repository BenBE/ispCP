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
 * ispCP Controller (the C from MVC)
 *
 * @copyright 	2006-2010 by ispCP | http://isp-control.net
 * @author 		Thomas Wacker <thomas.wacker@ispcp.net>
 */
class ispcp_Controller
{
    /**
     * @var ispcp_View
     */
	public $view;
	public $params = array();
    public $template = '';
	protected $requestType = 'get';
	protected $messages = array();
	protected $renderOutput = true;

	public function __construct()
	{
		$this->view = new ispcp_View;
	}

	public function render()
	{
		unset($_SESSION['user_page_message']);
		$this->view->assign('messages', ispcp_Front_Controller::getMessages());
		$this->view->render($this->template);
	}

	protected function forward($action, $controller = null, $module = null, array $params = null)
	{
		// TODO: forward
	}

	protected function redirectAction($action, $controller = null, $module = null, array $params = null)
	{
		// TODO: redirectAction
	}

	protected function redirect($url)
	{
		// TODO: redirect
	}
}
