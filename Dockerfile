# Resilio Sync
#
# VERSION               0.1
#

FROM alpine:3.4
MAINTAINER Michal <michal@reapnet.io>
LABEL com.resilio.version="2.4.2"

ADD https://download-cdn.resilio.com/2.4.2/linux-x64/resilio-sync_x64.tar.gz /tmp/sync.tgz
RUN tar -xf /tmp/sync.tgz -C /usr/bin rslsync && rm -f /tmp/sync.tgz

COPY sync.conf /etc/
COPY run_sync /usr/bin/

EXPOSE 8888
EXPOSE 55555

VOLUME /mnt/sync

ENTRYPOINT ["run_sync"]
CMD ["--config", "/etc/sync.conf"]
