REDHAT.ROOT = $(CURDIR)/../../

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk

build:

$(VERSION_INC): $(VERSION_SRC)
	/bin/grep 'VERSION.*=' $(VERSION_SRC) > $@

install::
	mkdir -p -m 755 $(ROOT)/$(PKGROOT)
	# Adapted for multiple versions
	for V in $(VERSION) $(VERSION_ADD); do \
	  cp *.module $(ROOT)/$(PKGROOT)/$$V; \
	  cp *.version $(ROOT)/$(PKGROOT)/.version.$$V; \
	  perl -pi -e 's#COMPILERNAME#$(COMPILERNAME)#g;' \
	           -e 's#MPINAME#$(MPINAME)#g;' \
	           -e 's#ROLLCOMPILER#$(ROLLCOMPILER)#g;' \
	           -e 's#ROLLMPI#$(ROLLMPI)#g;' \
	           -e 's#ROLLPY#$(ROLLPY)#g;' \
	           -e "s#VERSION#$$V#g;" \
	    $(ROOT)/$(PKGROOT)/.version.$$V $(ROOT)/$(PKGROOT)/$$V; \
	done
	ln -s $(PKGROOT)/.version.$(VERSION) $(ROOT)/$(PKGROOT)/.version

clean::
	rm -f $(VERSION_INC)
