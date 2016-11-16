FROM nemd/alpine_glibc
MAINTAINER Michal <michal@reapnet.io>

ADD https://download-cdn.resilio.com/2.4.2/linux-x64/resilio-sync_x64.tar.gz /tmp/sync.tgz
RUN tar -xf /tmp/sync.tgz -C /usr/bin rslsync && rm -f /tmp/sync.tgz

COPY sync.conf /etc/
RUN mkdir -p /data/sync/config

EXPOSE 8888
EXPOSE 55555

VOLUME /data

CMD ["rslsync", "--config", "/etc/sync.conf", "--log", "/var/log/rslsync.log", "--nodaemon"]