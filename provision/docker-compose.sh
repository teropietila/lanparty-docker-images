#!/bin/bash
if [ -z "$1" ]; then
	echo "Missing version to install, usage ex. './docker-compose.sh 1.15.0'"
	exit 1;
fi

if [ ! -f "/usr/local/bin/docker-compose" ]; then
	dockerComposeVersion="$1"
	sudo curl -L https://github.com/docker/compose/releases/download/$dockerComposeVersion/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
fi
