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

require '../include/ispcp-lib.php';

check_login(__FILE__);

$cfg = ispCP_Registry::get('Config');

$tpl = ispCP_TemplateEngine::getInstance();
$template = 'custom_menus.tpl';

add_new_button($sql);

if (isset($_GET['delete_id'])) {
	delete_button($sql);
}

if (isset($_GET['edit_id'])) {
	edit_button($tpl, $sql);
}

update_button($sql);

gen_button_list($tpl, $sql);

$tpl->assign(
	array(
		'TR_PAGE_TITLE' => tr('ispCP - Admin - Manage custom menus'),
		'TR_TITLE_CUSTOM_MENUS' => tr('Manage custom menus'),
		'TR_ADD_NEW_BUTTON' => tr('Add new button'),
		'TR_BUTTON_NAME' => tr('Button name'),
		'TR_BUTTON_LINK' => tr('Button link'),
		'TR_BUTTON_TARGET' => tr('Button target'),
		'TR_VIEW_FROM' => tr('Show in'),
		'ADMIN' => tr('Administrator level'),
		'RESELLER' => tr('Reseller level'),
		'USER' => tr('Enduser level'),
		'RESSELER_AND_USER' => tr('Reseller and enduser level'),
		'TR_ADD' => tr('Add'),
		'TR_MENU_NAME' => tr('Menu button'),
		'TR_ACTON' => tr('Action'),
		'TR_EDIT' => tr('Edit'),
		'TR_DELETE' => tr('Delete'),
		'TR_LEVEL' => tr('Level'),
		'TR_SAVE' => tr('Save'),
		'TR_EDIT_BUTTON' => tr('Edit button'),
		'TR_MESSAGE_DELETE'	=> tr('Are you sure you want to delete %s?', true, '%s')
	)
);

gen_admin_mainmenu($tpl, 'main_menu_settings.tpl');
gen_admin_menu($tpl, 'menu_settings.tpl');

gen_page_message($tpl);

if (isset($_GET['edit_id'])) {
	$tpl->assign('EDIT_BUTTON', true);
} else {
	$tpl->assign('ADD_BUTTON', true);
}

$tpl->display($template);

if ($cfg->DUMP_GUI_DEBUG) {
	dump_gui_debug();
}

unset_messages();

/**
 * @param ispCP_TemplateEngine $tpl
 * @param ispCP_Database $sql
 * @return void
 */
function gen_button_list($tpl, $sql) {
	$query = "
		SELECT
			*
		FROM
			`custom_menus`
	";

	$rs = exec_query($sql, $query);
	if ($rs->recordCount() == 0) {
		$tpl->assign('BUTTON_LIST', '');

		set_page_message(
			tr('You have no custom menus.'),
			'notice'
		);
	} else {
		global $i;

		while (!$rs->EOF) {
			$menu_id = $rs->fields['menu_id'];
			$menu_level = $rs->fields['menu_level'];
			$menu_name = $rs->fields['menu_name'];
			$menu_link = $rs->fields['menu_link'];

			if ($menu_level === 'admin') {
				$menu_level = tr('Administrator');
			} else if ($menu_level === 'reseller') {
				$menu_level = tr('Reseller');
			} else if ($menu_level === 'user') {
				$menu_level = tr('User');
			} else if ($menu_level === 'all') {
				$menu_level = tr('All');
			}

			$tpl->append(
				array(
					'BUTTON_LINK'		=> tohtml($menu_link),
					'BUTONN_ID'			=> $menu_id,
					'LEVEL'				=> tohtml($menu_level),
					'MENU_NAME'			=> tohtml($menu_name),
					'MENU_NAME2'		=> addslashes(clean_html($menu_name)),
					'LINK'				=> tohtml($menu_link),
					'CONTENT'			=> ($i % 2 == 0) ? 'content' : 'content2'
				)
			);

			$rs->moveNext();
			$i++;
		} // end while
	} // end else
}

function add_new_button($sql) {
	if (!isset($_POST['uaction'])) {
		return;
	} else if ($_POST['uaction'] != 'new_button') {
		return;
	} else {
		$button_name = clean_input($_POST['bname']);
		$button_link = clean_input($_POST['blink']);
		$button_target = clean_input($_POST['btarget']);
		$button_view = $_POST['bview'];

		if (empty($button_name) || empty($button_link)) {
			set_page_message(
				tr('Missing or incorrect data input!'),
				'error'
			);
			return;
		}

		if (!filter_var($button_link, FILTER_VALIDATE_URL, FILTER_FLAG_SCHEME_REQUIRED | FILTER_FLAG_HOST_REQUIRED)) {
			set_page_message(
				tr('Invalid URL!'),
				'warning'
			);
			return;
		}

		if (!empty($button_target)
			&& !in_array($button_target, array('_blank', '_parent', '_self', '_top'))) {
			set_page_message(
				tr('Invalid target!'),
				'warning'
			);
			return;
		}

		$query = "
			INSERT INTO `custom_menus`
				(
				`menu_level`,
				`menu_name`,
				`menu_link`,
				`menu_target`
				)
			VALUES (?, ?, ?, ?)
		";

		exec_query($sql, $query, array($button_view,
				$button_name,
				$button_link,
				$button_target));

		set_page_message(
			tr('Custom menu data updated successful!'),
			'success'
		);
		return;
	}
}

