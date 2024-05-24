FROM debian:bookworm-slim

RUN apt-get update \
    && apt-get install -q -y --no-install-recommends \
        apt-transport-https ca-certificates curl tar \
        libxml2 openssl \
        build-essential libxslt1-dev libvorbis-dev libssl-dev libcurl4-openssl-dev

RUN mkdir -p /tmp/icecast_build \
    && cd /tmp/icecast_build \
    && curl -fsSL https://github.com/karlheyes/icecast-kh/archive/refs/tags/icecast-2.4.0-kh22.tar.gz -o icecast.tar.gz \
    && tar -xvzf icecast.tar.gz --strip-components=1 \
    && ./configure \
    && make \
    && make install \
    && cd /tmp \
    && rm -rf /tmp/icecast_build

COPY ./web /usr/local/share/icecast/web
