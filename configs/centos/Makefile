#!/usr/bin/make -f

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
#
# The Original Code is "The Original Code is "ispCP - ISP Control Panel".
#
# The Initial Developer of the Original Code is the ispCP Team.
# Portions created by the ispCP Team are Copyright (C) 2006-2011 by
# isp Control Panel. All Rights Reserved.
#
# The ispCP ω Home Page is:
#
#    http://isp-control.net
#

# Global folders
LOCAL_FOLDER=.
REMOTE_FOLDER=../common

# Configuration specific folders
ROOT_APACHE_CONF=$(ROOT_CONF)/apache2
ROOT_COURIER_CONF=$(ROOT_CONF)/courier
ROOT_POSTFIX_CONF=$(ROOT_CONF)/postfix

export

install:
ifneq($(HOST_OS),centos)
	$(error Makefile is invalid for OS $(HOST_OS))
endif

	# prepare ispcp.conf file
	cp $(LOCAL_FOLDER)/ispcp.conf $(SYSTEM_CONF)

	# Prepare apache configuration files
	$(SYSTEM_MAKE_DIRS) $(SYSTEM_CONF)/apache
	$(SYSTEM_MAKE_DIRS) $(ROOT_APACHE_CONF)
	$(SYSTEM_MAKE_DIRS) $(ROOT_APACHE_CONF)/sites-available
	$(SYSTEM_MAKE_DIRS) $(ROOT_APACHE_CONF)/mods-available
	$(SYSTEM_MAKE_DIRS) $(ROOT_APACHE_CONF)/ispcp

	cp $(REMOTE_FOLDER)/apache/httpd.conf $(SYSTEM_CONF)/apache
	cp $(REMOTE_FOLDER)/apache/00_master.conf $(SYSTEM_CONF)/apache
	cp $(REMOTE_FOLDER)/apache/01_awstats.conf $(SYSTEM_CONF)/apache

	cp -R $(REMOTE_FOLDER)/apache/backup $(SYSTEM_CONF)/apache
	cp -R $(REMOTE_FOLDER)/apache/parts $(SYSTEM_CONF)/apache
	cp -R $(REMOTE_FOLDER)/apache/working $(SYSTEM_CONF)/apache

	cp $(REMOTE_FOLDER)/apache/httpd.conf $(SYSTEM_CONF)/apache/parts/ispcp_base.tpl

	cp $(REMOTE_FOLDER)/apache/fastcgi_ispcp.conf $(SYSTEM_CONF)/apache/fastcgi_ispcp.conf
	cp $(LOCAL_FOLDER)/apache/fcgid_ispcp.conf $(SYSTEM_CONF)/apache/fcgid_ispcp.conf

	# Prepare awstats configuration files
	$(SYSTEM_MAKE_DIRS) $(SYSTEM_CONF)/awstats

	cp $(REMOTE_FOLDER)/awstats/awstats.ispcp_tpl.conf $(SYSTEM_CONF)/awstats

	# Prepare bind configuration files
	$(SYSTEM_MAKE_DIRS) $(SYSTEM_CONF)/bind

	cp $(REMOTE_FOLDER)/bind/named.conf $(SYSTEM_CONF)/bind

	cp -R $(REMOTE_FOLDER)/bind/backup $(SYSTEM_CONF)/bind
	cp -R $(REMOTE_FOLDER)/bind/parts $(SYSTEM_CONF)/bind
	cp -R $(REMOTE_FOLDER)/bind/working $(SYSTEM_CONF)/bind

	# Prepare courier configuration files
	$(SYSTEM_MAKE_DIRS) $(SYSTEM_CONF)/courier
	$(SYSTEM_MAKE_DIRS) $(ROOT_COURIER_CONF)

	cp $(REMOTE_FOLDER)/courier/userdb $(SYSTEM_CONF)/courier

	cp -R $(REMOTE_FOLDER)/courier/backup $(SYSTEM_CONF)/courier
	cp -R $(REMOTE_FOLDER)/courier/working $(SYSTEM_CONF)/courier

	# Prepare cron.d configurations files
	$(SYSTEM_MAKE_DIRS) $(SYSTEM_CONF)/cron.d

	cp $(REMOTE_FOLDER)/cron.d/ispcp $(SYSTEM_CONF)/cron.d

	cp -R $(REMOTE_FOLDER)/cron.d/backup $(SYSTEM_CONF)/cron.d
	cp -R $(REMOTE_FOLDER)/cron.d/parts $(SYSTEM_CONF)/cron.d
	cp -R $(REMOTE_FOLDER)/cron.d/working $(SYSTEM_CONF)/cron.d

	# Prepare fcgi configuration files
	$(SYSTEM_MAKE_DIRS) $(SYSTEM_CONF)/fcgi

	cp -R $(REMOTE_FOLDER)/fcgi/backup $(SYSTEM_CONF)/fcgi
	cp -R $(REMOTE_FOLDER)/fcgi/parts $(SYSTEM_CONF)/fcgi
	cp -R $(REMOTE_FOLDER)/fcgi/working $(SYSTEM_CONF)/fcgi

	# Prepare init.d configuration files
	$(SYSTEM_MAKE_DIRS) $(ROOT_CONF)/init.d
	$(SYSTEM_MAKE_DIRS) $(ROOT_CONF)/default

	cp $(LOCAL_FOLDER)/init.d/ispcp_daemon $(ROOT_CONF)/init.d
	cp $(LOCAL_FOLDER)/init.d/ispcp_network $(ROOT_CONF)/init.d

	chown root:root $(ROOT_CONF)/init.d/ispcp_network $(ROOT_CONF)/init.d/ispcp_daemon
	chmod 0755 $(ROOT_CONF)/init.d/ispcp_network $(ROOT_CONF)/init.d/ispcp_daemon

	# Prepare logrotate configuration files
	$(SYSTEM_MAKE_DIRS) $(ROOT_CONF)/logrotate.d

	cp $(LOCAL_FOLDER)/logrotate/ispcp $(ROOT_CONF)/logrotate.d

	# Prepare postfix configuration files
	$(SYSTEM_MAKE_DIRS) $(SYSTEM_CONF)/postfix
	$(SYSTEM_MAKE_DIRS) $(ROOT_POSTFIX_CONF)
	$(SYSTEM_MAKE_DIRS) $(ROOT_POSTFIX_CONF)/ispcp

	cp $(LOCAL_FOLDER)/postfix/main.cf $(SYSTEM_CONF)/postfix/main.cf
	cp $(LOCAL_FOLDER)/postfix/master.cf $(SYSTEM_CONF)/postfix/master.cf

	cp -R $(REMOTE_FOLDER)/postfix/backup $(SYSTEM_CONF)/postfix
	cp -R $(REMOTE_FOLDER)/postfix/parts $(SYSTEM_CONF)/postfix
	cp -R $(REMOTE_FOLDER)/postfix/working $(SYSTEM_CONF)/postfix
	cp -R $(REMOTE_FOLDER)/postfix/ispcp $(SYSTEM_CONF)/postfix

	# Prepare proftpd configuration files
	$(SYSTEM_MAKE_DIRS) $(SYSTEM_CONF)/proftpd

	cp -R $(REMOTE_FOLDER)/proftpd/backup $(SYSTEM_CONF)/proftpd
	cp -R $(REMOTE_FOLDER)/proftpd/parts $(SYSTEM_CONF)/proftpd
	cp -R $(REMOTE_FOLDER)/proftpd/working $(SYSTEM_CONF)/proftpd

	if test ! -d $(ROOT_CONF)/proftpd
	then
		$(SYSTEM_MAKE_DIRS) $(ROOT_CONF)/proftpd
	fi

	$(SYSTEM_MAKE_DIRS) $(ROOT_CONF)/proftpd/ispcp
	cp $(REMOTE_FOLDER)/proftpd/root_domain.conf $(ROOT_CONF)/proftpd/ispcp

	if test -e /etc/proftpd.conf
	then
		mv /etc/proftpd.conf /etc/proftpd.conf.bak
	fi

	cp $(LOCAL_FOLDER)/proftpd/proftpd.conf $(SYSTEM_CONF)/proftpd/proftpd.conf

uninstall:
ifneq($(HOST_OS),centos)
	$(error Makefile is invalid for OS $(HOST_OS))
endif

	# Remove apache configuration files
	rm -rf $(SYSTEM_CONF)/apache

	# Remove awstats configuration files
	rm -rf $(SYSTEM_CONF)/awstats

	# Remove bind configuration files
	rm -rf $(SYSTEM_CONF)/bind

	# Remove courier configuration files
	rm -rf $(SYSTEM_CONF)/courier

	# Remove cron.d configuration files
	rm -rf $(SYSTEM_CONF)/cron.d

	# Remove fcgi configuration files
	rm -rf $(SYSTEM_CONF)/fcgi

	# Remove init.d configuration files
	rm -f $(ROOT_CONF)/init.d/ispcp_daemon
	rm -f $(ROOT_CONF)/init.d/ispcp_network

	# Remove logrotate configuration files
	rm -rf $(ROOT_CONF)/logrotate.d/ispcp

	# Remove postfix configuration files
	rm -rf $(SYSTEM_CONF)/postfix
	rm -rf $(ROOT_POSTFIX_CONF)/ispcp

	# Remove proftpd configuration files
	rm -rf $(SYSTEM_CONF)/proftpd
