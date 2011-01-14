#!/bin/bash

# ispCP ω (OMEGA) a Virtual Hosting Control Panel
# Copyright (C) 2006-2011 by ispCP | http://ispcp.net
#
# Version: $Id$
#
# The contents of this file are subject to the Mozilla Public License
# Version 1.1 (the "License"); you may not use this file except in
# compliance with the License. You may obtain a copy of the License at
# http://www.mozilla.org/MPL/
#
# Software distributed under the License is distributed on an "AS IS"
# basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
# License for the specific language governing rights and limitations
# under the License.
#
# The Original Code is "ispCP ω (OMEGA) a Virtual Hosting Control Panel".
#
# The Initial Developer of the Original Code is ispCP Team.
# Portions created by Initial Developer are Copyright (C) 2006-2011 by
# isp Control Panel. All Rights Reserved.
#
# The ispCP ω Home Page is:
#
#    http://isp-control.net
#

# Variables
CURRENTVERSION="1.0.7"
TARGETVERSION="1.0.8"
SVNLOCATION="branches"
SVNFOLDER="omega-"${TARGETVERSION}
RELEASEFOLDER="ispcp-"${SVNFOLDER}
FTPFOLDER="ispCP Omega "${TARGETVERSION}
FTPUSER="" // Insert Sourceforge Username

SVNSTRING="http://www.isp-control.net/ispcp_svn/"${SVNLOCATION}"/"${SVNFOLDER}

# Cleanup
rm -rf ispcp-omega-*

# Pull the code from svn
svn export $SVNSTRING

# Builddate
ISPCPCONF="${SVNFOLDER}\configs\debian\ispcp.conf"
CURRENTBUILDDATE=$(grep BuildDate ${ISPCPCONF} | cut -d "=" -f 2 | sed 's/ //g')
TARGETBUILDDATE=$(date -u +"%Y%m%d")

echo ${CURRENTBUILDDATE}

mv ${SVNFOLDER} ${RELEASEFOLDER}

# Release preparations
#rpl -R "Version = ${CURRENTVERSION} OMEGA" "Version = ${TARGETVERSION} OMEGA" ${RELEASEFOLDER}/configs
#rpl -R "BuildDate = ${CURRENTBUILDDATE}" "BuildDate = ${TARGETBUILDDATE}" ${RELEASEFOLDER}/*/ispcp.conf
#rpl -R "${CURRENTVERSION}" "${TARGETVERSION}" ${RELEASEFOLDER}/docs/*/INSTALL

# Create the needed Archives
tar cjf ${RELEASEFOLDER}.tar.bz2 ./${RELEASEFOLDER}
md5sum ${RELEASEFOLDER}.tar.bz2 > ${RELEASEFOLDER}.tar.bz2.sum

tar czf ${RELEASEFOLDER}.tar.gz ./${RELEASEFOLDER}
md5sum ${RELEASEFOLDER}.tar.gz > ${RELEASEFOLDER}.tar.gz.sum

zip -9r ${RELEASEFOLDER}.zip ./${RELEASEFOLDER}
md5sum ${RELEASEFOLDER}.zip > ${RELEASEFOLDER}.zip.sum

7zr a ${RELEASEFOLDER}.7z ./${RELEASEFOLDER}
md5sum ${RELEASEFOLDER}.7z > ${RELEASEFOLDER}.7z.sum

# Fill the batch file for sftp
if [ -e ./ftpbatch.sh ]; then 
	rm -rf ./ftpbatch.sh
fi

touch ./ftpbatch.sh

echo -ne "cd /home/frs/project/i/is/ispcp/ispCP\ Omega\n" >> ftpbatch.sh
echo -ne "mkdir ispCP\ Omega\ ${TARGETVERSION}\n" >> ftpbatch.sh
echo -ne "cd ispCP\ Omega\ ${TARGETVERSION}\n" >> ftpbatch.sh
echo -ne "put ${RELEASEFOLDER}.zip\n" >> ftpbatch.sh
echo -ne "put ${RELEASEFOLDER}.zip.sum\n" >> ftpbatch.sh
echo -ne "put ${RELEASEFOLDER}.7z\n" >> ftpbatch.sh
echo -ne "put ${RELEASEFOLDER}.7z.sum\n" >> ftpbatch.sh
echo -ne "put ${RELEASEFOLDER}.tar.gz\n" >> ftpbatch.sh
echo -ne "put ${RELEASEFOLDER}.tar.gz.sum\n" >> ftpbatch.sh
echo -ne "put ${RELEASEFOLDER}.tar.bz2\n" >> ftpbatch.sh
echo -ne "put ${RELEASEFOLDER}.tar.bz2.sum\n" >> ftpbatch.sh
echo -ne "quit\n" >> ftpbatch.sh

# you will be promted for a login!
sftp -o "batchmode no" -b ./ftpbatch.sh ${FTPUSER},ispcp@frs.sourceforge.net
