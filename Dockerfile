FROM ubuntu:xenial

RUN apt-get update && apt-get install -y vim curl
RUN curl -L -o /opt/urclient.sh "https://hndl.urbackup.org/Client/2.0.33/UrBackup%20Client%20Linux%202.0.33.sh"

COPY files/start.sh /opt/start.sh
RUN chmod 755 /opt/start.sh

