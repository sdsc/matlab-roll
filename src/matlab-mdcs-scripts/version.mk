PACKAGE     = matlab
NAME        = sdsc-matlab-mdcs-scripts
PKGROOT     = /opt/matlab/$(VERSION)/toolbox/local/mdcs_files
RELEASE     = 1

VERSION_SRC = $(REDHAT.ROOT)/src/$(PACKAGE)/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)

RPM.EXTRAS  = AutoReq:No\nAutoProv:No
RPM.PREFIX   = $(PKGROOT)
