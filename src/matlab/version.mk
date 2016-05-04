NAME               = sdsc-matlab
VERSION            = 2016a
RELEASE            = 1
RPM.EXTRAS         = "Autoprov: 0"
RPM.EXTRAS         = AutoReq:No
PKGROOT            = /opt/matlab/$(VERSION)

SRC_SUBDIR         = matlab

SOURCE_NAME        = matlab
SOURCE_VERSION     = $(VERSION)
SOURCE_SUFFIX      = tar.gz
SOURCE_PKG         = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)


PATCH_NAME        = attachment
PATCH_VERSION     = 1374124_16a_glnxa64_2016-04-18
PATCH_SUFFIX      = zip
PATCH_PKG         = $(PATCH_NAME)-$(PATCH_VERSION).$(PATCH_SUFFIX)
PATCH_DIR         = $(SOURCE_DIR)


TAR_GZ_PKGS        = $(SOURCE_PKG)
ZIP_PKGS           = $(PATCH_PKG)
RPM.EXTRAS     = AutoReq:No
