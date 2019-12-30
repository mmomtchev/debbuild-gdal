ARG DISTNAME=debian
ARG DEBVERSION=buster
FROM $DISTNAME:$DEBVERSION

ARG DISTNAME=debian
ARG DEBVERSION=buster
ENV DEBVERSION $DEBVERSION
ENV DEBUPSTREAM "https://git.meteo.guru/gdal.git -b debbuild/3.0"

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
		gpg gpg-agent dirmngr curl && \ 
	mkdir -p /usr/share/man/man1 && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y default-jre-headless

RUN \
	DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
		apt-transport-https \
		ca-certificates \
		debhelper \
		dh-autoreconf \
		dh-python \
		d-shlibs \
		default-jdk-headless \
		doxygen \
		graphviz \
		ant \
		chrpath \
		libarmadillo-dev \
		libcfitsio-dev \
		libcharls-dev \
		libcurl4-gnutls-dev \
		libdap-dev \
		libepsilon-dev \
		libexpat1-dev \
		libfreexl-dev \
		libfyba-dev \
		libgeos-dev \
		libgif-dev \
		libhdf4-alt-dev \
		libjpeg-dev \
		libjson-c-dev \
		libkml-dev \
		liblzma-dev \
		libmodern-perl-perl \
		default-libmysqlclient-dev \
		libnetcdf-dev \
		libopenjp2-7-dev \
		libpng-dev \
		libpoppler-private-dev \
		libpq-dev \
		libqhull-dev \
		libsqlite3-dev \
		libtiff-dev \
		liburiparser-dev \
		libwebp-dev \
		libxerces-c-dev \
		libxml2-dev \
		libzstd-dev \
		libssl-dev \
		lsb-release \
		netcdf-bin \
		patch \
		python3-all-dev \
		python3-numpy \
		swig \
		unixodbc-dev \
		zlib1g-dev \
		libpcre3-dev \
		libspatialite-dev \
		texlive \
		ghostscript \
		python3-pip \
		pkg-config

RUN	if [ "$DEBVERSION" = "buster" -o "$DEBVERSION" = "disco" -o "$DEBVERSION" = "eoan" ]; then \
		DEBIAN_FRONTEND=noninteractive apt-get install -y \
			libdoxygen-filter-perl \
			python3-distutils; \
	fi

RUN	if [ "$DEBVERSION" = "stretch" ]; then \
		DEBIAN_FRONTEND=noninteractive apt-get install -y \
			python3-distutils-extra; \
	fi

RUN	pip3 install -U Sphinx sphinx_rtd_theme breathe

ENTRYPOINT \
	echo "deb https://deb.meteo.guru/debian ${DEBVERSION} main" > /etc/apt/sources.list.d/meteo.guru.list && \
	curl https://deb.meteo.guru/velivole-keyring.asc | apt-key add - && \
	DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y velivole-keyring && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y \
		libproj-dev \
		libgeotiff-dev \
		libogdi-dev && \
	rm -rf /gdal && \
	git clone ${DEBUPSTREAM} && \
	export GDALVERSION=`head -1 /gdal/gdal/debian/changelog | cut -f 2 -d "(" | cut -f 1 -d "-"` && \
	tar -C /gdal -zcvf /gdal/gdal_${GDALVERSION}.orig.tar.gz gdal && \
	cd /gdal/gdal && \
	export PATH=~/.local/bin:${PATH} && \
	DEBFULLNAME="Momtchil Momtchev" DEBEMAIL=momtchil@momtchev.com dch -D ${DEBVERSION} -l "~${DEBVERSION}" "build for ${DEBVERSION}" && \
	dpkg-buildpackage -d -us -uc && \
	rm -rf /out/* && \
	mkdir -p /out && \
	cp /gdal/*.deb /out
