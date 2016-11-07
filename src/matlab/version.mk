NAME               = sdsc-matlab
VERSION            = 2016b
RELEASE            = 0
RPM.EXTRAS         = "Autoprov: 0"
RPM.EXTRAS         = AutoReq:No
PKGROOT            = /opt/matlab/$(VERSION)

SRC_SUBDIR         = matlab

SOURCE_VERSION     = 2016B
SOURCE_SUFFIX      = zip
SOURCE_PKG         = Linux_R$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)


ZIP_PKGS        = $(SOURCE_PKG)
RPM.EXTRAS     = AutoReq:No
