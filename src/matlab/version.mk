NAME               = matlab
VERSION            = 2014a
RELEASE = 0
RPM.EXTRAS         = "Autoprov: 0"
RPM.EXTRAS         = AutoReq:No
PKGROOT            = /opt/$(NAME)/$(VERSION)

SRC_SUBDIR         = matlab

SOURCE_NAME        = $(NAME)
SOURCE_VERSION     = $(VERSION)
SOURCE_SUFFIX      = tar.gz
SOURCE_PKG         = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS        = $(SOURCE_PKG)
