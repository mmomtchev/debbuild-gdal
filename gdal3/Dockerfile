FROM sublimino/debian-build-essential

ENV DEBUPSTREAM "https://git.meteo.guru/gdal.git"

RUN \
	DEBIAN_FRONTEND=noninteractive \
		apt-get update && apt-get install -y --no-install-recommends gpg gpg-agent dirmngr curl
RUN \
	DEBIAN_FRONTEND=noninteractive \
		mkdir -p /usr/share/man/man1 && apt-get install -y openjdk-11-jre-headless 
RUN \
	DEBIAN_FRONTEND=noninteractive \
		apt-get install -y --no-install-recommends \
			git \
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
			libdoxygen-filter-perl \
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
			lsb-release \
			netcdf-bin \
			patch \
			python3-all-dev \
			python3-numpy \
			python3-distutils \
			swig \
			unixodbc-dev \
			zlib1g-dev \
			libpcre3-dev \
			libspatialite-dev \
			texlive \
			ghostscript \
			python3-pip \
			pkg-config

RUN			pip3 install -U Sphinx sphinx_rtd_theme breathe

ENTRYPOINT \
	echo "deb http://deb.meteo.guru/debian buster main" > /etc/apt/sources.list.d/meteo.guru.list && \
	curl http://deb.meteo.guru/velivole-keyring.asc | apt-key add - && \
	DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y velivole-keyring && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y \
		libproj-dev=6.2.0-mmom~buster1 \
		libgeotiff-dev=1.5.1-mmom1~buster \
		libogdi-dev=4.1.0+ds-mmom1~buster && \
	rm -rf /gdal && \
	git clone ${DEBUPSTREAM} && \
	export DEBVERSION=`head -1 /gdal/gdal/debian/changelog | cut -f 2 -d "(" | cut -f 1 -d "-"` && \
	tar -C /gdal -zcvf /gdal/gdal_${DEBVERSION}.orig.tar.gz gdal && \
	cd /gdal/gdal && \
	export PATH=~/.local/bin:${PATH} && \
	dpkg-buildpackage -us -uc && \
	rm -rf /out/* && \
	mkdir -p /out && \
	cp /gdal/*.deb /out
