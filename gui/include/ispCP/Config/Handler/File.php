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
 * Portions created by Initial Developer are Copyright (C) 2006-2010 by
 * isp Control Panel. All Rights Reserved.
 *
 * @category    ispCP
 * @package     ispCP_Config
 * @subpackage  Handler
 * @copyright   2006-2010 by ispCP | http://isp-control.net
 * @author      Laurent Declercq <laurent.declercq@ispcp.net>
 * @version     SVN: $Id$
 * @link        http://isp-control.net ispCP Home Site
 * @license     http://www.mozilla.org/MPL/ MPL 1.1
 */

/**
 * @see ispCP_Config_Handler
 */
require_once  INCLUDEPATH . '/ispCP/Config/Handler.php';

/**
 * Class to handle configuration parameters from a flat file
 *
 * ispCP_Config_Handler adapter class to handle configuration parameters that
 * are stored in a flat file where each pair of key-values are separated by the
 * equal sign.
 *
 * @property string ADMIN_TEMPLATE_PATH Admin templates path
 * @property bool BRUTEFORCE If TRUE, brute force detection is enabled
 * @property bool BRUTEFORCE_BETWEEN If true, block time between login is active
 * @property int BRUTEFORCE_BETWEEN_TIME Block time bettwen each login attemps
 * @property int BRUTEFORCE_BLOCK_TIME Blocktime after brute force detection
 * @property int BRUTEFORCE_MAX_CAPTCHA Max. number of captcha attemps before
 * blocktime
 * @property int BRUTEFORCE_MAX_LOGIN Max. number of login attemps before
 * brute force block time
 * @property int BuildDate ispCP package Build date
 * @property bool CHECK_FOR_UPDATES If TRUE, update cheching is enabled
 * @property bool COUNT_DEFAULT_EMAIL_ADDRESSES If TRUE, count the default mail
 * addresses
 * @property bool CREATE_DEFAULT_EMAIL_ADDRESSES If TRUE, create default email
 * addresse (abuse, postmaster, webmaster)
 * @property int CRITICAL_UPDATE_REVISION Last critical update revision
 * @property int CUSTOM_ORDERPANEL_ID Custom order panel id
 * @property int DATABASE_REVISION Last database revision
 * @property int DEBUG Debug mode
 * @property string DEFAULT_ADMIN_ADDRESS Default mail address for administrator
 * @property int DOMAIN_ROWS_PER_PAGE Number for domain displayed per page
 * @property bool DUMP_GUI_DEBUG If true, display some information for debugging
 * @property string DATABASE_USER ispCP database username
 * @property string DATABASE_PASSWORD ispCP database password
 * @property string DATABASE_TYPE Database type
 * @property string DATABASE_HOST Database hostname
 * @property string DATABASE_NAME Database name
 * @property string CMD_IFCONFIG Path to ifconfig
 * @property string CMD_DF Path to df
 * @property string CMD_VMSTAT Path to vmstat
 * @property string CMD_SWAPCTL Path to swapctl
 * @property string CMD_SYSCTL path to sysctl
 * @property string GUI_ROOT_DIR path to GUI
 * @property string CMD_SHELL Path to shell interpreter
 * @property string FTP_HOMEDIR Ftp home directory
 * @property string GUI_EXCEPTION_WRITERS Exception writer list
 * @property bool HARD_MAIL_SUSPENSION if TRUE, no mail delivery to disabled
 * accounts
 * @property bool ISPCP_SUPPORT_SYSTEM If TRUE, support system is available
 * @property int LOG_LEVEL Log level (only for user errors)
 * @property bool LOSTPASSWORD If TRUE lost password is available
 * @property array LOSTPASSWORD_CAPTCHA_BGCOLOR Captcha background color
 * @property int LOSTPASSWORD_CAPTCHA_HEIGHT Captcha height
 * @property array LOSTPASSWORD_CAPTCHA_TEXTCOLOR Captcha text color
 * @property int LOSTPASSWORD_CAPTCHA_WIDTH Captcha width
 * @property int LOSTPASSWORD_TIMEOUT Timeout for lost password
 * @property bool MAINTENANCEMODE If TRUE, maintenance mode is enabled
 * @property int MAX_DNAMES_LABELS Maximum number of labels for a domain name
 * @property int MAX_SQL_DATABASE_LENGTH Max. length for database name
 * @property int MAX_SQL_PASS_LENGTH Max. length for Sql password
 * @property int MAX_SQL_USER_LENGTH Max. length for Sql username
 * @property int MAX_SUBDNAMES_LABELS Maximum number of labels for a subdomain
 * @property int PASSWD_CHARS Allowed number of chararacterd for passwords
 * @property bool PASSWD_STRONG If TRUE, only strong password are allowed
 * @property bool PREVENT_EXTERNAL_LOGIN_ADMIN If TRUE, login from external
 * site is prevented for administrators
 * @property bool PREVENT_EXTERNAL_LOGIN_CLIENT If TRUE, login from external
 * site is prevented for client
 * @property bool PREVENT_EXTERNAL_LOGIN_RESELLER If TRUE, login from external
 * site is prevented for resellers
 * @property int SESSION_TIMEOUT Session timeout
 * @property bool SHOW_COMPRESSION_SIZE If TRUE, show page compression info
 * @property bool SLD_STRICT_VALIDATION If TRUE, only restricted tld list can
 * have sld with a single character
 * @property bool TLD_STRICT_VALIDATION If TRUE, Only TLD from iana database are
 * usable
 * @property mixed ITEM_ADD_STATUS
 * @property mixed ITEM_ORDERED_STATUS
 * @property mixed ITEM_CHANGE_STATUS
 * @property mixed ITEM_DELETE_STATUS
 * @property mixed ITEM_RESTORE_STATUS
 * @property mixed ITEM_TOENABLE_STATUS
 * @property mixed ITEM_TODISABLED_STATUS
 * @property mixed ITEM_DISABLED_STATUS
 * @property mixed ITEM_DNSCHANGE_STATUS
 * @property mixed ITEM_OK_STATUS
 * @property mixed ITEM_PROTECTED_STATUS
 * @property string MAINTENANCEMODE_MESSAGE
 * @property string HTML_SELECTED
 * @property string HTML_CHECKED
 * @property string HTML_READONLY
 * @property string HTML_DISABLED
 * @property mixed HOSTING_PLANS_LEVEL
 * @property string USER_INITIAL_LANG
 * @property mixed BASE_SERVER_IP
 * @property string DATE_FORMAT
 * @property string IPS_LOGO_PATH
 * @property string CLIENT_TEMPLATE_PATH
 * @property mixed AWSTATS_GROUP_AUTH
 * @property string ZIP
 * @property string BASE_SERVER_VHOST
 * @property string BASE_SERVER_VHOST_PREFIX
 * @property mixed USER_INITIAL_THEME
 * @property mixed FTP_USERNAME_SEPARATOR
 * @property mixed MYSQL_PREFIX
 * @property mixed MYSQL_PREFIX_TYPE
 * @property mixed APACHE_SUEXEC_USER_PREF
 * @property string LOGIN_TEMPLATE_PATH
 * @property mixed PORT_POSTGREY
 * @property mixed FAILED_UPDATE
 * @property mixed DATABASE_UTF8
 * @property mixed PHP_TIMEZONE
 * @property mixed MAIL_BODY_FOOTPRINTS
 * @property mixed MAIL_WRITER_EXPIRY_TIME
 * @property string ROOT_TEMPLATE_PATH
 * @property string RESELLER_TEMPLATE_PATH
 * @property string PURCHASE_TEMPLATE_PATH
 * @property string LOSTPASSWORD_CAPTCHA_FONT
 * @property string SERVER_VHOST_FILE
 * @property string APACHE_SITES_DIR
 * @property string ISPCP_SUPPORT_SYSTEM_TARGET
 * @property string ISPCP_SUPPORT_SYSTEM_PATH
 * @property string SERVER_HOSTNAME
 * @property string MR_LOCK_FILE
 * @property string Version
 * @property string CodeName
 * @property string WEBMAIL_PATH
 * @property string WEBMAIL_TARGET
 * @property string PMA_PATH
 * @property string PMA_TARGET
 * @property string FILEMANAGER_PATH
 * @property string FILEMANAGER_TARGET
 * @property string AWSTATS_ACTIVE
 *
 * @package		ispCP_Config
 * @subpackage	Handler
 * @author		Benedikt Heintel <benedikt.heintel@ispcp.net>
 * @author		Laurent Declercq <laurent.declercq@ispcp.net>
 * @since		1.0.7
 * @version		1.0.6
 */
