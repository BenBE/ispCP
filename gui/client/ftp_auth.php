<?php
/**
 * ispCP ω (OMEGA) a Virtual Hosting Control System
 *
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
 * Portions created by Initial Developer are Copyright (C) 2006-2011 by
 * isp Control Panel. All Rights Reserved.
 *
 * @category	ispCP
 * @package		ispCP_Update
 * @copyright 	2006-2011 by ispCP | http://isp-control.net
 * @author 		ispCP Team
 * @version 	SVN: $Id$
 * @link		http://isp-control.net ispCP Home Site
 * @license		http://www.mozilla.org/MPL/ MPL 1.1
 */

/**
 * This script allows net2ftp authentication from ispCP
 */

/*******************************************************************************
 * Functions
 */

/**
 * Get ftp login credentials
 *
 * @author William Lightning <kassah@gmail.com>
 * @since  1.1.0
 * @access private
 * @param  string $userid FTP User
 * @return array Array that contains login credentials or FALSE on failure
 */
function _getLoginCredentials($userId) {

	/**
	 * @var $db ispCP_Database_ResultSet
	 */
	$db = ispCP_Registry::get('Db');

	// @todo Should be optimized
	$query = "
		SELECT
			`userid`, `net2ftppasswd`
		FROM
			`ftp_users`, `domain`
		WHERE
				`ftp_users`.`uid` = `domain`.`domain_uid`
			AND
				`ftp_users`.`userid` = ?
			AND
				`domain`.`domain_admin_id` = ?;
	";

	$stmt = exec_query($db, $query, array($userId, $_SESSION['user_id']));

	if($stmt->rowCount() == 1) {
		return array(
			$stmt->fields['userid'],
			decrypt_db_password($stmt->fields['net2ftppasswd'])
		);
	} else {
		return false;
	}
}

/**
 * Creates all cookies for net2ftp
 *
 * @author William Lightning <kassah@gmail.com>
 * @since  1.1.0
 * @access private
 * @param  array $cookies Array that contains cookies definitions for net2ftp
 * @return void
 */
function _net2ftpCreateCookies($cookies) {

	foreach($cookies as $cookie) {
		header("Set-Cookie: $cookie", false);
	}
}

/**
 * net2ftp authentication
 *
 * @author William Lightning <kassah@gmail.com>
 * @since  1.1.0
 * @param  int $userId ftp username
 * @return bool TRUE on success, FALSE otherwise
 */
function net2ftpAuth($userId) {

	$credentials = _getLoginCredentials($userId);

	if($credentials) {
		$data = http_build_query(
			array(
				'username' => $credentials[0],
				'password' => stripcslashes($credentials[1]),
                                'ftpserver' => 'localhost',
                                'ftpserverport' => '21',
                                'directory' => '',
                                'language' => 'en',
                                'ftpmode' => 'automatic',
                                'state' => 'browse',
                                'state2' => 'main'
			)
		);
	} else {
		set_page_message(tr('Error: Unknown FTP user id!'));

		return false;
	}

	// Prepares net2ftp absolute URI to use
	if(isset($_SERVER['HTTPS']) && !empty($_SERVER['HTTPS'])) {
		$port = ($_SERVER['SERVER_PORT'] != '443')
			? ':' . $_SERVER['SERVER_PORT'] : '';

		$net2ftpUri = "https://{$_SERVER['SERVER_NAME']}$port/ftp/";
	} else {
		$port = ($_SERVER['SERVER_PORT'] != '80')
			? ':' . $_SERVER['SERVER_PORT'] : '';

		$net2ftpUri = "http://{$_SERVER['SERVER_NAME']}$port/ftp/";
	}

	// Set stream context (http) options
	stream_context_get_default(
		array(
			'http' => array(
				'method' => 'POST',
				'header' => "Host: {$_SERVER['SERVER_NAME']}$port\r\n" .
					"Content-Type: application/x-www-form-urlencoded\r\n" .
					'Content-Length: ' . strlen($data) . "\r\n" .
					"Connection: close\r\n\r\n",
				'content' => $data,
				'user_agent' => $_SERVER["HTTP_USER_AGENT"],
				'max_redirects' => 1
			)
		)
	);

	// Gets the headers from PhpMyAdmin
	$headers = get_headers($net2ftpUri, true);

        // Absolute minimum I could get a listing with.
        $url = $net2ftpUri.'?ftpserver=localhost&username='.urlencode($userId).'&state=browse&state2=main';

        _net2ftpCreateCookies($headers['Set-Cookie']);
        header("Location: {$url}");

	return true;
}

/*******************************************************************************
 * Main program
 */

// Include all needed libraries and process to the ispCP initialization
require '../include/ispcp-lib.php';

// Check login
check_login(__FILE__);

/**
 *  Dispatches the request
 */
if(isset($_GET['id'])) {
	if(!net2ftpAuth($_GET['id'])) {
		user_goto('ftp_accounts.php');
	}
} else {
	user_goto('/index.php');
}
?>