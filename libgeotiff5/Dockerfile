ARG DISTNAME=debian
ARG DEBVERSION=buster
FROM $DISTNAME:$DEBVERSION

ARG DISTNAME=debian
ARG DEBVERSION=buster
ENV DEBNAME libgeotiff
# Uncomment to use the official Debian experimental repo
#ENV DEBUPSTREAM "https://salsa.debian.org/debian-gis-team/libgeotiff.git"
ENV DEBUPSTREAM "https://git.meteo.guru/libgeotiff.git"
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
		git && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
		gpg gpg-agent dirmngr curl

RUN \
	DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
		apt-transport-https \
		ca-certificates \
		debhelper \
		dh-autoreconf \
		pkg-config \
		libjpeg-dev \
		libtiff-dev \
		zlib1g-dev

ENTRYPOINT \
	echo "deb https://deb.meteo.guru/debian ${DEBVERSION} main" > /etc/apt/sources.list.d/meteo.guru.list && \
	DEBIAN_FRONTEND=noninteractive curl https://deb.meteo.guru/velivole-keyring.asc | apt-key add - && \
	DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y velivole-keyring && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y libproj-dev && \
	rm -rf /${DEBNAME} && \
	git clone ${DEBUPSTREAM} && \
	tar -C / -zcvf ${DEBNAME}_`head -1 ${DEBNAME}/debian/changelog | cut -f 2 -d "(" | cut -f 1 -d "-"`.orig.tar.gz ${DEBNAME} && \
	cd /${DEBNAME} && \
	DEBEMAIL=momtchil@momtchev.com dch -D ${DEBVERSION} -l "~${DEBVERSION}" "build for ${DEBVERSION}" && \
	dpkg-buildpackage -us -uc && \
	rm -rf /out/* && \
	mkdir -p /out && \
	cp /*.deb /out
