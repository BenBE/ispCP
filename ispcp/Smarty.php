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

define('SMARTY_DIR', dirname(__FILE__).'/Smarty/');
require_once SMARTY_DIR.'Smarty.class.php';

/**
 * ispCP Smarty implementation
 *
 * @copyright 	2006-2010 by ispCP | http://isp-control.net
 * @author 		Thomas Wacker <thomas.wacker@ispcp.net>
 */
class ispcp_Smarty extends Smarty
{
	/**
	 * Content template file name
	 */
	private $_content_template = '';
	/**
	 * Root template path
	 */
	protected $root_template_path = '';

	/**
	 * constructor of smartyTemplate, initialize some important paths
	 * @param string $template_dir template base directory
	 */
	public function __construct($templateDir='')
	{
		parent::__construct();

		// Add ispCP specific plugins to plugin directory path
		$this->plugins_dir[] = dirname(__FILE__).'/SmartyPlugins';

		// Set compile_dir to writable path inside open_basedir.
		$docroot = Config::get('GUI_ROOT_DIR');

		$tempPath = $docroot.'/templates_c';
		if (!file_exists($tempPath)) {
			mkdir($tempPath);
			// TODO: deny from all
		}
		$this->compile_dir = $tempPath;

		// Set root path and application template path
		$this->root_template_path = $docroot
							  . '/' . Config::get('ROOT_TEMPLATE_PATH')
							  . 'smarty_test/';
		$this->template_dir = $this->root_template_path . $templateDir;
	}

	/**
	 * Set content template file name
	 * @param string $template_name content template file name relative to
	 * 								template base directory
	 */
	public function setTemplate($template_name)
	{
		$this->_content_template = $template_name;
	}

	/**
	 * Display smarty template
	 */
	public function prnt()
	{
		$this->assign('date_format', Config::get('DATE_FORMAT'));
		$this->assign('content_template', $this->_content_template);
		$this->display('main.tpl');
	}

	/**
	 * for compatibility...
	 */
	public function parse($pname, $tname)
	{
		$this->assign($pname, $tname);
	}

	/**
	 * quick hack for compatibility...
	 */
	public function define_dynamic($t_name, $t_value = '')
	{
		$this->assign($t_name, $t_value);
	}
}
