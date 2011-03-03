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

// common page data.

// Avoid unneeded generation during Ajax request
if (!is_xhr()) {
	$tpl = ispCP_TemplateEngine::getInstance();
	$template = 'subdomain_add.tpl';

	// check user sql permission
	if (isset($_SESSION['subdomain_support']) &&
		$_SESSION['subdomain_support'] == "no") {
		header('Location: index.php');
	}

	// static page messages.
	gen_logged_from($tpl);

	check_permissions($tpl);

	$tpl->assign(
		array(
			'TR_PAGE_TITLE'						=> tr('ispCP - Client/Add Subdomain'),
			'TR_ADD_SUBDOMAIN'					=> tr('Add subdomain'),
			'TR_SUBDOMAIN_DATA'					=> tr('Subdomain data'),
			'TR_SUBDOMAIN_NAME'					=> tr('Subdomain name'),
			'TR_DIR_TREE_SUBDOMAIN_MOUNT_POINT'	=> tr('Directory tree mount point'),
			'TR_FORWARD'						=> tr('Forward to URL'),
			'TR_ADD'							=> tr('Add'),
			'TR_DMN_HELP'						=> tr('You do not need \'www.\' ispCP will add it on its own.'),
			'TR_ENABLE_FWD'						=> tr('Enable Forward'),
			'TR_ENABLE'							=> tr('Enable'),
			'TR_DISABLE'						=> tr('Disable'),
			'TR_PREFIX_HTTP'					=> 'http://',
			'TR_PREFIX_HTTPS'					=> 'https://',
			'TR_PREFIX_FTP'						=> 'ftp://'
		)
	);

	gen_client_mainmenu($tpl, 'main_menu_manage_domains.tpl');
	gen_client_menu($tpl, 'menu_manage_domains.tpl');
}

$err_txt = '_off_';

// Dispatch Request
if(isset($_POST['uaction'])) {
	if($_POST['uaction'] == 'toASCII') { // Ajax request
		header('Content-Type: text/plain; charset=utf-8');
		header('Cache-Control: no-cache, private');
		// backward compatibility for HTTP/1.0
		header('Pragma: no-cache');
		header("HTTP/1.0 200 Ok");

		// Todo check return value here before echo...
		echo "/".encode_idna(strtolower($_POST['subdomain']));
		exit;
	} elseif($_POST['uaction'] == 'add_subd') {
		$dmn_name = check_subdomain_permissions($_SESSION['user_id']);
		gen_user_add_subdomain_data($tpl, $_SESSION['user_id']);
		check_subdomain_data($tpl, $err_txt, $_SESSION['user_id'], $dmn_name);
	} else {
		throw new ispCP_Exception(tr("Error: unknown action!" . " " . $_POST['uaction']));
	}
} else { // Default view
	gen_user_add_subdomain_data($tpl, $_SESSION['user_id']);
}

gen_page_msg($tpl, $err_txt);

$tpl->display($template);

if ($cfg->DUMP_GUI_DEBUG) {
	dump_gui_debug();
}

// page functions.

/**
 *
 * @param ispCP_TemplateEngine $tpl
 * @param string $error_txt
 */
function gen_page_msg(&$tpl, $error_txt) {

	if ($error_txt != '_off_') {
		$tpl->assign('MESSAGE', $error_txt);
	} else {
		$tpl->assign('PAGE_MESSAGE', '');
	}

}

/**
 *
 * @param <type> $user_id
 * @return <type>
 */
function check_subdomain_permissions($user_id) {
	$sql = ispCP_Registry::get('Db');

	$props = get_domain_default_props($sql, $user_id, true);

	$dmn_id = $props['domain_id'];
	$dmn_name = $props['domain_name'];
	$dmn_subd_limit = $props['domain_subd_limit'];

	$sub_cnt = get_domain_running_sub_cnt($sql, $dmn_id);

	if ($dmn_subd_limit != 0 && $sub_cnt >= $dmn_subd_limit) {
		set_page_message(tr('Subdomains limit reached!'), 'warning');
		user_goto('domains_manage.php');
	}

	if (@$_POST['dmn_type'] == 'als') {
		$query_alias = "
			SELECT
				`alias_name`
			FROM
				`domain_aliasses`
			WHERE
				`alias_id` = ?
		;";
		$rs = exec_query($sql, $query_alias, $_POST['als_id']);
		return $rs->fields['alias_name'];
	}
	return $dmn_name; // Will be used in subdmn_exists()
}

