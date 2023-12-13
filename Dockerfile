FROM ubuntu:jammy

RUN apt-get update \
    && apt-get install -q -y --no-install-recommends \
        apt-transport-https ca-certificates curl tar \
        libxml2 openssl

RUN apt-get install -q -y --no-install-recommends build-essential  libxslt1-dev libvorbis-dev libssl-dev libcurl4-openssl-dev \
    && mkdir -p /tmp/icecast_build \
    && cd /tmp/icecast_build \
    && curl -fsSL https://github.com/karlheyes/icecast-kh/archive/refs/tags/icecast-2.4.0-kh22.tar.gz -o icecast.tar.gz \
    && tar -xvzf icecast.tar.gz --strip-components=1 \
    && ./configure \
    && make \
    && make install \
    && apt-get remove --purge -y build-essential libxslt1-dev libvorbis-dev libssl-dev libcurl4-openssl-dev \
    && cd /tmp \
    && rm -rf /tmp/icecast_build

COPY ./web /usr/local/share/icecast/web
