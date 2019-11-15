ARG DISTNAME=debian
ARG DEBVERSION=buster
FROM $DISTNAME:$DEBVERSION

ARG DISTNAME=debian
ARG DEBVERSION=buster
ENV DEBNAME proj
# Uncomment to use the official Debian experimental repo
#ENV DEBUPSTREAM "https://salsa.debian.org/debian-gis-team/proj.git"
ENV DEBUPSTREAM "https://git.meteo.guru/proj.git"
ENV DEBVERSION ${DEBVERSION}

RUN \
	DEBIAN_FRONTEND=noninteractive apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
		build-essential \
		devscripts \
		nasm \
		vim-common \
		curl \
		wget \
		git

RUN \
	DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
		ca-certificates \
		debhelper \
		dh-autoreconf \
		libsqlite3-dev \
		pkg-config \
		pkg-kde-tools \
		sharutils \
		sqlite3 \
		xz-utils

ENTRYPOINT \
	rm -rf /${DEBNAME} && \
	git clone ${DEBUPSTREAM} && \
	tar -C / -zcvf ${DEBNAME}_`head -1 ${DEBNAME}/debian/changelog | cut -f 2 -d "(" | cut -f 1 -d "-"`.orig.tar.gz ${DEBNAME} && \
	cd /${DEBNAME} && \
	DEBEMAIL=momtchil@momtchev.com dch -D ${DEBVERSION} -l "~${DEBVERSION}" "build for ${DEBVERSION}" && \
	dpkg-buildpackage -us -uc && \
	mkdir -p /out && cp /*.deb /out