/**
 * @param ispCP_TemplateEngine $tpl
 * @param int $user_id
 */
function gen_user_add_subdomain_data(&$tpl, $user_id) {

	$cfg = ispCP_Registry::get('Config');
	$sql = ispCP_Registry::get('Db');

	$subdomain_name = $subdomain_mnt_pt = $forward_prefix = '';

	$query = "
		SELECT
			`domain_name`,
			`domain_id`
		FROM
			`domain`
		WHERE
			`domain_admin_id` = ?
	;";

	$rs = exec_query($sql, $query, $user_id);
	$domainname = decode_idna($rs->fields['domain_name']);
	$tpl->assign(
		array(
			'DOMAIN_NAME'		=> '.' . tohtml($domainname),
			'SUB_DMN_CHECKED'	=> $cfg->HTML_CHECKED,
			'SUB_ALS_CHECKED'	=> ''
		)
	);
	gen_dmn_als_list($tpl, $rs->fields['domain_id'], 'no');

	if (isset($_POST['uaction']) && $_POST['uaction'] === 'add_subd') {
		if($_POST['status'] == 1) {
			$forward_prefix = clean_input($_POST['forward_prefix']);
			$check_en = 'checked="checked"';
			$check_dis = '';
			$forward = strtolower(clean_input($_POST['forward']));
			$tpl->assign(
				array(
					'READONLY_FORWARD' => '',
					'DISABLE_FORWARD' => ''
				)
			);
		} else {
			$check_en = '';
			$check_dis = 'checked="checked"';
			$forward = '';
			$tpl->assign(
				array(
					'READONLY_FORWARD'	=> $cfg->HTML_READONLY,
					'DISABLE_FORWARD'	=> $cfg->HTML_DISABLED
				)
			);
		}
		$tpl->assign(
			array(
				'HTTP_YES'		=> ($forward_prefix === 'http://') ? $cfg->HTML_SELECTED : '',
				'HTTPS_YES'		=> ($forward_prefix === 'https://') ? $cfg->HTML_SELECTED : '',
				'FTP_YES'		=> ($forward_prefix === 'ftp://') ? $cfg->HTML_SELECTED : ''
			)
		);
		$subdomain_name = clean_input($_POST['subdomain_name']);
		$subdomain_mnt_pt = array_encode_idna(clean_input($_POST['subdomain_mnt_pt']), true);
	} else {
		$check_en = '';
		$check_dis = 'checked="checked"';
		$forward = '';
		$tpl->assign(
			array(
				'READONLY_FORWARD'	=> $cfg->HTML_READONLY,
				'DISABLE_FORWARD'	=> $cfg->HTML_DISABLED,
				'HTTP_YES'		=> '',
				'HTTPS_YES'		=> '',
				'FTP_YES'		=> ''
			)
		);
	}
	$tpl->assign(
		array(
			'SUBDOMAIN_NAME' => $subdomain_name,
			'SUBDOMAIN_MOUNT_POINT' => $subdomain_mnt_pt,
			'FORWARD'	=> $forward,
			'CHECK_EN'	=> $check_en,
			'CHECK_DIS' => $check_dis
		)
	);
}

/**
 *
 * @param ispCP_TemplateEngine $tpl
 * @param int $dmn_id
 * @param string $post_check
 */
function gen_dmn_als_list(&$tpl, $dmn_id, $post_check) {

	$cfg = ispCP_Registry::get('Config');
	$sql = ispCP_Registry::get('Db');

	$ok_status = $cfg->ITEM_OK_STATUS;

	$query = "
		SELECT
			`alias_id`, `alias_name`
		FROM
			`domain_aliasses`
		WHERE
			`domain_id` = ?
		AND
			`alias_status` = ?
		ORDER BY
			`alias_name`
	;";

	$rs = exec_query($sql, $query, array($dmn_id, $ok_status));
	if ($rs->recordCount() == 0) {
		$tpl->assign(
			array(
				'ALS_ID' => '0',
				'ALS_SELECTED' => $cfg->HTML_SELECTED,
				'ALS_NAME' => tr('Empty list')
			)
		);
		$tpl->assign('TO_ALIAS_DOMAIN', '');
		$_SESSION['alias_count'] = "no";
	} else {
		$first_passed = false;
		while (!$rs->EOF) {
			if ($post_check === 'yes') {
				$als_id = (!isset($_POST['als_id'])) ? '' : $_POST['als_id'];
				$als_selected = ($als_id == $rs->fields['alias_id']) ? $cfg->HTML_SELECTED : '';
			} else {
				$als_selected = (!$first_passed) ? $cfg->HTML_SELECTED : '';
			}

			$alias_name = decode_idna($rs->fields['alias_name']);
			$tpl->assign(
				array(
					'ALS_ID' => $rs->fields['alias_id'],
					'ALS_SELECTED' => $als_selected,
					'ALS_NAME' => tohtml($alias_name)
				)
			);
			$rs->moveNext();

			if (!$first_passed) {
				$first_passed = true;
			}
		}
	}
}

