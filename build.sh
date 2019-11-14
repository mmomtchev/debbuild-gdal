#!/bin/bash

OUT=`pwd`/out

PKG=$1
DEB=$2

if [ -z "$PKG" -o -z "$DEB" ]; then
	echo "build.sh <pkg> <debian release>"
	exit 1
fi

[ -x ${OUT}/${DEB} ] && rm -rf ${OUT}/${DEB}
mkdir -p ${OUT}/${DEB}
echo -- "BUILDING $PKG"
docker build -t debbuild-${PKG}:${DEB} --build-arg DEBVERSION=$DEB ${PKG} && \
docker run -v ${OUT}/${DEB}:/out debbuild-${PKG}:${DEB} || exit 2
echo -- "--------------- DONE"
scp ${OUT}/${DEB}/*deb deprepo@deb.meteo.guru:www/debian/incoming
ssh debrepo@deb.meteo.guru "cd www/debian && reprepro includedeb ${DEB} incoming/*${DEB}*deb"
