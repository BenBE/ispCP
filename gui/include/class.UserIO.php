<?php
/**
 * ispCP ω (OMEGA) a Virtual Hosting Control System
 *
 * @copyright	2001-2006 by moleSoftware GmbH
 * @copyright	2006-2009 by ispCP | http://isp-control.net
 * @version		SVN: $Id:$
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


define('OVERRIDE_PURIFIER', true);

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
	
	private static $GET = array();
	private static $POST = array();
	
	/**
	 * Initialize class, sets _stripslash
	 */
	public function init() {
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

	// --- Input handlers -------------------------------------------------

	/**
	 * Returns true if a GET parameter is present 
	 * @param $name string name of parameter
	 * @return boolean true if parameter is set
	 */
	public static function GET_isset($name)
	{
		return isset($_GET[$name]);
	}	
	
	/**
	 * Unsets a GET variable (why ever...)
	 * @param $name string name of parameter
	 */
	public static function GET_unset($name)
	{
		if (isset($_GET[$name])) unset($_GET[$name]);
	}
	
	/**
	 * Sets a GET variable (why ever...)
	 * @param $name string name of parameter
	 * @param $value mixed value of parameter
	 */
	public static function GET_set($name, $value)
	{
		$_GET[$name] = $value;
	}
	
	/**
	 * Returns string (no linefeeds) value of _GET parameter.
	 * @param $name string name of parameter
	 * @param $mandatory boolean if true, the value must be given (default false)
	 * @param $trim boolean trim return value (default true)
	 * @param $default string default value if not mandatory and not set
	 * @return string cleaned value, '' if not available, false on error
	 */
	public static function GET_String($name, $mandatory=false, $trim=true, $default='') {
		if (isset($_GET[$name])) {
			$result = str_replace(array("\n", "\r"), '', $_GET[$name]);
			if ($trim) $result = trim($result);
			if (self::$_stripslash) $result = stripslashes($result);
			if ($mandatory && empty($result)) $result = false;
		} else {
			$result = $mandatory ? false : $default;
		}
		return $result;
	}

	/**
	 * Returns integer value of _GET parameter 
	 * @param $name string name of parameter
	 * @param $mandatory boolean if true, the value must be given (default false)
	 * @param $default integer default value if not mandatory and not set
	 * @return integer cleaned value, 0 if not available, false on error
	 */
	public static function GET_Int($name, $mandatory=false, $default=0) {
		$value = UserIO::GET_String($name, $mandatory, true);
		if ($value !== false) {
			$result = intval($value);
		} else {
			$result = $mandatory ? false : $default;
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
	 * @param $trim boolean trim return value (default true)
	 * @return string cleaned value, '' if not available, false on error
	 */
	public static function GET_Memo($name, $mandatory=false, $trim=true) {
		if (isset($_GET[$name])) {
			$result = $_GET[$name];
			if ($trim) $result = trim($result);
			if (self::$_stripslash) $result = stripslashes($result);			
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
	 * @return string cleaned value, '' if not available, false on error
	 */
	public static function GET_EMail($name, $mandatory=false) {
		$email = UserIO::GET_String($name);
		if (!empty($email)) {
			$email = filter_var($email, FILTER_SANITIZE_EMAIL);
			if (filter_var($email, FILTER_VALIDATE_EMAIL) === $email) {
				$result = $email;
			} else {
				$result = $mandatory ? false : '';
			}
		} else {
			$result = $mandatory ? false : '';
		}
		return $result;
	}
	
	/**
	 * Returns validated domain string value of _GET parameter
	 * @param $name string name of parameter
	 * @param $mandatory boolean if true, the value must be given
	 * @return string cleaned value, '' if not available, false on error
	 */
	public static function GET_Domain($name, $mandatory=false) {
		$domain = UserIO::GET_String($name);
		if (!empty($domain)) {
			$result = encode_idna($domain);
		} else {
			$result = $mandatory ? false : '';
		}
		return $result;
	}

	/**
	 * Returns validated IP (v4) string value of _GET parameter
	 * @param $name string name of parameter
	 * @param $mandatory boolean if true, the value must be given
	 * @return string cleaned value, '' if not available, false on error
	 */
	public static function GET_IP($name, $mandatory=false) {
		$ip = UserIO::GET_String($name);
		if (!empty($ip)) {
			if (filter_var($ip, FILTER_VALIDATE_IP, FILTER_FLAG_IPV4) === $ip) {
				$result = $ip;
			} else {
				$result = $mandatory ? false : '';
			}
		} else {
			$result = $mandatory ? false : '';
		}
		return $result;
	}
	
	/**
	 * Returns validated IP (v6) string value of _GET parameter
	 * @param $name string name of parameter
	 * @param $mandatory boolean if true, the value must be given
	 * @return string cleaned value, '' if not available, false on error
	 */
	public static function GET_IPv6($name, $mandatory=false) {
		$ip = UserIO::GET_String($name);
		if (!empty($ip)) {
			if (filter_var($ip, FILTER_VALIDATE_IP, FILTER_FLAG_IPV6) === $ip) {
				$result = $ip;
			} else {
				$result = $mandatory ? false : '';
			}
		} else {
			$result = $mandatory ? false : '';
		}
		return $result;
	}
	
	/**
	 * Returns true if a POST parameter is present 
	 * @param $name string name of parameter
	 * @return boolean true if parameter is set
	 */
	public static function POST_isset($name)
	{
		return isset($_POST[$name]);
	}
	
	/**
	 * Unsets a post variable (why ever...)
	 * @param $name string name of parameter
	 */
	public static function POST_unset($name)
	{
		if (isset($_POST[$name])) unset($_POST[$name]);
	}
	
	/**
	 * Returns string (no linefeeds) value of _POST parameter.
	 * @param $name string name of parameter
	 * @param $mandatory boolean if true, the value must be given (default false)
	 * @param $trim boolean trim return value (default true)
	 * @return string cleaned value, '' if not available, false on error
	 */
	public static function POST_String($name, $mandatory=false, $trim=true) {
		if (isset($_POST[$name])) {
			$result = str_replace(array("\n", "\r"), '', $_POST[$name]);
			if ($trim) $result = trim($result);
			if (self::$_stripslash) $result = stripslashes($result);
			if ($mandatory && empty($result)) $result = false;
		} else {
			$result = $mandatory ? false : '';
		}
		return $result;
	}

	/**
	 * Returns integer value of _POST parameter 
	 * @param $name string name of parameter
	 * @param $mandatory boolean if true, the value must be given (default false)
	 * @return integer cleaned value, 0 if not available, false on error
	 */
	public static function POST_Int($name, $mandatory=false) {
		$value = UserIO::POST_String($name, $mandatory, true);
		if ($value !== false) {
			$result = intval($value);
		} else {
			$result = $mandatory ? false : 0;
		}
		return $result;
	}

	/**
	 * Returns float value of _POST parameter
	 * @param $name string name of parameter
	 * @param $mandatory boolean if true, the value must be given (default false)
	 * @return float cleaned value, 0 if not available, false on error
	 */
	public static function POST_Float($name, $mandatory=false) {
		$value = UserIO::POST_String($name, $mandatory, true);
		if ($value !== false) {
			$result = floatval($value);
		} else {
			$result = $mandatory ? false : 0;
		}
		return $result;
	}

	/**
	 * Returns string (with linefeeds) value of _POST parameter
	 * @param $name string name of parameter
	 * @param $mandatory boolean if true, the value must be given (default false)
	 * @param $trim boolean trim return value (default true)
	 * @return string cleaned value, '' if not available, false on error
	 */
	public static function POST_Memo($name, $mandatory=false, $trim=true) {
		if (isset($_POST[$name])) {
			$result = $_POST[$name];
			if ($trim) $result = trim($result);
			if (self::$_stripslash) $result = stripslashes($result);			
			if ($mandatory && empty($result)) $result = false;
		} else {
			$result = $mandatory ? false : '';
		}
		return $result;
	}

	/**
	 * Returns validated E-Mail string value of _POST parameter
	 * @param $name string name of parameter
	 * @param $mandatory boolean if true, the value must be given
	 * @return string cleaned value, '' if not available, false if not correct 
	 */
	public static function POST_EMail($name, $mandatory=false) {
		$email = UserIO::POST_String($name);
		if (!empty($email)) {
			$email=filter_var($email, FILTER_SANITIZE_EMAIL);
			if ( filter_var($email, FILTER_VALIDATE_EMAIL)  === TRUE ) {
				$result = $email;
			} else {
				$result = $mandatory ? false : '';
			}
		} else {
			$result = $mandatory ? false : '';
		}
		return $result;
	}	
	
	/**
	 * Returns validated domain string value of _POST parameter
	 * @param $name string name of parameter
	 * @param $mandatory boolean if true, the value must be given
	 * @return string cleaned value, '' if not available, false on error
	 */
	public static function POST_Domain($name, $mandatory=false) {
		$domain = UserIO::POST_String($name);
		if (!empty($domain)) {
			$result = encode_idna($domain);
		} else {
			$result = $mandatory ? false : '';
		}
		return $result;
	}
	
	/**
	 * Returns validated IP (v4) string value of _POST parameter
	 * @param $name string name of parameter
	 * @param $mandatory boolean if true, the value must be given
	 * @return string cleaned value, '' if not available, false on error
	 */
	public static function POST_IP($name, $mandatory=false) {
		$ip = UserIO::POST_String($name);
		if (!empty($ip)) {
			if ( filter_var($ip, FILTER_VALIDATE_IP, FILTER_FLAG_IPV4 ) === TRUE) {
				$result = $ip;
			} else {
				$result = $mandatory ? false : '';
			}
		} else {
			$result = $mandatory ? false : '';
		}
		return $result;
	}
	
	/**
	 * Returns validated IP (v6) string value of _POST parameter
	 * @param $name string name of parameter
	 * @param $mandatory boolean if true, the value must be given
	 * @return string cleaned value, '' if not available, false on error
	 */
	public static function POST_IPv6($name, $mandatory=false) {
		$ip = UserIO::POST_String($name);
		if (!empty($ip)) {
			if ( filter_var($ip, FILTER_VALIDATE_IP, FILTER_FLAG_IPV6 ) === TRUE) {
				$result = $ip;
			} else {
				$result = $mandatory ? false : '';
			}
		} else {
			$result = $mandatory ? false : '';
		}
		return $result;
	}

	/**
	 * Returns array from _POST parameter 
	 * @param $name string name of parameter
	 * @param $mandatory boolean if true, the value must be given
	 * @return aray empty array if not available, false on error
	 */
	public static function POST_Array($name, $mandatory=false) {
		if (isset($_POST[$name]) && is_array($_POST[$name])) {
			$result = $_POST[$name];
		} else {
			$result = $mandatory ? false : array();
		}
		return $result;
	}

	/**
	 * Returns string (no linefeeds) value of _COOKIE parameter.
	 * @param $name string name of parameter
	 * @param $mandatory boolean if true, the value must be given (default false)
	 * @param $trim boolean trim return value (default false)
	 * @return string cleaned value, '' if not available, false on error
	 */
	public static function COOKIE_String($name, $mandatory=false, $trim=true) {
		if (isset($_COOKIE[$name])) {
			$result = str_replace(array("\n", "\r"), '', $_COOKIE[$name]);
			if ($trim) $result = trim($result);
			if (self::$_stripslash) $result = stripslashes($result);
			if ($mandatory && empty($result)) $result = false;
		} else {
			$result = $mandatory ? false : '';
		}
		return $result;
	}

	/**
	 * Returns integer value of _COOKIE parameter 
	 * @param $name string name of parameter
	 * @param $mandatory boolean if true, the value must be given (default false)
	 * @return integer cleaned value, 0 if not available, false on error
	 */
	public static function COOKIE_Int($name, $mandatory=false) {
		$value = UserIO::COOKIE_String($name, $mandatory, true);
		if ($value !== false) {
			$result = intval($value);
		} else {
			$result = $mandatory ? false : 0;
		}
		return $result;
	}

	/**
	 * Returns float value of _COOKIE parameter
	 * @param $name string name of parameter
	 * @param $mandatory boolean if true, the value must be given (default false)
	 * @return float cleaned value, 0 if not available, false on error
	 */
	public static function COOKIE_Float($name, $mandatory=false) {
		$value = UserIO::COOKIE_String($name, $mandatory, true);
		if ($value !== false) {
			$result = floatval($value);
		} else {
			$result = $mandatory ? false : 0;
		}
		return $result;
	}
	
	/**
	 * Returns string (no linefeeds) value of _SERVER parameter.
	 * @param $name string name of parameter
	 * @return string cleaned value, '' if not available
	 */
	public static function SERVER_String($name) {
		if (isset($_COOKIE[$name])) {
			// server variables shouldn't have line breaks
			$result = str_replace(array("\n", "\r"), '', $_COOKIE[$name]);
		} else {
			$result = '';
		}
		return $result;
	}

	
	// --- Output handlers ------------------------------------------------
	
	/**
	 * Returns html string value
	 * @param $value string input string 
	 * @param $nl2br boolean use nl2br, default false 
	 * @return string html string (htmlentities)
	 */
	public static function HTML($value, $nl2br=false) {
		// i assume UTF-8 is always wanted in ispcp
		$result = htmlentities($value, ENT_COMPAT, 'UTF-8');
		if ($nl2br) $result = nl2br($result);
		return $result; 
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
		// @todo do we need addslashes with pdo prepared statements?
		return addslashes($value);
	}

}