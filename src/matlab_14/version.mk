NAME    = matlab_14
PKGROOT = /opt/matlab/$(VERSION)
VERSION = 2014b
RELEASE = 1
RPM.EXTRAS = "Autoprov: 0"
RPM.EXTRAS = AutoReq:No
RPM.EXTRAS     = %define __strip /bin/true
