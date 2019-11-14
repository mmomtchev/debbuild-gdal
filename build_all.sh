#!/bin/bash

OUT=`pwd`/out

mkdir -p ${OUT}
for DEB in stretch; do
	[ -x ${OUT}/${DEB} ] && rm -rf ${OUT}/${DEB}
	mkdir -p ${OUT}/${DEB}
	for PKG in proj6 libgeotiff5 ogdi4 gdal3; do
		bash build.sh $PKG $DEB
	done
done