class ispCP_Config_Handler_File extends ispCP_Config_Handler {

	/**
	 * Configuration file path
	 *
	 * @var string
	 */
	protected $_pathFile;

	/**
	 * Loads all configuration parameters from a flat file
	 *
	 * <b>Note:</b> Default file path is set to:
	 * {/usr/local}/etc/ispcp/ispcp.conf depending of the used distribution.
	 *
	 * @param string $pathFile Configuration file path
	 * @return void
	 * @todo Should be more generic (path file shouldn't be hardcoded here)
	 */
	public function __construct($pathFile = null) {

		if(is_null($pathFile)) {
			switch (PHP_OS) {
				case 'FreeBSD':
				case 'OpenBSD':
				case 'NetBSD':
					$pathFile = '/usr/local/etc/ispcp/ispcp.conf';
					break;
				default:
					$pathFile = '/etc/ispcp/ispcp.conf';
			}
		}

		$this->_pathFile = $pathFile;
		$this->_parseFile();
	}

	/**
	 * Opens a configuration file and parses its Key = Value pairs into the
	 * {@link ispCP_Config_Hangler::parameters} array.
	 *
	 * @throws ispCP_Exception
	 * @return void
	 * @todo Don't use error operator
	 */
	protected function _parseFile() {

		$fd = @file_get_contents($this->_pathFile);

		if ($fd === false) {
			throw new ispCP_Exception(
				"Error: Unable to open the configuration file `{$this->_pathFile}`!"
			);
		}

		$lines = explode(PHP_EOL, $fd);

		foreach ($lines as $line) {
			if (!empty($line) && $line[0] != '#' && strpos($line, '=')) {
				list($key, $value) = explode('=', $line, 2);

				$this[trim($key)] = trim($value);
			}
		}
	}
}
