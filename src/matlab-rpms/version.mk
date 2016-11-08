NAME               = sdsc-matlab
VERSION            = 2016a
RELEASE            = 0
RPM.EXTRAS         = "Autoprov: 0"
RPM.EXTRAS         = AutoReq:No
VERSION_SRC = $(REDHAT.ROOT)/src/$(PACKAGE)/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)
PKGROOT            = /opt/matlab/$(VERSION)
