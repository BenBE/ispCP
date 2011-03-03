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
# The Original Code is "ispCP ω (OMEGA) a Virtual Hosting Control Panel".
#
# The Initial Developer of the Original Code is ispCP Team.
# Portions created by Initial Developer are Copyright (C) 2006-2011 by
# isp Control Panel. All Rights Reserved.
#
# The ispCP ω Home Page is:
#
#    http://isp-control.net
#

DAEMON = ispcp_daemon
CC := gcc
CFLAGS := -g -ansi -Wall -Wstrict-prototypes -pedantic

ifneq (,$(findstring noopt,$(DAEMON_OPTIONS)))
	CFLAGS += -O0
else
	CFLAGS += -O3
endif

OBJS := ispcp_daemon.o message.o daemon_init.o say.o signal-handlers.o\
receive_data.o send_data.o take_connection.o send_line.o recv_line.o\
helo_cmd.o helo_syntax.o lr_cmd.o lr_syntax.o bye_cmd.o bye_syntax.o

$(DAEMON): $(OBJS)
	$(CC) $(OBJS) -o $(DAEMON)
	strip -s $(DAEMON)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f *~ *.o $(DAEMON)

.PHONY: clean