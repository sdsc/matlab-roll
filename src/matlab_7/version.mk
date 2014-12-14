NAME    = matlab_7
PKGROOT = /opt/matlab/$(VERSION)
VERSION = 2014b
RELEASE = 1
RPM.EXTRAS = "Autoprov: 0"
RPM.EXTRAS = AutoReq:No
RPM.EXTRAS = %define __os_install_post %{nil}
