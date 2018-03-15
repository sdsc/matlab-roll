PACKAGE     = matlab

NAME        = sdsc-matlab-scripts
PKGROOT     = /opt/matlab/$(VERSION)/bin
RELEASE     = 1

VERSION_SRC = $(REDHAT.ROOT)/src/$(PACKAGE)/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)

RPM.EXTRAS  = AutoReq:No\nAutoProv:No
RPM.FILES   = $(PKGROOT)/*
