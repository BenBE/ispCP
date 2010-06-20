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
 * ispCP Client FTP Controller
 * Status: Functions from ftp_add.php implemented
 *
 * @copyright 	2006-2010 by ispCP | http://isp-control.net
 * @author 		Thomas Wacker <thomas.wacker@ispcp.net>
 */
class client_FtpController extends ispcp_Controller
{
	/**
	 * Instance of Database
	 * @var Database
	 */
	protected $db;
	/**
	 * Instance of ispcp_Ftp
	 * @var ispcp_Ftp
	 */
	protected $ftp;
	/**
	 * Instance of ispcp_Domain
	 * @var ispcp_Domain
	 */
	protected $domain;

	public function __construct()
	{
		parent::__construct();
		$this->db = Database::getInstance();
		$this->ftp = ispcp_Ftp::getInstance();
		$this->domain = ispcp_Domain::getInstance();
	}

	public function indexAction()
	{
		$domain = $this->domain->getDomainDefaultProps($_SESSION['user_id']);
		$this->gen_page_ftp_list($domain['domain_id'], $domain['domain_name']);
	}

	public function addAction()
	{
		$domain = $this->domain->getDomainDefaultProps($_SESSION['user_id']);

		$ftpcount = $this->domain->getDomainRunningFtpAccCnt($domain['dmn_id']);

		if ($domain['domain_ftpacc_limit'] != 0 && $ftpcount['total'] >= $domain['domain_ftpacc_limit']) {
			ispcp_Front_Controller::message(tr('FTP accounts limit reached!'));
			//user_goto('ftp_accounts.php');
			$this->redirectAction('index');
		} else {
			if (!isset($_POST['uaction'])) {
				$this->gen_page_form_data($this->view, $domain['domain_name'], 'no');
				$this->gen_dmn_als_list($this->view, $domain['domain_id'], 'no');
				$this->gen_dmn_sub_list($this->view, $domain['domain_id'], $domain['domain_name'], 'no');
				$this->gen_page_js();
			} else if (isset($_POST['uaction']) && $_POST['uaction'] === 'add_user') {
				$this->gen_page_form_data($domain['domain_name'], 'yes');
				$this->gen_dmn_als_list($domain['domain_id'], 'yes');
				$this->gen_dmn_sub_list($domain['domain_id'], $domain['domain_name'], 'yes');
				$this->check_ftp_acc_data($domain['domain_id'], $domain['domain_name']);
			}
		}
	}

	public function chooseDirAction()
	{
		$this->view->setTitle(tr('ispCP - Client/Webtools'));
		$this->gen_directories();
	}

	public function deleteAction()
	{
		if (isset($_GET['id']) && $_GET['id'] !== '') {
			if ($this->ftp->deleteFtpUser($_GET['id'])) {
				ispcp_Front_Controller::message(tr('FTP account deleted successfully!'));
			}
			$this->redirectAction('index');

		} else {
			$this->redirectAction('index');
		}
	}

	public function editAction()
	{
		// TODO: editAction (from ftp_edit.php)
	}

	public function gen_directories()
	{
		// Initialize variables
		$path = isset($_GET['cur_dir']) ? $_GET['cur_dir'] : '';
		$domain = $_SESSION['user_logged'];

		// Create the virtual file system and open it so it can be used
		$vfs = new vfs($domain);
		// Get the directory listing
		$list = $vfs->ls($path);
		if (!$list) {
			ispcp_Front_Controller::message(tr('Cannot open directory! Please contact your administrator!'));
			return;
		}

		// Show parent directory link
		$parent = explode('/', $path);
		array_pop($parent);
		$parent = implode('/', $parent);

		$a = array();

		// Show directories only
		foreach ($list as $entry) {
			// Skip non-directory entries
			if ($entry['type'] != vfs::VFS_TYPE_DIR) {
				continue;
			}

			// Skip '.' and '..'
			if ($entry['file'] == '.' || $entry['file'] == '..') {
				continue;
			}

			$dr = $path . '/' . $entry['file'];

			// Check for .htaccess existence to display another icon
			$tfile = $dr . '/.htaccess';
			if ($vfs->exists($tfile)) {
				$image = "locked";
			} else {
				$image = "folder";
			}

			// Create the directory link
			$a[] = array(
				'ACTION'		=> tr('Protect it'),
				'ICON'			=> $image,
				'DIR_NAME'		=> $entry['file'],
				'CHOOSE_IT'		=> $dr
			);
		}

		$this->view->assign('DIR_ITEMS', $a);
	}

