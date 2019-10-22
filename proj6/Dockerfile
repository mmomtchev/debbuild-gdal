FROM sublimino/debian-build-essential

ENV DEBNAME proj
# Uncomment to use the official Debian experimental repo
#ENV DEBUPSTREAM "https://salsa.debian.org/debian-gis-team/proj.git"
ENV DEBUPSTREAM "https://git.meteo.guru/proj.git"

RUN \
	DEBIAN_FRONTEND=noninteractive \
		apt-get update && apt-get install -y --no-install-recommends \
			git \
			ca-certificates \
			debhelper \
			dh-autoreconf \
			libsqlite3-dev \
			pkg-config \
			pkg-kde-tools \
			sharutils \
			sqlite3 \
			xz-utils
#RUN groupadd -g 1000 mmom
#RUN useradd -u 1000 -g 1000 mmom
#USER mmom
#COPY ${DEBNAME} /${DEBNAME}

ENTRYPOINT \
	rm -rf /${DEBNAME} && \
	git clone ${DEBUPSTREAM} && \
	tar -C / -zcvf ${DEBNAME}_`head -1 ${DEBNAME}/debian/changelog | cut -f 2 -d "(" | cut -f 1 -d "-"`.orig.tar.gz ${DEBNAME} && \
	cd /${DEBNAME} ; dpkg-buildpackage -us -uc && \
	mkdir -p /out ; cp /*.deb /out
