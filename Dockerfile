# AUTHOR:         João Ribeiro <jonnybgod@gmail.com>
# DESCRIPTION:    jonnybgod/packetbeat

FROM phusion/baseimage:latest
MAINTAINER João Ribeiro <jonnybgod@gmail.com>

ENV VERSION=1.1.2 PLATFORM=x86_64
ENV FILENAME=packetbeat-${VERSION}-${PLATFORM}.tar.gz 

RUN apt-get update \
 && apt-get install -y --no-install-recommends libpcap0.8 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -L -O https://download.elastic.co/beats/packetbeat/${FILENAME} \
 && tar xzvf ${FILENAME}

# RUN mkdir -p /usr/share/GeoIP \
#  && cd /usr/share/GeoIP/ \
#  && curl -S -L -O http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz \
#  && gzip -d GeoLiteCity.dat.gz \
#  && rm -f GeoLiteCity.dat.gz

ADD packetbeat.yml /etc/packetbeat/packetbeat.yml

WORKDIR packetbeat-${VERSION}-${PLATFORM}

CMD ["./packetbeat", "-e", "-c=/etc/packetbeat/packetbeat.yml"]