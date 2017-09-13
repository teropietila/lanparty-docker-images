# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

	config.vm.box = "bento/centos-7"
	config.vm.provider "virtualbox" do |virtualbox|
		virtualbox.memory = 512
		virtualbox.cpus = 1
	end
	
	config.ssh.insert_key = false
	config.vm.box_check_update = false

	config.vm.define "lanparty" do |host|
		host.vm.synced_folder ".", "/vagrant", disabled: true
		host.vm.synced_folder "docker", "/docker", type: "rsync"
		
		host.vm.network "private_network", ip: "10.0.0.5"
		host.vm.network "forwarded_port", guest: 64738, host: 64738
		host.vm.network "forwarded_port", guest: 411, host: 411 
		host.vm.network "forwarded_port", guest: 53696, host: 53696
		
		host.vm.provision "shell", path: "provision/docker-engine.sh", args: "docker-ce-17.06.0.ce-1.el7.centos.x86_64"
		host.vm.provision "shell", path: "provision/docker-compose.sh", args: "1.15.0"
	end
end
