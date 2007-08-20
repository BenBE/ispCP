
export

DAEMON_DIR=$(SYSTEM_ROOT)/daemon

build:
	(cd ./daemon; \
	$(MAKE) ispcp_daemon; )
	touch build

install: build
	$(SYSTEM_MAKE_DIRS) $(DAEMON_DIR)
	cp ./daemon/ispcp_daemon $(DAEMON_DIR)
	cp ./ssl/ispcp-make_cert.sh /usr/sbin/

uninstall:

	(cd ./daemon; \
	$(MAKE) uninstall; )
	rm -rf $(DAEMON_DIR)
	rm -f /usr/sbin/ispcp-make_cert.sh
	rm -rf build

.PHONY: install uninstall
