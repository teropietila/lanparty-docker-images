#!/bin/bash
/opt/murmur/murmur.x86 -fg -supw "${ADMIN_PASS:-foobar}"
/opt/murmur/murmur.x86 -fg -ini /etc/murmur.ini
