<?php
/**
 * ispCP ω (OMEGA) complete domain backup/restore tool
 * Backup application
 *
 * @copyright 	2010 Thomas Wacker
 * @author 		Thomas Wacker <zuhause@thomaswacker.de>
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
 */

require_once dirname(__FILE__).'/includes/boot.php';
require_once dirname(__FILE__).'/includes/BackupPackage_ispCP.php';

if ($argc < 3) {
	echo "Usage: php backup.php [OPTIONS] domain archive-password\n";
	echo "OPTIONS:\n";
	echo " -v ........... verbose mode\n";
	exit(1);
}

$verbose = false;
for ($i = 1; $i < $argc-2; $i++) {
	if ($argv[$i] == '-v') {
		$verbose = true;
	}
}

$domain_name = $argv[$argc-2];
$password = $argv[$argc-1];
if (!file_exists(ISPCP_VIRTUAL_PATH.'/'.$domain_name)) {
	echo "Domain not found in ".ISPCP_VIRTUAL_PATH.'/'.$domain_name."\n";
	exit(2);
}

// make clean temp path for every call
if (file_exists(BACKUP_TEMP_PATH)) {
	delTree(BACKUP_TEMP_PATH);
}
mkdir(BACKUP_TEMP_PATH, 0700, true);

// create archive path if not exist
if (!file_exists(ARCHIVE_PATH)) {
	mkdir(ARCHIVE_PATH, 0700, true);
}

$exitcode = 0;

// start packager for domain
$handler = new BackupPackage_ispCP($domain_name, $password);
$handler->verbose = true;
if ($handler->runPackager() == false) {
	echo "Error executing packager: ";
	$msgs = $handler->getErrorMessages();
	foreach ($msgs as $msg) {
		$msg."\n";
	}
	$exitcode = 9;
}

// clean up temp path on exit
if (file_exists(BACKUP_TEMP_PATH)) {
	delTree(BACKUP_TEMP_PATH);
}

exit($exitcode);
