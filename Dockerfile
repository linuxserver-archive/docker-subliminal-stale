FROM lsiobase/alpine
MAINTAINER sparklyballs

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# install build packages
RUN \
 apk add --no-cache --virtual=build-dependencies \
	git \
	python-dev && \

# install runtime packages
 apk add --no-cache \
	python \
	py-pip && \

# install subliminal
 pip install -U pip && \
 pip install -U subliminal && \

# cleanup
 rm -rf \
	/root/.cache && \
 apk del --purge \
	build-dependencies

VOLUME /cache
ENTRYPOINT ["subliminal", "--cache-dir", "/cache"]
CMD ["--help"]