function delete_button($sql) {
	if ($_GET['delete_id'] === '' || !is_numeric($_GET['delete_id'])) {
		set_page_message(
			tr('Missing or incorrect data input!'),
			'warning'
		);
		return;
	} else {
		$delete_id = $_GET['delete_id'];

		$query = "
			DELETE FROM
				`custom_menus`
			WHERE
				`menu_id` = ?
		";

		exec_query($sql, $query, $delete_id);

		set_page_message(
			tr('Custom menu deleted successful!'),
			'success'
		);
		return;
	}
}

/**
 * @param ispCP_TemplateEngine $tpl
 * @param ispCP_Database $sql
 */
function edit_button($tpl, $sql) {

	$cfg = ispCP_Registry::get('Config');

	if ($_GET['edit_id'] === '' || !is_numeric($_GET['edit_id'])) {
		set_page_message(
			tr('Missing or incorrect data input!'),
			'warning'
		);
		return;
	} else {
		$edit_id = $_GET['edit_id'];

		$query = "
			SELECT
				*
			FROM
				`custom_menus`
			WHERE
				`menu_id` = ?
		";

		$rs = exec_query($sql, $query, $edit_id);
		if ($rs->recordCount() == 0) {
			set_page_message(
				tr('Missing or incorrect data input!'),
				'warning'
			);
			$tpl->assign('ADD_BUTTON', true);
			return;
		} else {
			$tpl->assign('EDIT_BUTTON', true);

			$button_name = $rs->fields['menu_name'];
			$button_link = $rs->fields['menu_link'];
			$button_target = $rs->fields['menu_target'];
			$button_view = $rs->fields['menu_level'];

			if ($button_view === 'admin') {
				$admin_view = $cfg->HTML_SELECTED;
				$reseller_view = '';
				$user_view = '';
				$all_view = '';
			} else if ($button_view === 'reseller') {
				$admin_view = '';
				$reseller_view = $cfg->HTML_SELECTED;
				$user_view = '';
				$all_view = '';
			} else if ($button_view === 'user') {
				$admin_view = '';
				$reseller_view = '';
				$user_view = $cfg->HTML_SELECTED;
				$all_view = '';
			} else {
				$admin_view = '';
				$reseller_view = '';
				$user_view = '';
				$all_view = $cfg->HTML_SELECTED;
			}

			$tpl->assign(
				array(
					'BUTON_NAME'	=> tohtml($button_name),
					'BUTON_LINK'	=> tohtml($button_link),
					'BUTON_TARGET'	=> tohtml($button_target),
					'ADMIN_VIEW'	=> $admin_view,
					'RESELLER_VIEW'	=> $reseller_view,
					'USER_VIEW'		=> $user_view,
					'ALL_VIEW'		=> $all_view,
					'EID'			=> $_GET['edit_id']
				)
			);

		}
	}
}

function update_button($sql) {

	if (!isset($_POST['uaction'])) {
		return;
	} else if ($_POST['uaction'] != 'edit_button') {
		return;
	} else {
		$button_name = clean_input($_POST['bname']);
		$button_link = clean_input($_POST['blink']);
		$button_target = clean_input($_POST['btarget']);
		$button_view = $_POST['bview'];
		$button_id = $_POST['eid'];

		if (empty($button_name) || empty($button_link) || empty($button_id)) {
			set_page_message(
				tr('Missing or incorrect data input!'),
				'warning'
			);
			return;
		}

		if (!filter_var($button_link, FILTER_VALIDATE_URL, FILTER_FLAG_SCHEME_REQUIRED | FILTER_FLAG_HOST_REQUIRED)) {
			set_page_message(
				tr('Invalid URL!'),
				'warning'
			);
			return;
		}

		if (!empty($button_target)
			&& !in_array($button_target, array('_blank', '_parent', '_self', '_top'))) {
			set_page_message(
				tr('Invalid target!'),
				'warning'
			);
			return;
		}

		$query = "
			UPDATE
				`custom_menus`
			SET
				`menu_level` = ?,
				`menu_name` = ?,
				`menu_link` = ?,
				`menu_target` = ?
			WHERE
				`menu_id` = ?
		";

		exec_query($sql, $query, array(
				$button_view,
				$button_name,
				$button_link,
				$button_target,
				$button_id
			)
		);

		set_page_message(
			tr('Custom menu data updated successful!'),
			'success'
		);
		return;
	}
}
?>