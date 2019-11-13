#!/bin/bash

OUT=`pwd`/out


mkdir -p ${OUT}
rm -f ${OUT}/*deb
for PKG in proj6 libgeotiff5 ogdi4 gdal3; do
	echo -- "---------------"
	echo -- "BUILDING $PKG"
	(
		mkdir -p /tmp/${PKG}.$$
		cd ${PKG} && \
		docker build -t debbuild-${PKG} . && \
		docker run -v /tmp/${PKG}.$$:/out debbuild-${PKG} && \
		mv /tmp/${PKG}.$$/*deb ${OUT}
		rm -rf /tmp/${PKG}.$$
	)
	echo -- "--------------- DONE"
done
