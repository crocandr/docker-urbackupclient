FROM debian:9

ENV DOWNLOAD_URL https://hndl.urbackup.org/Client/2.3.4/UrBackup%20Client%20Linux%202.3.4.sh

RUN apt-get update && apt-get install -y curl
RUN curl -L -o /opt/urclient.sh "$DOWNLOAD_URL"

COPY files/start.sh /opt/start.sh
RUN chmod 755 /opt/start.sh

ENTRYPOINT /opt/start.sh
