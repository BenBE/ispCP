<?php
/**
 * ispCP ω (OMEGA) a Virtual Hosting Control System
 *
 * @copyright 	2001-2006 by moleSoftware GmbH
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
 * The Original Code is "VHCS - Virtual Hosting Control System".
 *
 * The Initial Developer of the Original Code is moleSoftware GmbH.
 * Portions created by Initial Developer are Copyright (C) 2001-2006
 * by moleSoftware GmbH. All Rights Reserved.
 * Portions created by the ispCP Team are Copyright (C) 2006-2010 by
 * isp Control Panel. All Rights Reserved.
 */

require '../include/ispcp-lib.php';

check_login(__FILE__);

$cfg = ispCP_Registry::get('Config');

$tpl = ispCP_Registry::get('template');
$tpl->assign('PAGE_TITLE', tr('ispCP - Admin/Manage users/Reseller assignment'));
$tpl->assign('PAGE_CONTENT', 'manage_reseller_owners.tpl');
/**
 * @todo check if it's useful to have the table admin two times in the same query
 */
function gen_reseller_table(&$tpl, &$sql) {

	$cfg = ispCP_Registry::get('Config');

	$query = "
		SELECT
			t1.`admin_id`, t1.`admin_name`, t2.`admin_name` AS created_by
		FROM
			`admin` AS t1,
			`admin` AS t2
		WHERE
			t1.`admin_type` = 'reseller'
		AND
			t1.`created_by` = t2.`admin_id`
		ORDER BY
			`created_by`,
			`admin_id`
	";

	$rs = exec_query($sql, $query);

	$i = 0;

	if ($rs->recordCount() == 0) {
		$tpl->assign(
			array(
				'MESSAGE' => tr('Reseller list is empty!'),
				'RESELLER_LIST' => '',
			)
		);

	} else {
		while (!$rs->EOF) {

			$tpl->append(
				array(
					'RSL_CLASS' => ($i % 2 == 0) ? 'content' : 'content2',
				)
			);

			$admin_id = $rs->fields['admin_id'];

			$admin_id_var_name = "admin_id_".$admin_id;

			$tpl->append(
				array(
					'NUMBER' => $i + 1,
					'RESELLER_NAME' => tohtml($rs->fields['admin_name']),
					'OWNER' => tohtml($rs->fields['created_by']),
					'CKB_NAME' => $admin_id_var_name,
				)
			);

			$rs->moveNext();

			$i++;
		}
	}

	$query = "
		SELECT
			`admin_id`, `admin_name`
		FROM
			`admin`
		WHERE
			`admin_type` = 'admin'
		ORDER BY
			`admin_name`
	";

	$rs = exec_query($sql, $query);

	while (!$rs->EOF) {

		if ((isset($_POST['uaction']) && $_POST['uaction'] === 'reseller_owner')
			&& (isset($_POST['dest_admin'])
				&& $_POST['dest_admin'] == $rs->fields['admin_id'])) {
			$selected = $cfg->HTML_SELECTED;
		} else {
			$selected = '';
		}

		$tpl->append(
			array(
				'OPTION' => tohtml($rs->fields['admin_name']),
				'VALUE' => $rs->fields['admin_id'],
				'SELECTED' => $selected,
			)
		);

		$rs->moveNext();

		$i++;
	}
}

function update_reseller_owner($sql) {

	if (isset($_POST['uaction']) && $_POST['uaction'] === 'reseller_owner') {
		$query = "
			SELECT
				`admin_id`
			FROM
				`admin`
			WHERE
				`admin_type` = 'reseller'
			ORDER BY
				`admin_name`
		";

		$rs = execute_query($sql, $query);

		while (!$rs->EOF) {
			$admin_id = $rs->fields['admin_id'];

			$admin_id_var_name = "admin_id_$admin_id";

			if (isset($_POST[$admin_id_var_name]) && $_POST[$admin_id_var_name] === 'on') {
				$dest_admin = $_POST['dest_admin'];

				$query = "
					UPDATE
						`admin`
					SET
						`created_by` = ?
					WHERE
						`admin_id` = ?
				";

				$up = exec_query($sql, $query, array($dest_admin, $admin_id));
			}

			$rs->moveNext();
		}
	}
}

/*
 *
 * static page messages.
 *
 */

gen_admin_menu($tpl, 'users_manage');

update_reseller_owner($sql);

gen_reseller_table($tpl, $sql);

$tpl->assign(
	array(
		'TR_RESELLER_ASSIGNMENT' => tr('Reseller assignment'),
		'TR_RESELLER_USERS' => tr('Reseller users'),
		'TR_NUMBER' => tr('No.'),
		'TR_MARK' => tr('Mark'),
		'TR_RESELLER_NAME' => tr('Reseller name'),
		'TR_OWNER' => tr('Owner'),
		'TR_TO_ADMIN' => tr('To Admin'),
		'TR_MOVE' => tr('Move'),
	)
);

$tpl->prnt();

if ($cfg->DUMP_GUI_DEBUG) {
	dump_gui_debug();
}

unset_messages();
