<?php
/**
 * ispCP ω (OMEGA) a Virtual Hosting Control System
 *
 * @copyright	2001-2006 by moleSoftware GmbH
 * @copyright	2006-2009 by ispCP | http://isp-control.net
 * @version		SVN: $Id: multilanguage_export.php 1744 2009-05-07 03:21:47Z haeber $
 * @link		http://isp-control.net
 * @author		ispCP Team
 *
 * @license
 *   This program is free software; you can redistribute it and/or modify it under
 *   the terms of the MPL General Public License as published by the Free Software
 *   Foundation; either version 1.1 of the License, or (at your option) any later
 *   version.
 *   You should have received a copy of the MPL Mozilla Public License along with
 *   this program; if not, write to the Open Source Initiative (OSI)
 *   http://opensource.org | osi@opensource.org
 */

require '../include/ispcp-lib.php';

// Security
check_login(__FILE__);

if (UserIO::GET_String('export_lang', true, true) !== false) {
	$language_table = UserIO::GET_String('export_lang', true, true);
	$language_table = str_replace(array('`', "'", '"'), '', $language_table);
	$encoding = $sql->Execute("SELECT `msgstr` FROM `" . $language_table . "` WHERE `msgid` = 'encoding';");
	if ($encoding
		&& $encoding->RowCount() > 0
		&& $encoding->fields['msgstr'] != '') {
		$encoding = $encoding->fields['msgstr'];
	} else {
		$encoding = 'UTF-8';
	}
	$query = <<<SQL_QUERY
			SELECT
				`msgid`,
				`msgstr`
			FROM
				$language_table
SQL_QUERY;

	$rs = exec_query($sql, $query, array());

	if ($rs->RecordCount() == 0) {
		set_page_message(tr("Incorrect data input!"));
		user_goto('multilanguage.php');
	} else {
		$GLOBALS['class']['output']->showSize = false;
		header('Content-type: text/plain; charset=' . $encoding);
		while (!$rs->EOF) {
			$msgid = $rs->fields['msgid'];
			$msgstr = $rs->fields['msgstr'];
			if ($msgid !== '' && $msgstr !== '') {
				echo $msgid . " = " . $msgstr."\n";
			}
			$rs->MoveNext();
		}
	}
} else {
	set_page_message(tr("Incorrect data input!"));
	user_goto('multilanguage.php');
}
