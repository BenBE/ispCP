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

// Avoid unneeded generation during Ajax request
if(!is_xhr()) {
	$tpl = ispCP_TemplateEngine::getInstance();
	$template = 'alias_add.tpl';

	// static page messages
	gen_logged_from($tpl);

	check_permissions($tpl);

	$tpl->assign(
		array(
			'TR_PAGE_TITLE' => tr('ispCP Client : Add Alias'),
			'TR_MANAGE_DOMAIN_ALIAS' => tr('Manage domain alias'),
			'TR_ADD_ALIAS' => tr('Add domain alias'),
			'TR_DOMAIN_NAME' => tr('Domain name'),
			'TR_DOMAIN_ACCOUNT' => tr('User account'),
			'TR_MOUNT_POINT' => tr('Directory mount point'),
			'TR_DOMAIN_IP' => tr('Domain IP'),
			'TR_FORWARD' => tr('Forward to URL'),
			'TR_ADD' => tr('Add alias'),
			'TR_DMN_HELP' => tr("You do not need 'www.' ispCP will add it on its own."),
			'TR_JS_EMPTYDATA' => tr("Empty data or wrong field!"),
			'TR_JS_WDNAME' => tr("Wrong domain name!"),
			'TR_JS_MPOINTERROR' => tr("Please write mount point!"),
			'TR_ENABLE_FWD' => tr("Enable Forward"),
			'TR_ENABLE' => tr("Enable"),
			'TR_DISABLE' => tr("Disable"),
			'TR_PREFIX_HTTP' => 'http://',
			'TR_PREFIX_HTTPS' => 'https://',
			'TR_PREFIX_FTP' => 'ftp://'
		)
	);

	gen_client_mainmenu($tpl, 'main_menu_manage_domains.tpl');
	gen_client_menu($tpl, 'menu_manage_domains.tpl');

	check_client_domainalias_counts($sql, $_SESSION['user_id']);
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
		echo "/".encode_idna(strtolower($_POST['domain']));
		exit;
	} elseif($_POST['uaction'] == 'add_alias') {
		add_domain_alias($err_txt);
	} else {
		throw new ispCP_Exception(tr("Error: unknown action!" . " " . $_POST['uaction']));
	}
} else { // Default view
	init_empty_data();
}

gen_al_page($tpl, $_SESSION['user_id']);
gen_page_msg($tpl, $err_txt);

$tpl->display($template);

if ($cfg->DUMP_GUI_DEBUG) {
	dump_gui_debug();
}

/*
 * Begin function declaration lines
 */

/**
 *
 * @param <type> $sql
 * @param <type> $user_id
 */
function check_client_domainalias_counts($sql, $user_id) {

	list(
		$dmn_id, , , ,	, ,	, , , ,	, , , ,
		$dmn_als_limit, , , , , , , ,
		) = get_domain_default_props($sql, $user_id);

	$als_cnt = get_domain_running_als_cnt($sql, $dmn_id);

	if ($dmn_als_limit != 0 && $als_cnt >= $dmn_als_limit) {
		set_page_message(tr('Domain alias limit reached!'), 'warning');
		user_goto('domains_manage.php');
	}
}
/**
 *
 * @global string $cr_user_id
 * @global string $alias_name
 * @global string $domain_ip
 * @global string $forward
 * @global string $mount_point
 */
function init_empty_data() {
	global $cr_user_id, $alias_name, $domain_ip, $forward, $mount_point;

	$cr_user_id = $alias_name = $domain_ip = $forward = $mount_point = '';

} // End of init_empty_data()


/**
 * Show data fields
 *
 * @global string $alias_name
 * @global string $forward
 * @global string $forward_prefix
 * @global string $mount_point
 * @param ispCP_TemplateEngine $tpl
 * @param int $reseller_id
 */
