#!/bin/bash

if [[ ! -f "/root/.init" ]]
then
  exec /usr/local/bin/setup.sh
  touch /root/.init
else
  echo "starting..."
  # /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
fi