/**
 *
 * @global <type> $dmn_name
 * @param <type> $user_id
 * @param <type> $domain_id
 * @param <type> $sub_name
 * @return <type>
 */
function subdmn_exists($user_id, $domain_id, $sub_name) {
	global $dmn_name;

	$cfg = ispCP_Registry::get('Config');
	$sql = ispCP_Registry::get('Db');

	if ($_POST['dmn_type'] == 'als') {
		$query_subdomain = "
			SELECT
				COUNT(`subdomain_alias_id`) AS cnt
			FROM
				`subdomain_alias`
			WHERE
				`alias_id` = ?
			AND
				`subdomain_alias_name` = ?
		;";

		$query_domain = "
			SELECT
				COUNT(`alias_id`) AS cnt
			FROM
				`domain_aliasses`
			WHERE
				`alias_name` = ?
		;";
	} else {
		$query_subdomain = "
			SELECT
				COUNT(`subdomain_id`) AS cnt
			FROM
				`subdomain`
			WHERE
				`domain_id` = ?
			AND
				`subdomain_name` = ?
		;";

		$query_domain = "
			SELECT
				COUNT(`domain_id`) AS cnt
			FROM
				`domain`
			WHERE
				`domain_name` = ?
		;";
	}
	$domain_name = $sub_name . "." . $dmn_name;

	$rs_subdomain = exec_query($sql, $query_subdomain, array($domain_id, $sub_name));
	$rs_domain = exec_query($sql, $query_domain, array($domain_name));

	$std_subs = array(
		'www', 'mail', 'webmail', 'pop', 'pop3', 'imap', 'smtp', 'pma', 'relay',
		'ftp', 'ns1', 'ns2', 'localhost'
	);

	if ($rs_subdomain->fields['cnt'] == 0
		&& $rs_domain->fields['cnt'] == 0
		&& !in_array($sub_name, $std_subs)
		&& $cfg->BASE_SERVER_VHOST != $domain_name
	) {
		return false;
	}

	return true;
}

/**
 *
 * @param int $user_id
 * @param int $domain_id
 * @param <type> $sub_name
 * @param <type> $sub_mnt_pt
 * @param <type> $forward
 */
function subdomain_schedule($user_id, $domain_id, $sub_name, $sub_mnt_pt, $forward) {

	$cfg = ispCP_Registry::get('Config');
	$sql = ispCP_Registry::get('Db');

	$status_add = $cfg->ITEM_ADD_STATUS;

	if ($_POST['dmn_type'] == 'als') {
		$query = "
			INSERT INTO
				`subdomain_alias`
					(`alias_id`,
					`subdomain_alias_name`,
					`subdomain_alias_mount`,
					`subdomain_alias_url_forward`,
					`subdomain_alias_status`)
			VALUES
				(?, ?, ?, ?, ?)
		;";
	} else {
		$query = "
			INSERT INTO
				`subdomain`
					(`domain_id`,
					`subdomain_name`,
					`subdomain_mount`,
					`subdomain_url_forward`,
					`subdomain_status`)
			VALUES
				(?, ?, ?, ?, ?)
		;";
	}

	exec_query($sql, $query, array($domain_id, $sub_name, $sub_mnt_pt, $forward, $status_add));

	update_reseller_c_props(get_reseller_id($domain_id));

	$sql->insertId();

	// We do not need to create the default mail addresses, subdomains are
	// related to their domains.

	write_log($_SESSION['user_logged'] . ": adds new subdomain: " . $sub_name);
	send_request();
}

/**
 *
 * @global <type> $validation_err_msg
 * @param <type> $tpl
 * @param <type> $err_sub
 * @param <type> $user_id
 * @param <type> $dmn_name
 * @return <type>
 */
