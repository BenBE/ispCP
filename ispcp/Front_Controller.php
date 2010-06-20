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
 * ispCP Front Controller
 *
 * @copyright 	2006-2010 by ispCP | http://isp-control.net
 * @author 		Thomas Wacker <thomas.wacker@ispcp.net>
 */
class ispcp_Front_Controller
{
	public $params = array();
	protected $_requestType = 'get';
	protected static $_messages = array();
	protected $_controllerDirectory = '';

	private static $instance = null;

	private function __construct() {}
	private function __clone() {}

	public static function getInstance()
	{
       if (self::$instance === null) {
           self::$instance = new self;
       }
       return self::$instance;
   	}

	/**
	 * Set display message
	 * @param string $text
	 * @param integer $type (0 = info, 1 = success, 2 = warning, 3 = error)
	 */
	public static function message($text, $type=0)
	{
		if (isset($_SESSION['user_page_message'])) {
			$_SESSION['user_page_message'] .= '<br />'.$text."\n";
		} else {
			$_SESSION['user_page_message'] = $text;
		}

		if (!isset(self::$_messages[$type])) self::$_messages[$type] = array();
		self::$_messages[$type][] = $text;
	}

	/**
	 * Get all display messages 
	 * @static
	 * @return array
	 */
	public static function getMessages()
	{
		return self::$_messages;
	}

	/**
	 * @param string $controller
	 * @param string $action
	 * @return bool
	 */
	public function dispatch($controller, $action)
    {
		$result = false;

		$classname = $controller.'Controller';
		if (class_exists($classname)) {
			$obj = new $classname;

			if (method_exists($obj, $action)) {
				$result = $obj->$action();
			}
		}

		return $result;
	}

	/**
	 * Get the request parameters
	 * Store GET and POST parameters in $params
	 */
	protected function getRequest()
	{
		if (isset($_GET) && is_array($_GET)) {
			foreach ($_GET as $key => $val) {
				$this->params[$key] = $val;
			}
		}

		if (isset($_POST) && is_array($_POST) && count($_POST) > 0) {
			$this->_requestType = 'post';
			foreach ($_POST as $key => $val) {
				if (!isset($this->params[$key])) {
					$this->params[$key] = $val;
				}
			}
		}
	}

	/**
	 * Get requested action name
	 * @return string
	 */
	protected function getActionName()
	{
		$result = 'indexAction';

		if (isset($this->params['action'])) {
			$result = $this->params['action'].'Action';
		}

		return $result;
	}

	/**
	 * Get requested controller name
	 * @return string
	 */
	protected function getControllerName()
	{
		$result = '';

		if (isset($this->params['controller'])) {
			$result = $this->params['controller'];
		}

		return $result;
	}

	protected function _dumpGuiDebug()
	{
		echo '<span style="color:#00f;text-decoration:underline;">Content of <strong>$_SESSION</strong>:<br /></span>';
		echo '<pre>';
		echo htmlentities(print_r($_SESSION, true));
		echo '</pre>';
		echo '<span style="color:#00f;text-decoration:underline;">Content of <strong>$_POST</strong>:<br /></span>';
		echo '<pre>';
		echo htmlentities(print_r($_POST, true));
		echo '</pre>';
		echo '<span style="color:#00f;text-decoration:underline;">Content of <strong>$_GET</strong>:<br /></span>';
		echo '<pre>';
		echo htmlentities(print_r($_GET, true));
		echo '</pre>';
		echo '<span style="color:#00f;text-decoration:underline;">Content of <strong>$_COOKIE</strong>:<br /></span>';
		echo '<pre>';
		echo htmlentities(print_r($_COOKIE, true));
		echo '</pre>';
		echo '<span style="color:#00f;text-decoration:underline;">Content of <strong>$_FILES</strong>:<br /></span>';
		echo '<pre>';
		echo htmlentities(print_r($_FILES, true));
		echo '</pre>';
	}

	public function redirectToLevelPage($file = null, $force = false)
	{
		if (!isset($_SESSION['user_type']) && !$force)
			return false;

		if (!$file) {
			$file = 'index.php';
		}

		$user_type = isset($_SESSION['user_type']) ? $_SESSION['user_type'] : '';

		switch ($user_type) {
			case 'user':
				$user_type = 'client';
			case 'admin':
			case 'reseller':
				header('Location: /' . $user_type . '/' . $file);
				break;
			default:
				header('Location: /index.php');
		}
		exit();
	}

	/**
	 * Checks if an session already exists and the IP address is matching
	 *
	 * @param  String	$sess_id	user session id from cookie
	 * @return Boolean				true, if session is valid
	 */
	public function sessionExists($sess_id)
	{
		$db = Db_Table_log::getInstance();

		$recs = $db->selectRecords(
			'session_id, ipaddr',
			array(
				'session_id'	=> $sess_id,
				'ipaddr'		=> ispcp_Common::getRemoteIP()
			)
		);

		return (count($recs) == 1);
	}

	public function doSessionTimeout()
	{
		$ttl = time() - Config::get('SESSION_TIMEOUT') * 60;

		$db = Db_Table_login::getInstance();
		$db->deleteRecords(
			array(
				array('lastaccess', '<'.$ttl, 'raw')
			)
		);

		if (!$this->sessionExists(session_id())) {
			unset($_SESSION['user_logged']);
			$this->unsetUserLoginData();
		}
	}