function gen_al_page(&$tpl, $reseller_id) {

	global $alias_name, $forward, $forward_prefix, $mount_point;

	$cfg = ispCP_Registry::get('Config');

	if (isset($_POST['status']) && $_POST['status'] == 1) {

		$forward_prefix = clean_input($_POST['forward_prefix']);

		$check_en = $cfg->HTML_CHECKED;
		$check_dis = '';
		$forward = encode_idna(strtolower(clean_input($_POST['forward'])));

		$tpl->assign(
			array(
				'READONLY_FORWARD'	=> '',
				'DISABLE_FORWARD'	=> '',
				'HTTP_YES'			=> ($forward_prefix === 'http://') ? $cfg->HTML_SELECTED : '',
				'HTTPS_YES'			=> ($forward_prefix === 'https://') ? $cfg->HTML_SELECTED : '',
				'FTP_YES'			=> ($forward_prefix === 'ftp://') ? $cfg->HTML_SELECTED : ''
			)
		);
	} else {
		$check_en = '';
		$check_dis = $cfg->HTML_CHECKED;
		$forward = '';

		$tpl->assign(
			array(
				'READONLY_FORWARD'	=> $cfg->HTML_READONLY,
				'DISABLE_FORWARD'	=> $cfg->HTML_DISABLED,
				'HTTP_YES'			=> '',
				'HTTPS_YES'			=> '',
				'FTP_YES'			=> ''
				)
			);
	}

	$tpl->assign(
		array(
			'DOMAIN'	=> tohtml(decode_idna($alias_name)),
			'MP'		=> tohtml($mount_point),
			'FORWARD'	=> tohtml($forward),
			'CHECK_EN'	=> $check_en,
			'CHECK_DIS' => $check_dis,
		)
	);

} // End of gen_al_page()

/**
 *
 * @global <type> $cr_user_id
 * @global <type> $alias_name
 * @global <type> $domain_ip
 * @global <type> $forward
 * @global <type> $forward_prefix
 * @global <type> $mount_point
 * @global <type> $validation_err_msg
 * @param <type> $err_al
 * @return <type>
 */
