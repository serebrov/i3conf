#
# Global Settings
#

INSTALL = install
DESTDIR ?= /
PREFIX  ?= $(DESTDIR)/usr

PATH_I3_GNOME = $(PREFIX)/bin/i3-gnome-v
PATH_I3_GNOME_DESKTOP = $(PREFIX)/share/applications/i3-gnome-v.desktop
PATH_I3_GNOME_SESSION = $(PREFIX)/share/gnome-session/sessions/i3-gnome-v.session
PATH_I3_GNOME_XSESSION = $(PREFIX)/share/xsessions/i3-gnome-v.desktop

#
# Targets
#

all:
	@echo "Nothing to do"


install:
	$(INSTALL) -m0644 -D session/i3-gnome-v-xsession.desktop $(PATH_I3_GNOME_XSESSION)
	$(INSTALL) -m0644 -D session/i3-gnome-v.desktop $(PATH_I3_GNOME_DESKTOP)
	$(INSTALL) -m0644 -D session/i3-gnome-v.session $(PATH_I3_GNOME_SESSION)
	$(INSTALL) -m0755 -D session/i3-gnome-v $(PATH_I3_GNOME)


uninstall:
	rm -f $(PATH_I3_GNOME)
	rm -f $(PATH_I3_GNOME_DESKTOP)
	rm -f $(PATH_I3_GNOME_SESSION)
	rm -f $(PATH_I3_GNOME_XSESSION)


.PHONY: all install uninstall
