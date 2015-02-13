#!/bin/bash

echo "Starting setup..."

/usr/sbin/openvas-mkcert -q
ldconfig
/usr/sbin/openvassd
/usr/sbin/openvas-nvt-sync
/usr/sbin/openvas-scapdata-sync
/usr/sbin/openvas-certdata-sync
/usr/sbin/openvas-mkcert-client -n -i
/usr/sbin/openvasmd --rebuild
/usr/sbin/openvasmd --create-user=admin --role=Admin
/usr/sbin/openvasmd --user=admin --new-password=openvas

# At this point, usually openvassd locks up so lets kill it
kill -9 $(pidof openvassd)

echo "Finished setup..."
