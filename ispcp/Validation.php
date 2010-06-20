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
 * ispCP Validation methods
 *
 * @copyright 	2006-2010 by ispCP | http://isp-control.net
 * @author 		Thomas Wacker <thomas.wacker@ispcp.net>
 */

class ispcp_Validation
{

	/**
	 * Validates a username
	 *
	 * This function validates syntax of usernames.
	 * The characters allowed are all alphanumeric in
	 * upper or lower case, the hyphen , the low dash
	 * and  the dot, the three latter  being banned at
	 * the beginning and end of string.
	 *
	 * Successive instances of a dot or underscore are prohibited
	 *
	 * @author Laurent Declercq <l.declercq@nuxwin.com>
	 * @copyright 2006-2009 by ispCP | http://isp-control.net
	 * @version 1.0
	 * @since rxxxx
	 * @param string $username the username to be checked
	 * @param int $min_char number of min. chars
	 * @param int $max_char number min. chars
	 * @return boolean True if the username is valid, FALSE otherwise
	 */
	public static function validateUsername($username, $min_char = 2, $max_char = 30)
	{

		$pattern = '@^[[:alnum:]](:?(?<![-_])(:?-*|[_.])?(?![-_])[[:alnum:]]*)*?(?<![-_.])$@';

		return (bool) (preg_match($pattern, $username) &&
			strlen($username) >= $min_char &&
			strlen($username) <= $max_char );
	}

	/**
	 * Passwort check
	 *
	 * Check if a password is valid
	 *
	 * @author		ispCP Team
	 * @author		Benedikt Heintel
	 * @copyright	2006-2009 by ispCP | http://isp-control.net
	 * @version		1.01
	 *
	 * @access	public
	 * @param	string	$data		username to be checked
	 * @param	int		$num		number of max. chars
	 * @param	string	$permitted	RegExp of permitted chars
	 * @return	boolean				valid password or not
	 */
	public static function checkPassword($password, $num = 50, $permitted = "")
	{
		if ($num > 255) {
			$num = 255;
		} else if ($num < 6) {
			$num = 6;
		}

		$len = mb_strlen($password);
		if ($len < Config::get('PASSWD_CHARS') || $len > $num) {
			return false;
		}

		if (!empty($permitted) && (bool)preg_match($permitted, $password)) {
			return false;
		}

		if (Config::get('PASSWD_STRONG')) {
			return (bool)(preg_match("/[0-9]/", $password)
				&& preg_match("/[a-zA-Z]/", $password));
		} else {
			return true;
		}
	}

}