function add_domain_alias(&$err_al) {

	global $cr_user_id, $alias_name, $domain_ip, $forward, $forward_prefix,
		$mount_point, $validation_err_msg;

	$cfg = ispCP_Registry::get('Config');
	$sql = ispCP_Registry::get('Db');

	$cr_user_id = get_user_domain_id($sql, $_SESSION['user_id']);
	$alias_name	= strtolower($_POST['ndomain_name']);
	$mount_point = array_encode_idna(strtolower($_POST['ndomain_mpoint']), true);

	if ($_POST['status'] == 1) {
		$forward = encode_idna(strtolower(clean_input($_POST['forward'])));
		$forward_prefix = clean_input($_POST['forward_prefix']);
	} else {
		$forward = 'no';
		$forward_prefix = '';
	}

	$query = "
		SELECT
			`domain_ip_id`
		FROM
			`domain`
		WHERE
			`domain_id` = ?
	";

	$rs = exec_query($sql, $query, $cr_user_id);
	$domain_ip = $rs->fields['domain_ip_id'];

	// First check if input string is a valid domain names
	if (!validates_dname($alias_name)) {
		$err_al = $validation_err_msg;
		return;
	}

	// Should be perfomed after domain names syntax validation now
	$alias_name = encode_idna($alias_name);

	if (ispcp_domain_exists($alias_name, 0)) {
	 $err_al = tr('Domain with that name already exists on the system!');
	} else if (!validates_mpoint($mount_point) && $mount_point != '/') {
		$err_al = tr("Incorrect mount point syntax");
	} else if ($alias_name == $cfg->BASE_SERVER_VHOST) {
		$err_al = tr('Master domain cannot be used!');
	} else if ($_POST['status'] == 1) {
		$aurl = @parse_url($forward_prefix.decode_idna($forward));
		if ($aurl === false) {
			$err_al = tr("Wrong address in forward URL!");
		} else {
			$domain = $aurl['host'];
			if (substr_count($domain, '.') <= 2) {
				$ret = validates_dname($domain);
			} else {
				$ret = validates_dname($domain, true);
			}
			
			if (!$ret) {
				$err_al = tr("Wrong domain part in forward URL!");
			} else {
				$domain = encode_idna($aurl['host']);
				$forward = $aurl['scheme'].'://';
				if (isset($aurl['user'])) {
					$forward .= $aurl['user'] . (isset($aurl['pass']) ? ':' . $aurl['pass'] : '') .'@';
				}
				$forward .= $domain;
				if (isset($aurl['port'])) {
					$forward .= ':'.$aurl['port'];
				}
				if (isset($aurl['path'])) {
					$forward .= $aurl['path'];
				} else {
					$forward .= '/';
				}
				if (isset($aurl['query'])) {
					$forward .= '?'.$aurl['query'];
				}
				if (isset($aurl['fragment'])) {
					$forward .= '#'.$aurl['fragment'];
				}
			}
		}
	} else {
		$query = "
			SELECT
				`domain_id`
			FROM
				`domain_aliasses`
			WHERE
				`alias_name` = ?
		;";
		$res = exec_query($sql, $query, $alias_name);

		$query = "
			SELECT
				`domain_id`
			FROM
				`domain`
			WHERE
				`domain_name` = ?
		;";
		$res2 = exec_query($sql, $query, $alias_name);

		if ($res->rowCount() > 0 || $res2->rowCount() > 0) {
			// we already have domain with this name
			$err_al = tr("Domain with this name already exist");
		}

		$query = "
			SELECT
				COUNT(`subdomain_id`) AS cnt
			FROM
				`subdomain`
			WHERE
					`domain_id` = ?
				AND
					`subdomain_mount` = ?
		;";
		$subdomres = exec_query($sql, $query, array($cr_user_id, $mount_point));
		$subdomdata = $subdomres->fetchRow();

		$query = "
			SELECT
				COUNT(`subdomain_alias_id`) AS alscnt
			FROM
				`subdomain_alias`
			WHERE
					`alias_id`
				IN (
					SELECT
						`alias_id`
					FROM
						`domain_aliasses`
					WHERE
						`domain_id` = ?
				)
				AND
					`subdomain_alias_mount` = ?
		;";
		$alssubdomres = exec_query($sql, $query, array($cr_user_id, $mount_point));
		$alssubdomdata = $alssubdomres->fetchRow();

		if ($subdomdata['cnt'] > 0 || $alssubdomdata['alscnt'] > 0) {
			$err_al = tr("There is a subdomain with the same mount point!");
		}
	}

	if ('_off_' !== $err_al) {
		return;
	}

	// Begin add new alias domain

	$status = $cfg->ITEM_ORDERED_STATUS;

	$query = "
		INSERT INTO
			`domain_aliasses` (
				`domain_id`, `alias_name`, `alias_mount`, `alias_status`,
				`alias_ip_id`, `url_forward`
			)
		VALUES
			(?, ?, ?, ?, ?, ?)
	;";
	exec_query($sql, $query, array($cr_user_id, $alias_name, $mount_point, $status, $domain_ip, $forward));

	$sql->insertId();

	update_reseller_c_props(get_reseller_id($cr_user_id));

	$admin_login = $_SESSION['user_logged'];

	if ($status == $cfg->ITEM_ORDERED_STATUS) {
		// notify the reseller:
		send_alias_order_email($alias_name);

		write_log("$admin_login: add domain alias for activation: $alias_name.");
		set_page_message(
			tr('Alias scheduled for activation!'),
			'success'
		);
	} else {
		send_request();
		write_log("$admin_login: domain alias scheduled for addition: $alias_name.");
		set_page_message(
			tr('Alias scheduled for addition!'),
			'success'
		);
	}

	user_goto('domains_manage.php');
} // End of add_domain_alias();

/**
 * @param ispCP_TemplateEngine $tpl
 * @param string $error_txt
 */
function gen_page_msg(&$tpl, $error_txt) {

	if ($error_txt != '_off_') {
		$tpl->assign('MESSAGE', $error_txt);
	} else {
		$tpl->assign('PAGE_MESSAGE', '');
	}

} // End of gen_page_msg()
?>