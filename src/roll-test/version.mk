NAME	   = sdsc-matlab-roll-test
PKGROOT    = /root/rolltests
PACKAGE    = matlab
VERSION	   = 2
RELEASE    = 3

VERSION_SRC = $(REDHAT.ROOT)/src/$(PACKAGE)/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)

RPM.EXTRAS = AutoReq:No\nAutoProv:No
RPM.FILES  = $(PKGROOT)/matlab.t
