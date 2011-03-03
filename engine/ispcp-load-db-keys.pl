#!/usr/bin/perl

# ispCP ω (OMEGA) a Virtual Hosting Control Panel
# Copyright (C) 2006-2011 by ispCP | http://ispcp.net
#
# Version: $Id$
#
# The contents of this file are subject to the Mozilla Public License
# Version 1.1 (the "License"); you may not use this file except in
# compliance with the License. You may obtain a copy of the License at
# http://www.mozilla.org/MPL/
#
# Software distributed under the License is distributed on an "AS IS"
# basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
# License for the specific language governing rights and limitations
# under the License.

$main::db_pass_key = '{KEY}';
$main::db_pass_iv = '{IV}';
$main::key_conf = '';

if (-e "$main::ispcp_etc_dir/ispcp-keys.conf") {
	# new configuration file exists
	$main::key_conf  = "$main::ispcp_etc_dir/ispcp-keys.conf";

	read_ispcp_key_cfg();

} else {
	# search for old configuration file in path
	foreach (@INC) {
		if (-f "$_/ispcp-db-keys.pl") {
			require 'ispcp-db-keys.pl';
			last;
		}
	}
}

1;
