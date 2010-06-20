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
 * ispCP logging class
 *
 * @copyright 	2006-2010 by ispCP | http://isp-control.net
 * @author 		Thomas Wacker <thomas.wacker@ispcp.net>
 */
class ispcp_Log
{
	const LOG_ERROR = 0;
	const LOG_WARNING = 1;
	const LOG_INFO = 2;
	const LOG_DEBUG = 3;
	/**
	 * @var array
	 */
	public static $sendEmailOnLogLevels = array(ispcp_Log::LOG_ERROR);
	/**
	 * holds number of errors
	 */
	public static $errorCount = 0;
	/**
	 * @var Db_Table_log
	 */
	protected static $_db = null;

	/**
	 * Send log Email
	 * @static
	 * @param integer $log_time
	 * @param string $message
	 * @param string $client_ip
	 * @param integer $level
	 * @return void
	 */
	protected static function _sendEmail($log_time, $message, $client_ip, $level)
	{
		$admin_login = $_SESSION['user_logged'];

		$send_log_to = Config::get('DEFAULT_ADMIN_ADDRESS');

		if (!empty($send_log_to)) {
			$admin_email = Config::get('DEFAULT_ADMIN_ADDRESS');
			$default_hostname = Config::get('SERVER_HOSTNAME');
			$default_base_server_ip = Config::get('BASE_SERVER_IP');
			$Version = Config::get('Version');
			$BuildDate = Config::get('BuildDate');

			$subject = tr("ispCP %s on %s (%s)", $Version, $default_hostname, $default_base_server_ip);
			$to = $send_log_to;

			$template = new ispcp_Smarty;
			$template->assign('default_hostname', $default_hostname);
			$template->assign('default_base_server_ip', $default_base_server_ip);
			$template->assign('version', $Version);
			$template->assign('build_date', $BuildDate);
			$template->assign('message', $message);
			$body = $template->fetch('emails/email_log.tpl');

			$headers = "From: \"ispCP Logging Daemon\" <" . $admin_email . ">\n";
			$headers .= "MIME-Version: 1.0\nContent-Type: text/plain; charset=utf-8\nContent-Transfer-Encoding: 7bit\n";
			$headers .= "X-Mailer: ispCP $Version Logging Mailer";

			$mail_result = mail($to, $subject, $body, $headers);
			if (!$mail_result) {
				$log_message = "$admin_login: Logging Daemon Mail To: |$to|, From: |$admin_email|, Status: |NOT OK|!";

				self::$_db->insert(
					array(
						'log_time'	=> $log_time,
						'message'	=> $log_message,
						'client_ip'	=> $client_ip,
						'loglevel'	=> $level
					)
				);
			}
		}
	}

	/**
	 * Log a message
	 * @static
	 * @param string $message
	 * @param int $level
	 * @return void
	 */
	public static function logMessage($message, $level = ispcp_Log::LOG_INFO)
	{
		if (is_null(self::$_db)) {
			self::$_db = Db_Table_log::getInstance();
		}

		$client_ip = ispcp_Common::getRemoteIP();

		$log_time = time();

		self::$_db->insert(
			array(
				'log_time'	=> $log_time,
				'message'	=> $message,
				'client_ip'	=> $client_ip,
				'loglevel'	=> $level
			)
		);
		
		if (in_array($level, self::$sendEmailOnLogLevels)) {
			self::_sendEmail($log_time, $message, $client_ip, $level);
		}

		if ($level == ispcp_Log::LOG_ERROR) {
			self::$errorCount++;
		}
	}
}
