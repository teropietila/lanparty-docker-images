#!/bin/bash

sed -i "s/^admin_pass = .*/admin_pass = \"${ADMIN_PASS:-foobar}\"/g" /root/.opendchub/config
/usr/local/bin/opendchub -l /var/log/opendchub.log && tail -f /var/log/opendchub.log
