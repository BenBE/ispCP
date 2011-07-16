#!/usr/bin/make -f

# ispCP ω (OMEGA) a Virtual Hosting Control Panel
# Copyright (C) 2001-2006 by moleSoftware GmbH - http://www.molesoftware.com
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
#
# The Original Code is "VHCS - Virtual Hosting Control System".
#
# The Initial Developer of the Original Code is moleSoftware GmbH.
# Portions created by Initial Developer are Copyright (C) 2001-2006
# by moleSoftware GmbH. All Rights Reserved.
# Portions created by the ispCP Team are Copyright (C) 2006-2011 by
# isp Control Panel. All Rights Reserved.
#
# The ispCP ω Home Page is:
#
#    http://isp-control.net
#

ROOT_APACHE_CONF=$(ROOT_CONF)/apache2
REMOTE_FOLDER=../../common/apache
LOCAL_FOLDER=.

export

install:

	$(SYSTEM_MAKE_DIRS) $(SYSTEM_CONF)/apache
	$(SYSTEM_MAKE_DIRS) $(ROOT_APACHE_CONF)
	$(SYSTEM_MAKE_DIRS) $(ROOT_APACHE_CONF)/sites-available
	$(SYSTEM_MAKE_DIRS) $(ROOT_APACHE_CONF)/mods-available
	$(SYSTEM_MAKE_DIRS) $(ROOT_APACHE_CONF)/ispcp

	cp $(REMOTE_FOLDER)/httpd.conf $(SYSTEM_CONF)/apache
	cp $(REMOTE_FOLDER)/00_master.conf $(SYSTEM_CONF)/apache
	cp $(REMOTE_FOLDER)/01_awstats.conf $(SYSTEM_CONF)/apache

	cp -R $(REMOTE_FOLDER)/backup $(SYSTEM_CONF)/apache
	cp -R $(REMOTE_FOLDER)/parts $(SYSTEM_CONF)/apache
	cp -R $(REMOTE_FOLDER)/working $(SYSTEM_CONF)/apache

	cp $(REMOTE_FOLDER)/httpd.conf $(SYSTEM_CONF)/apache/parts/ispcp_base.tpl
	
	cp $(REMOTE_FOLDER)/fastcgi_ispcp.conf $(SYSTEM_CONF)/apache/fastcgi_ispcp.conf
	cp $(LOCAL_FOLDER)/fcgid_ispcp.conf $(SYSTEM_CONF)/apache/fcgid_ispcp.conf

uninstall:

	rm -rf $(SYSTEM_CONF)/apache
