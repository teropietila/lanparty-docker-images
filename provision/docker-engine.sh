#!/bin/bash

docker_pkg="$1"

required_centos_release="centos-release-7-*"
docker_repourl="https://download.docker.com/linux/centos/docker-ce.repo"
install_log="/tmp/docker-install.log"

rpm -q centos-release | grep -q "$required_centos_release"
if [ $? -eq 1 ]; then
	$(echo "Invalid CentOS release, $required_centos_release required" 1>&2)
	exit 1;
fi

rpm -qa | grep $docker_pkg &> /dev/null

if [ $? -eq 1 ]; then
	exec > >(tee -i $install_log)
	exec 2>&1
	
	date +"%Y-%m-%d %H:%M:%S"

	yum install -y epel-release yum-utils
	yum-config-manager --add-repo "$docker_repourl"
	yum makecache fast
	yum install -y "$docker_pkg"

	systemctl enable docker
	systemctl start docker
	sleep 3
	systemctl status docker

fi

exit 0;
