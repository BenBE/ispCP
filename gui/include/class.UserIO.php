<?php
/**
 * ispCP ω (OMEGA) a Virtual Hosting Control System
 *
 * @copyright	2001-2006 by moleSoftware GmbH
 * @copyright	2006-2009 by ispCP | http://isp-control.net
 * @version		SVN: $Id: $
 * @link		http://isp-control.net
 * @author		ispCP Team
 *
 * @license
 *   This program is free software; you can redistribute it and/or
 *   modify it under the terms of the GPL General Public License
 *   as published by the Free Software Foundation; either version 2.0
 *   of the License, or (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *   GPL General Public License for more details.
 *
 *   You may have received a copy of the GPL General Public License
 *   along with this program.
 *
 *   An on-line copy of the GPL General Public License can be found
 *   http://www.fsf.org/licensing/licenses/gpl.txt
 */

/**
 * Class to implement general user input/output handling and provide 
 * some basic validations. Currently this class assumes that the internal 
 * encoding is always UTF-8. 
 * 
 * I splitted "Strings" and "Memos" with the following reason:
 * Using subject/e-mail-address, multi-line strings could be used for 
 * hidden spamming. To avoid more spamming purposes there is of course 
 * more to do (but not here?)... 
 * 
 * @todo Handlers for HTML code (since 2009-05-11 not needed)
 * 
 * @author	Thomas Wacker <zuhause@thomaswacker.de>
 * @copyright	2006-2009 by ispCP | http://isp-control.net
 * @version	1.0
 */
final class UserIO {
	/**
	 * Indicate if class has been initialized
	 * @var boolean
	 */
	private static $_status = false;
	/**
	 * Stripslash user values
	 * @var boolean
	 */
	private static $_stripslash = true;
	/**
	 * UTF-8 encoding of ispCP database
	 * @var boolean
	 */
	private static $_dbutf8 = true;
	
	/**
	 * Initialize class, sets _stripslash
	 */
	public static function init() {
		if (get_magic_quotes_gpc()) {
			self::$_stripslash = true;
		} else {
			self::$_stripslash = false;
		}
		if (Config::get('DATABASE_UTF8') == 'yes') {
			self::$_dbutf8 = 'UTF-8';
		} else {
			self::$_dbutf8 = 'ISO';
		}
	}
	
	/**
	 * Returns string (no linefeeds) value of _GET parameter.
	 * @param $name string name of parameter
	 * @param $mandatory boolean if true, the value must be given (default false)
	 * @param $trim boolean trim return value (default false)
	 * @return string cleaned value, '' if not available
	 */
	public static function GET_String($name, $mandatory=false, $trim=false) {
		if (isset($_GET[$name])) {
			$result = str_replace(array("\n", "\r"), '', $_GET['name']);
			if ($trim) $result = trim($result);
			if (self::$_stripslash) $result = stripslash($result);
			if ($mandatory && empty($result)) $result = false;
		} else {
			$result = $mandatory ? false : '';
		}
		return $result;
	}

	/**
	 * Returns integer value of _GET parameter 
	 * @param $name string name of parameter
	 * @param $mandatory boolean if true, the value must be given (default false)
	 * @return integer cleaned value, 0 if not available, false on error
	 */
	public static function GET_Int($name, $mandatory=false) {
		$value = UserIO::GET_String($name, $mandatory, true);
		if ($value !== false) {
			$result = intval($value);
		} else {
			$result = $mandatory ? false : 0;
		}
		return $result;
	}

	/**
	 * Returns float value of _GET parameter
	 * @param $name string name of parameter
	 * @param $mandatory boolean if true, the value must be given (default false)
	 * @return float cleaned value, 0 if not available, false on error
	 */
	public static function GET_Float($name, $mandatory=false) {
		$value = UserIO::GET_String($name, $mandatory, true);
		if ($value !== false) {
			$result = floatval($value);
		} else {
			$result = $mandatory ? false : 0;
		}
		return $result;
	}

	/**
	 * Returns string (with linefeeds) value of _GET parameter
	 * @param $name string name of parameter
	 * @param $mandatory boolean if true, the value must be given (default false)
	 * @param $trim boolean trim return value (default false)
	 * @return string cleaned value, '' if not available, false on error
	 */
	public static function GET_Memo($name, $mandatory=false, $trim=false) {
		if (isset($_GET[$name])) {
			$result = $_GET['name'];
			if ($trim) $result = trim($result);
			if (self::$_stripslash) $result = stripslash($result);			
			if ($mandatory && empty($result)) $result = false;
		} else {
			$result = $mandatory ? false : '';
		}
		return $result;
	}

	/**
	 * Returns validated E-Mail string value of _GET parameter
	 * @param $name string name of parameter
	 * @param $mandatory boolean if true, the value must be given
	 * @return string cleaned value, '' if not available, false if not correct 
	 */
	public static function GET_EMail($name, $mandatory=false) {
		$email = UserIO::GET_String($name);
		if (!empty($email)) {
			// @todo validate email address...
			$result = $email;
		} else {
			$result = $mandatory ? false : '';
		}
		return $result;
	}	

	/**
	 * Returns validated IP string value of _GET parameter
	 * @param $name string name of parameter
	 * @param $mandatory boolean if true, the value must be given
	 * @return string cleaned value, '' if not available, false if not correct 
	 */
	public static function GET_IP($name, $mandatory=false) {
		$ip = UserIO::GET_String($name);
		if (!empty($ip)) {
			// @todo validate ip address...
			$result = $ip;
		} else {
			$result = $mandatory ? false : '';
		}
		return $result;
	}
	
	/**
	 * Returns html string value
	 * @param $value string input string 
	 * @return string html string (htmlentities)
	 */
	public static function HTML($value) {
		// i assume UTF-8 is always wanted in ispcp
		return htmlentities($value, ENT_COMPAT, self::$_encoding); 
	}
	
	/**
	 * Returns string for inserting in javascript 
	 * @param $value string input string 
	 * @param $addslashes boolean if true, the value is returned with 
	 * addslashes (default false). This is needed if you want to insert
	 * the javascript code into an attribut (e.g. onclick="...") 
	 * @return string converted for inserting in javascript
	 */
	public static function JS($value, $addslashes=false) {
		// br2nl:
		$value = preg_replace('/\<br(\s*)?\/?\>/i', "\n", $value);
		// For security reasons remove any other html tags...
		// Eventually use Zend_Filter functions instead?
		$value = strip_tags($value);
		if ($addslashes) $value = addslashes($value);
		return $value;
	}
	
	/**
	 * Returns string for inserting into a text email 
	 * @param $value string input string 
	 * @return string converted for mail 
	 */
	public static function Mail($value) {
		// Perhaps anytime anything to do here?
		return $value;
	}
	
	/**
	 * Returns string for inserted into a database query
	 * @param $value string input string 
	 * @return string converted for database query 
	 */
	public static function DB($value) {
		if (!self::$_dbutf8) $value = utf8_decode($value);
		// @todo do we need addslashes with prepared statements?
		return addslashes($value)
	}
}