PREFIX=/usr

ALL: install

INSTALL = /usr/bin/install -c -m 0755
INSTALLDATA = /usr/bin/install -c -m 0644

install: captcp.py
	test -d $(PREFIX) || mkdir -p $(PREFIX)
	test -d $(PREFIX)/bin || mkdir -p $(PREFIX)/bin
	test -d $(PREFIX)/share || mkdir -p $(PREFIX)/share
	test -d $(PREFIX)/share/captcp || mkdir -p $(PREFIX)/share/captcp
	test -d $(PREFIX)/share/captcp/data || mkdir -p $(PREFIX)/share/captcp/data
	test -d $(PREFIX)/share/captcp/data/stap-scripts || mkdir -p $(PREFIX)/share/captcp/data/stap-scripts
	test -d $(PREFIX)/share/captcp/data/templates || mkdir -p $(PREFIX)/share/captcp/data/templates

	$(INSTALL) -m 0755 captcp.py $(PREFIX)/share/captcp
	$(INSTALLDATA) data/stap-scripts/* $(PREFIX)/share/captcp/data/stap-scripts
	$(INSTALLDATA) data/templates/* $(PREFIX)/share/captcp/data/templates

	rm -f $(PREFIX)/bin/captcp
	ln -s $(PREFIX)/share/captcp/captcp.py $(PREFIX)/bin/captcp

uninstall:
	rm -rf $(PREFIX)/share/captcp
	rm -rf $(PREFIX)/bin/captcp

.PHONY: install uninstall