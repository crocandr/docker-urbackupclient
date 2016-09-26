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

urbackupclientbackend --config /opt/urclient/config --no-consoletime
