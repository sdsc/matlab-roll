NAME	= sdsc-matlab-roll-test
PKGROOT = /root/rolltests
PACKAGE = matlab
VERSION	= 2
RELEASE = 0
RPM.EXTRAS = AutoReq:No 

VERSION_SRC = $(REDHAT.ROOT)/src/$(PACKAGE)/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)
