#
# $Id$
#
# @Copyright@
# 
# 				Rocks(r)
# 		         www.rocksclusters.org
# 		       version 6.1.1 (Sand Boa)
# 
# Copyright (c) 2000 - 2014 The Regents of the University of California.
# All rights reserved.	
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
# 
# 1. Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
# 
# 2. Redistributions in binary form must reproduce the above copyright
# notice unmodified and in its entirety, this list of conditions and the
# following disclaimer in the documentation and/or other materials provided 
# with the distribution.
# 
# 3. All advertising and press materials, printed or electronic, mentioning
# features or use of this software must display the following acknowledgement: 
# 
# 	"This product includes software developed by the Rocks(r)
# 	Cluster Group at the San Diego Supercomputer Center at the
# 	University of California, San Diego and its contributors."
# 
# 4. Except as permitted for the purposes of acknowledgment in paragraph 3,
# neither the name or logo of this software nor the names of its
# authors may be used to endorse or promote products derived from this
# software without specific prior written permission.  The name of the
# software includes the following terms, and any derivatives thereof:
# "Rocks", "Rocks Clusters", and "Avalanche Installer".  For licensing of 
# the associated name, interested parties should contact Technology 
# Transfer & Intellectual Property Services, University of California, 
# San Diego, 9500 Gilman Drive, Mail Code 0910, La Jolla, CA 92093-0910, 
# Ph: (858) 534-5815, FAX: (858) 534-7345, E-MAIL:invent@ucsd.edu
# 
# THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS''
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
# IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# 
# @Copyright@
#
# $Log$
#
#
REDHAT.ROOT = $(CURDIR)/../../
NODE_FILE = $(REDHAT.ROOT)/nodes/matlab-common.xml
MANIFEST_DIR = $(REDHAT.ROOT)
TEMP_DIRS = $(REDHAT.ROOT)/src/matlab

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk
include $(SDSCDEVEL)/Pull.mk
include $(SDSCDEVEL)/Rules.mk


$(NAME).spec: DESCRIPTION

BUILDIT = 1

DESCRIPTION:
	( \
	  $(DESCRIBE_PKG) \
	) > $@

PACKAGES=18

FIK := $(shell cat fik.txt)



ifneq ("$(BUILDIT)", "$(subst 1,,$(BUILDIT))")
build: $(SRC_DIRS) build-matlab
	@echo "::: Package $(NAME) build complete :::"
else
build: 
endif

build-matlab:
	  cp installer_input $(SOURCE_DIR)
	  mkdir -p $(TEMP_DIRS)/build-matlab
	  perl -pi -e "s!ROLLINSTALL!$(TEMP_DIRS)/build-matlab!" $(SOURCE_DIR)/installer_input
	  perl -pi -e "s!FIK!$(FIK)!" $(SOURCE_DIR)/installer_input
	  perl -pi -e "s!ROLLPATH!$(REDHAT.ROOT)/src/matlab-license-files!" $(SOURCE_DIR)/installer_input
	  cp $(MANIFEST_DIR)/manifest.in $(MANIFEST_DIR)/manifest
	  ( \
	     export -n DISPLAY=; \
	     cd $(SOURCE_DIR); \
	     ./install   -inputFile installer_input ; \
             rm -rf $(TEMP_DIRS)/build-matlab/licenses; \
             packageCount=1; \
             mkdir  -p $(TEMP_DIRS)/build-matlab_$${packageCount}; \
             echo build-matlab_$${packageCount} >> $(MANIFEST_DIR)/manifest; \
             cd  $(TEMP_DIRS)/build-matlab; \
             find . ! -type d -exec ls -l {} \; >$(TEMP_DIRS)/$$$$.tmp; \
             find . \( -name .\* -a ! -type d \) -exec ls -l {} \; >>$(TEMP_DIRS)/$$$$.tmp; \
             sum=0; \
             total=`du -b -s|awk '{print $$1}'`; \
             maxPackageSize=$$(( $$total / ( $(PACKAGES) -1 ) )); \
             echo "MAX SIZE=$$maxPackageSize"; \
             exec <$(TEMP_DIRS)/$$$$.tmp; \
             cat /dev/null > $(TEMP_DIRS)/.files; \
             while read line; do \
                 fileSize=`echo $$line |awk '{print $$5}'`; \
                 fileName=`echo $$line |awk '{print $$9}'`; \
                 sum=$$(( $$sum + $$fileSize )); \
                 if test $$sum -ge $$maxPackageSize; then \
                    sum=$$(( $$sum - $$fileSize )); \
                    echo "NEW PACKAGE: OLD SUM $$sum"; \
                    tar cvf $(TEMP_DIRS)/package.tar `cat $(TEMP_DIRS)/.files`; \
                    cd $(TEMP_DIRS)/build-matlab_$$packageCount; \
                    tar xvf $(TEMP_DIRS)/package.tar; \
                    cd $(TEMP_DIRS)/build-matlab; \
                    sum=$$fileSize; \
                    packageCount=$$(( $$packageCount + 1 )); \
                    mkdir  -p $(TEMP_DIRS)/build-matlab_$$packageCount; \
                    cat /dev/null > $(TEMP_DIRS)/.files; \
                 fi; \
                 echo $$fileName >> $(TEMP_DIRS)/.files; \
             done; \
             tar cvf $(TEMP_DIRS)/package.tar `cat $(TEMP_DIRS)/.files`; \
             cd $(TEMP_DIRS)/build-matlab_$$packageCount; \
             tar xvf $(TEMP_DIRS)/package.tar; \
             cd $(TEMP_DIRS)/build-matlab; \
             mkdir -p $(TEMP_DIRS)/build-matlab_$$packageCount/appdata/products; \
             mkdir -p $(TEMP_DIRS)/build-matlab_$$packageCount/appdata/components; \
             cp -r -d appdata/products/* $(TEMP_DIRS)/build-matlab_$$packageCount/appdata/products; \
             cp -r -d appdata/components/* $(TEMP_DIRS)/build-matlab_$$packageCount/appdata/components; \
             rm -f $(TEMP_DIRS)/$$$$.tmp; \
             rm -f $(TEMP_DIRS)/.files; \
             rm -f $(TEMP_DIRS)/package.tar \
             rm -f $(ROOT)/$(PKGROOT)/licenses/* \
          )

install::
	mkdir  -p -m 755 $(ROOT)/$(PKGROOT)
	( \
          if test -f $(SOURCE_PKG); then \
              mv $(SOURCE_PKG) .. ; \
          fi; \
          if test $(BUILDIT) -eq 1; then \
            for PACKAGE in `seq 1 $(PACKAGES)`; do \
                   perl -pi -e "print and s/$(NAME)_PACKAGE/$(NAME)_$${PACKAGE}/ if m/$(NAME)_PACKAGE/" $(NODE_FILE); \
                   make NAME=sdsc-matlab_$${PACKAGE} BUILDIT=0 matlabdir=build-matlab_$${PACKAGE} rpm; \
            done; \
            perl -pi -e '$$_ = "" if m/sdsc-matlab_PACKAGE/' $(NODE_FILE); \
          else \
             cd  $(TEMP_DIRS)/$(matlabdir); \
             cp -r * -d $(ROOT)/$(PKGROOT); \
          fi;  \
          if test -f ../$(SOURCE_PKG); then \
             mv ../$(SOURCE_PKG) . ; \
          fi \
        ) 
	@echo "::: Package $(NAME) install complete :::"


clean::
	rm -rf $(SOURCE_DIR) *.tmp DESCRIPTION build-*
