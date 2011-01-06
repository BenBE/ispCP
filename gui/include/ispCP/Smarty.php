<?php
/**
 * ispCP ω (OMEGA) a Virtual Hosting Control System
 *
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
 */

/**
 * Class Smarty is the new ispCP template engine.
 *
 * @category	ispCP
 * @package		ispCP_Smarty
 * @copyright 	2006-2011 by ispCP | http://isp-control.net
 * @author 		ispCP Team
 */
class ispCP_Smarty {

	protected static $_instance = null;
	private $smarty;

	/**
	 * Constructor
	 */
	protected function __construct() {
		require('Smarty/Smarty.class.php');
		$this->smarty = new Smarty();
		$this->smarty->caching = false;

		$this->set_globals();
	}

	/**
	 * Get an ispCP_Smarty instance
	 *
	 * Returns an {@link ispCP_Smarty} instance, only creating it if it
	 * doesn't already exist.
	 *
	 * @return ispCP_Smarty An ispCP_Smarty instance
	 */
	public static function getInstance() {

		if(is_null(self::$_instance)) {
			self::$_instance = new self;
		}

		return self::$_instance;
	}

	/**
	 * Assign data to the template for parsing
	 *
	 * @param String $nsp_name
	 * @param String $nsp_data
	 */

	public function assign($nsp_name, $nsp_data = '') {
		if (gettype($nsp_name) == "array") {
			$this->smarty->assign($nsp_name);
		} else {
			$this->smarty->assign($nsp_name, $nsp_data);
		}
	}

	/**
	 * Parse data and displays the template $template
	 *
	 * @param String $template
	 */

	public function display($template) {
		// un-comment the following line to show the debug console
		// $this->smarty->debugging = true;
		$this->smarty->display($template);
	}

	/**
	 * Returns the smarty template dir
	 */

	public function get_template_dir() {
		return $this->smarty->template_dir;
	}

	/**
	 * Sets global variables for using in all templates
	 *
	 * @author Markus Szywon <markus.szywon@ispcp.net>
	 * @since r3711
	 */
	private function set_globals() {
		$cfg = ispCP_Registry::get('Config');
		if (isset($_SESSION['user_id']) && $_SESSION['user_id'] != '' ){
			$this->smarty->template_dir = '../themes/' . $cfg->USER_INITIAL_THEME . '/' . $_SESSION['user_type'] . '/';
			$this->smarty->compile_dir  = '../themes/' . $cfg->USER_INITIAL_THEME . '/templates_c/';
			$this->assign(
				array(
					'ISP_LOGO'			=> get_logo($_SESSION['user_id']),
					'THEME_CHARSET'		=> tr('encoding'),
					'THEME_COLOR_PATH'	=> "../themes/{$cfg->USER_INITIAL_THEME}",
					'THEME_SCRIPT_PATH'	=> '../themes/scripts'
				)
			);
		} else {
			$this->smarty->template_dir = $cfg->LOGIN_TEMPLATE_PATH;
			$this->smarty->compile_dir  = $this->smarty->template_dir . '/templates_c/';
			$this->assign(
				array(
					'THEME_CHARSET'		=> tr('encoding'),
					'THEME_COLOR_PATH'	=> $cfg->LOGIN_TEMPLATE_PATH,
					'THEME_SCRIPT_PATH'	=> $cfg->LOGIN_TEMPLATE_PATH . '../scripts'
				)
			);
		}
	}
}
?>