	public function checkUserLogin()
	{
		$sess_id = session_id();
		// kill timed out sessions
		$this->doSessionTimeout();
		$user_logged = isset($_SESSION['user_logged']) ? $_SESSION['user_logged'] : false;

		if (!$user_logged) {
			return false;
		}

		$user_pass = $_SESSION['user_pass'];
		$user_type = $_SESSION['user_type'];
		$user_id = $_SESSION['user_id'];

		// verify session data with database
		$db = Db_Table_admin::getInstance();
		$recs = $db->selectRecords(
			'*',
			array(
				'where'	=> array(
					'admin.admin_name'	=> $user_logged,
					'admin.admin_pass'	=> $user_pass,
					'admin.admin_type'	=> $user_type,
					'admin.admin_id'	=> $user_id,
					'login.session_id'	=> $sess_id
				),
				'addfrom'	=> 'login'
			)
		);

		if (count($recs) != 1) {
			ispcp_Log::logMessage(
				"Detected session manipulation on ".$user_logged."'s session!",
				ispcp_Log::LOG_WARNING
			);
			$this->unsetUserLoginData();
			return false;
		}

		if ((databaseUpdate::checkUpdateExists() || (Config::get('MAINTENANCEMODE'))) && $user_type != 'admin') {
			$this->unsetUserLoginData(true);
			ispcp_Log::logMessage(
				"System is currently in maintenance mode. Logging out ".$user_logged,
				ispcp_Log::LOG_WARNING
			);
			user_goto('/index.php');
		}
		
		// if user login data correct - update session and lastaccess
		$_SESSION['user_login_time'] = time();

		$db = Db_Table_login::getInstance();
		$db->update(
			array(
				'lastaccess'	=> time()
			),
			array(
				'session_id'	=> $sess_id
			)
		);

		return true;
	}

	public function unsetUserLoginData($ignorePreserve = false)
	{
		if (isset($_SESSION['user_logged'])) {

			$sess_id = session_id();

			$admin_name = $_SESSION['user_logged'];
			$db = Db_Table_login::getInstance();

			$db->deleteRecords(
				array(
					'session_id'	=> $sess_id,
					'user_name'		=> $admin_name
				)
			);
		}

		$preserve_list = array('user_def_lang', 'user_theme');
		$preserve_vals = array();

		if (!$ignorePreserve) {
			foreach ($preserve_list as $p) {
				if (isset($_SESSION[$p])) {
					$preserve_vals[$p] = $_SESSION[$p];
				}
			}
		}

		$_SESSION = array();

		foreach ($preserve_list as $p) {
			if (isset($preserve_vals[$p])) {
				$_SESSION[$p] = $preserve_vals[$p];
			}
		}

	}

	/**
	 * check for valid user login and valid file request/call
	 *
	 * @param string $fName full path and filename of the file ie. with magic constant __FILE__
	 * @param boolean $preventExternalLogin check HTTP Referer for valid request/call, ie. to prevent login from external websites
	 */
	public function checkLogin($fName = null, $preventExternalLogin = true)
	{
		// session-type check:
		if (!$this->checkUserLogin()) {

			if (ispcp_Common::isXhr()) {
				header('HTTP/1.0 403 Forbidden');
				exit();
			}

			user_goto('/index.php');
		}

		if ($fName != null) {
			$levels = explode('/', realpath(dirname($fName)));
			$level = $levels[count($levels) - 1];

			switch ($level) {
				case 'user':
					$level = 'client';
					break;
				case 'admin':
				case 'reseller':
					if ($level != $_SESSION['user_type']) {
						ispcp_Log::logMessage(
							'Warning! user |'.$_SESSION['user_logged'].'| requested |'.$_SERVER["REQUEST_URI"]
							.'| with REQUEST_METHOD |'.$_SERVER["REQUEST_METHOD"].'|'
						);
						user_goto('/index.php');
					}
					break;
			}
		}

		// prevent external login / check for referer
		if ($preventExternalLogin) {
			if (isset($_SERVER['HTTP_REFERER']) && !empty($_SERVER['HTTP_REFERER'])) {

				$info = parse_url($_SERVER['HTTP_REFERER']);
				if (isset($info['host']) && !empty($info['host'])) {
					// Check if $_SERVER['HTTP_REFERER'] equals $_SERVER['HTTP_HOST']
					// w/ port number stipped
					$http_host = $_SERVER['HTTP_HOST'];
					if ($info['host'] != substr($http_host, 0, (int) (strlen($http_host) - strlen(strrchr($http_host, ':'))))
						|| $info['host'] != $_SERVER['SERVER_NAME']
					) {
						ispcp_Front_Controller::message(tr('Request from foreign host was blocked!'));
						if (!(substr(
								$_SERVER['SCRIPT_FILENAME'],
								(int)-strlen($_SERVER['REDIRECT_URL']),
								strlen($_SERVER['REDIRECT_URL'])
							) === $_SERVER['REDIRECT_URL'])
						) {
							$this->redirectToLevelPage();
						}
					}
				}
			}
		}
	}

	public function run()
	{
		$this->getRequest();
		$controller = $this->getControllerName();
		$action = $this->getActionName();
		$result = $this->dispatch($controller, $action);

		if (Config::get('DUMP_GUI_DEBUG')) {
			$this->_dumpGuiDebug();
		}

		return $result;
	}
}
