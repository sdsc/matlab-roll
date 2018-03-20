PACKAGE     = matlab

NAME        = sdsc-matlab-license-files
RELEASE     = 2
PKGROOT     = /opt/matlab/$(VERSION)/licenses

VERSION_SRC = $(REDHAT.ROOT)/src/$(PACKAGE)/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)

RPM.EXTRAS  = AutoReq:No\nAutoProv:No
RPM.PREFIX  = $(PKGROOT)