	public function gen_page_ftp_list($dmn_id, $dmn_name)
	{
		$db = Db_Table_ftp_group::getInstance();
		$members = $db->selectField(
			'gid, members',
			array(
				'groupname'	=> $dmn_name
			)
		);

		if (empty($members)) {
			$this->view->assign('FTP_MESSAGE', tr('FTP list is empty!'));
			$items = array();
		} else {
			$this->view->assign('FTP_MESSAGE', '');

			$ftp_accs = explode(',', $members);
			sort($ftp_accs);
			reset($ftp_accs);

			$items = $ftp_accs;
		}

		$this->view->assign('FTP_ITEMS', $items);
		$this->view->assign('TOTAL_FTP_ACCOUNTS', count($items));
	}

	protected function gen_page_form_data($dmn_name, $post_check)
	{
		$dmn_name = $this->domain->decodeIdna($dmn_name);
		if ($post_check === 'no') {
			$this->view->assign(
                'data',
				array(
					'USERNAME'				=> '',
					'DOMAIN_NAME'			=> $dmn_name,
					'DMN_TYPE_CHECKED'		=> 'dmn',
					'OTHER_DIR'				=> '',
					'USE_OTHER_DIR_CHECKED' => 0
				)
			);
		} else {
			$this->view->assign(
                'data',
				array(
					'USERNAME'				=> $_POST['username'],
					'DOMAIN_NAME'			=> $dmn_name,
					'DMN_TYPE'				=> $_POST['dmn_type'],
					'OTHER_DIR'				=> $_POST['other_dir'],
					'USE_OTHER_DIR_CHECKED' => (isset($_POST['use_other_dir']) && $_POST['use_other_dir'] === 'on') ? 1 : 0
				)
			);
		}
	}

	protected function gen_dmn_als_list($dmn_id, $post_check)
	{
		$ok_status = Config::get('ITEM_OK_STATUS');

        $db = Db_Table_domain_aliasses::getInstance();
        $recs = $db->selectRecords(
            'alias_name',
            array(
                'domain_id'     => $dmn_id,
                'alias_status'  => $ok_status
            )
        );

		$als_list = array();
		$als_id = (!isset($_POST['als_id'])) ? '' : $_POST['als_id'];

		if (count($recs) == 0) {
			$als_list['n/a'] = tr('Empty List');
			$this->view->assign('TO_ALIAS_DOMAIN', '');
			$_SESSION['alias_count'] = "no";
		} else {
			$first_passed = false;
			foreach ($recs as $rec) {
				$als_menu_name = $this->domain->decodeIdna($rec['alias_name']);

				$als_list[$rec['alias_name']] = $als_menu_name;

				if (!$first_passed) $first_passed = true;
			}
		}

		$this->view->assign('ALS_LIST', $als_list);
		$this->view->assign('ALS_SELECTED_ID', $als_id);
	}

	protected function gen_dmn_sub_list($dmn_id, $dmn_name, $post_check)
	{
		$ok_status = Config::get('ITEM_OK_STATUS');

        $db = Db_Table_subdomain::getInstance();
        $recs = $db->selectRecords(
            'subdomain_id AS sub_id, subdomain_name AS sub_name',
            array(
                'domain_id'         => $dmn_id,
                'subdomain_status'  => $ok_status
            ),
            array(
                'order_by'          => 'subdomain_name'
            )
        );

		$sub_list = array();
		$sub_id = (!isset($_POST['sub_id'])) ? '' : $_POST['sub_id'];

		if (count($recs) == 0) {
			$sub_list['n/a'] = tr('Empty list');
			$this->view->assign('TO_SUBDOMAIN', '');
			$_SESSION['subdomain_count'] = "no";
		} else {
			$first_passed = false;
			foreach ($recs as $rec) {

				$sub_menu_name = $this->domain->decodeIdna($rec['sub_name']);
				$dmn_menu_name = $this->domain->decodeIdna($dmn_name);
				$sub_list[$rec['sub_name']] = $sub_menu_name . '.' . $dmn_menu_name;

				if (!$first_passed) $first_passed = true;
			}
		}

		$this->view->assign('SUB_LIST', $sub_list);
		$this->view->assign('SUB_SELECTED_ID', $sub_id);
	}