function check_subdomain_data(&$tpl, &$err_sub, $user_id, $dmn_name) {
	global $validation_err_msg;

	$sql = ispCP_Registry::get('Db');

	$dmn_id = $domain_id = get_user_domain_id($sql, $user_id);

	if (isset($_POST['uaction']) && $_POST['uaction'] === 'add_subd') {

		if (empty($_POST['subdomain_name'])) {
			 $err_sub = tr('Please specify subdomain name!');
			return;
		}
		$sub_name = strtolower($_POST['subdomain_name']);

		if ($_POST['status'] == 1) {
			$forward = strtolower(clean_input($_POST['forward']));
			$forward_prefix = clean_input($_POST['forward_prefix']);
		} else {
			$forward = 'no';
			$forward_prefix = '';
		}

		// Should be perfomed after domain names syntax validation now
		//$sub_name = encode_idna($sub_name);

		if (isset($_POST['subdomain_mnt_pt']) && $_POST['subdomain_mnt_pt'] !== '') {
			$sub_mnt_pt = array_encode_idna(strtolower($_POST['subdomain_mnt_pt']), true);
		} else {
			$sub_mnt_pt = "/";
		}

		if ($_POST['dmn_type'] === 'als') {

			if (!isset($_POST['als_id'])) {
				$err_sub = tr('No valid alias domain selected!');
				return;
			}

			$query_alias = "
				SELECT
					`alias_mount`
				FROM
					`domain_aliasses`
				WHERE
					`alias_id` = ?
			;";

			$rs = exec_query($sql, $query_alias, $_POST['als_id']);

			$als_mnt = $rs->fields['alias_mount'];

			if ($sub_mnt_pt[0] != '/')
				$sub_mnt_pt = '/'.$sub_mnt_pt;

			$sub_mnt_pt = $als_mnt.$sub_mnt_pt;
			$sub_mnt_pt = str_replace('//', '/', $sub_mnt_pt);
			$domain_id = $_POST['als_id'];
		}

		// First check if input string is a valid domain names
		if (!validates_subdname($sub_name, decode_idna($dmn_name))) {
			$err_sub = $validation_err_msg;
			return;
		}

		// Should be perfomed after domain names syntax validation now
		$sub_name = encode_idna($sub_name);

		if (subdmn_exists($user_id, $domain_id, $sub_name)) {
			$err_sub = tr('Subdomain already exists or is not allowed!');
		} elseif (mount_point_exists($dmn_id, array_encode_idna($sub_mnt_pt, true))) {
			$err_sub = tr('Mount point already in use!');
		} elseif (!validates_mpoint($sub_mnt_pt)) {
			$err_sub = tr('Incorrect mount point syntax!');
		} elseif ($_POST['status'] == 1) {
			$surl = @parse_url($forward_prefix.decode_idna($forward));
			if ($surl === false) {
				$err_sub = tr('Wrong domain part in forward URL!');
			} else {
				$domain = $surl['host'];
				if (substr_count($domain, '.') <= 2) {
					$ret = validates_dname($domain);
				} else {
					$ret = validates_dname($domain, true);
				}

				if (!$ret) {
					$err_sub = tr('Wrong domain part in forward URL!');
				} else {
					$domain = encode_idna($surl['host']);
					$forward = $surl['scheme'].'://';
					if (isset($surl['user'])) {
						$forward .= $surl['user'] . (isset($surl['pass']) ? ':' . $surl['pass'] : '') .'@';
					}
					$forward .= $domain;
					if (isset($surl['port'])) {
						$forward .= ':'.$surl['port'];
					}
					if (isset($surl['path'])) {
						$forward .= $surl['path'];
					} else {
						$forward .= '/';
					}
					if (isset($surl['query'])) {
						$forward .= '?'.$surl['query'];
					}
					if (isset($surl['fragment'])) {
						$forward .= '#'.$surl['fragment'];
					}
				}
			}
		} else {
			// now let's fix the mountpoint
			$sub_mnt_pt = array_encode_idna($sub_mnt_pt, true);
		}
		if ('_off_' !== $err_sub) {
			return;
		}
		subdomain_schedule($user_id, $domain_id, $sub_name, $sub_mnt_pt, $forward);
		set_page_message(tr('Subdomain scheduled for addition!'), 'notice');
		user_goto('domains_manage.php');
	}
}
?>