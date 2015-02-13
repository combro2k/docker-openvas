#!/bin/bash

echo "Starting setup..."

/opt/bin/openvas-mkcert -q
ldconfig
/opt/bin/openvassd
/opt/bin/openvas-nvt-sync
/opt/bin/openvas-scapdata-sync
/opt/bin/openvas-certdata-sync
/opt/bin/openvas-mkcert-client -n -i
/opt/bin/openvasmd --rebuild
/opt/bin/openvasmd --create-user=admin --role=Admin
/opt/bin/openvasmd --user=admin --new-password=openvas

# At this point, usually openvassd locks up so lets kill it
kill -9 $(pidof openvassd)

echo "Finished setup..."
