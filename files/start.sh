#!/bin/bash

# uncompress urbackup client
echo y | bash /opt/urclient.sh --target /opt/urclient --noexec
cd /opt/urclient && echo y | bash install_client_linux.sh --quiet --noexec
# config
if [ ! -e /opt/urclient/config ]
then
  cp -f /opt/urclient/defaults_client /opt/urclient/config
fi

# run
ln -f -s /opt/urclient/x86_64-linux-eng/urbackupclient* /usr/local/bin/


#urbackupclientbackend --config /opt/urclient/config --no-consoletime
urbackupclientbackend --config /opt/urclient/config --no-consoletime --daemon

sleep 10

# add source dirs
for SRC_DIR in $( echo $SOURCES | sed s@\"@@g | sed s@\'@@g )
do
  [ ! -z "$SRC_DIR" ] && { echo "adding $SRC_DIR as backup source..."; urbackupclientctl add-backupdir -d $SRC_DIR; }
  sleep 3
done
# list sources
urbackupclientctl list-backupdir


tail -f /var/log/urbackupclient.log
