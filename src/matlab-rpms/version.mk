PACKAGE     = matlab

NAME        = sdsc-matlab
VERSION     = 2016a
RELEASE     = 1
PKGROOT     = /opt/matlab/$(VERSION)

VERSION_SRC = $(REDHAT.ROOT)/src/$(PACKAGE)/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)

RPM.EXTRAS  = AutoReq:No\nAutoProv:No
RPM.PREFIX  = $(PKGROOT)
