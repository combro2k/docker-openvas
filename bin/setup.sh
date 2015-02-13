#!/bin/bash

echo "Starting setup..."

/usr/local/sbin/openvas-mkcert -q
ldconfig
/usr/local/sbin/openvassd
/usr/local/sbin/openvas-nvt-sync
/usr/local/sbin/openvas-scapdata-sync
/usr/local/sbin/openvas-certdata-sync
/usr/local/sbin/openvas-mkcert-client -n -i
/usr/local/sbin/openvasmd --rebuild
/usr/local/sbin/openvasmd --create-user=admin --role=Admin
/usr/local/sbin/openvasmd --user=admin --new-password=openvas

# At this point, usually openvassd locks up so lets kill it
kill -9 $(pidof openvassd)

echo "Finished setup..."
