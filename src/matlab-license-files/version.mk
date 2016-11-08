PACKAGE = matlab
NAME    = sdsc-matlab-license-files
VERSION_SRC = $(REDHAT.ROOT)/src/$(PACKAGE)/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)
PKGROOT = /opt/matlab/$(VERSION)
RELEASE = 1
RPM.EXTRAS = "Autoprov: 0"
RPM.EXTRAS         = AutoReq:No