	protected function check_ftp_acc_data($dmn_id, $dmn_name)
	{
		if (!isset($_POST['username']) || $_POST['username'] === '') {
			ispcp_Front_Controller::message(tr('Please enter FTP account username!'));
			return;
		}

		if (!isset($_POST['pass']) || empty($_POST['pass'])
			|| !isset($_POST['pass_rep'])
			|| $_POST['pass_rep'] === ''
		) {
			ispcp_Front_Controller::message(tr('Password is missing!'));
			return;
		}

		if ($_POST['pass'] !== $_POST['pass_rep']) {
			ispcp_Front_Controller::message(tr('Entered passwords do not match!'));
			return;
		}

		if (!ispcp_Validation::checkPassword($_POST['pass'])) {
			if (Config::get('PASSWD_STRONG')) {
				ispcp_Front_Controller::message(
					sprintf(
						tr('The password must be at least %s long and contain letters and numbers to be valid.'),
						Config::get('PASSWD_CHARS')
					)
				);
			} else {
				ispcp_Front_Controller::message(
					sprintf(
						tr('Password data is shorter than %s signs or includes not permitted signs!'),
						Config::get('PASSWD_CHARS')
					)
				);
			}
			return;
		}

		if ($_POST['dmn_type'] === 'sub' && $_POST['sub_id'] === 'n/a') {
			ispcp_Front_Controller::message(tr('Subdomain list is empty! You cannot add FTP accounts there!'));
			return;
		}

		if ($_POST['dmn_type'] === 'als' && $_POST['als_id'] === 'n/a') {
			ispcp_Front_Controller::message(tr('Alias list is empty! You cannot add FTP accounts there!'));
			return;
		}

		if (isset($_POST['use_other_dir']) && $_POST['use_other_dir'] === 'on'
			&& empty($_POST['other_dir'])
		) {
			ispcp_Front_Controller::message(tr('Please specify other FTP account dir!'));
			return;
		}

		if ($this->ftp->addFtpUser($dmn_name)) {
			ispcp_Front_Controller::message(tr('FTP account added!'));
			$this->redirectAction('index');
		}
	}

	protected function gen_page_js()
	{
		if (isset($_SESSION['subdomain_count'])
			&& isset($_SESSION['alias_count'])
		) { // no subdomains and no alias
			$this->view->parse('JS_NOT_DOMAIN', 'js_not_domain');
			$this->view->assign('JS_TO_SUBDOMAIN', '');
			$this->view->assign('JS_TO_ALIAS_DOMAIN', '');
			$this->view->assign('JS_TO_ALL_DOMAIN', '');
		} else if (isset($_SESSION['subdomain_count'])
			&& !isset($_SESSION['alias_count'])) { // no subdomains - alaias available
			$this->view->assign('JS_NOT_DOMAIN', '');
			$this->view->assign('JS_TO_SUBDOMAIN', '');
			$this->view->parse('JS_TO_ALIAS_DOMAIN', 'js_to_alias_domain');
			$this->view->assign('JS_TO_ALL_DOMAIN', '');
		} else if (!isset($_SESSION['subdomain_count'])
			&& isset($_SESSION['alias_count'])) { // no alias - subdomain available
			$this->view->assign('JS_NOT_DOMAIN', '');
			$this->view->parse('JS_TO_SUBDOMAIN', 'js_to_subdomain');
			$this->view->assign('JS_TO_ALIAS_DOMAIN', '');
			$this->view->assign('JS_TO_ALL_DOMAIN', '');
		} else { // there are subdomains and aliases
			$this->view->assign('JS_NOT_DOMAIN', '');
			$this->view->assign('JS_TO_SUBDOMAIN', '');
			$this->view->assign('JS_TO_ALIAS_DOMAIN', '');
			$this->view->parse('JS_TO_ALL_DOMAIN', 'js_to_all_domain');
		}

		// TODO: Trash code?
		unset($GLOBALS['subdomain_count']);
		unset($GLOBALS['alias_count']);
		unset($_SESSION['subdomain_count']);
		unset($_SESSION['alias_count']);
	}
}
