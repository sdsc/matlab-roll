NAME               = sdsc-matlab
VERSION            = 2016a
RELEASE            = 0
RPM.EXTRAS         = "Autoprov: 0"
RPM.EXTRAS         = AutoReq:No
PKGROOT            = /opt/matlab/$(VERSION)

SRC_SUBDIR         = matlab

SOURCE_NAME        = matlab
SOURCE_VERSION     = $(VERSION)
SOURCE_SUFFIX      = tar.gz
SOURCE_PKG         = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS        = $(SOURCE_PKG)
RPM.EXTRAS     = AutoReq:No
