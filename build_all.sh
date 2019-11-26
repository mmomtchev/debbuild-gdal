#!/bin/bash

OUT=`pwd`/out

if [ -z "$1" ]; then
	echo "Example usage: build_all.sh buster debian"
	exit 1
fi

mkdir -p ${OUT}
[ ! -z "${OUT}" -a -x ${OUT}/${DEB} ] && rm -rf ${OUT}/${DEB}
mkdir -p ${OUT}/${DEB}
for PKG in proj6 libgeotiff5 ogdi4 spatialite gdal3; do
	bash build.sh $PKG $1 $2
done
