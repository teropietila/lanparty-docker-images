# Build guide #

## Requirements ##

### Hardware ###

Any relatively new hardware will suffice when running the services in this project. The Virtualbox instance in this project
is restricted to single CPU and 512MB RAM.

### Software ###

The development/build computer is required to have installed
  * [Virtualbox, 5.1.26 or later](https://www.virtualbox.org)
  * [Vagrant, 1.9.7 or later](https://www.vagrantup.com/)
  * SSH client (OpenSSH, [Putty for Windows](http://www.putty.org/))

Vagrant is a tool for building and managing virtual machine environments and it supports multiple backends. One of these
backends is Virtualbox, a virtualization software. All of them should run in Windows, Linux or Mac OS X. There are, as always, some gotchas
when working on these environments but some decent googling should provide support for your problems. Logging inside the guest machine requires
the SSH client.

## Installation ##

### Vagrant / VirtualBox / SSH Client ###

Some places to start and learn from with different operating systems:
  * [Windows](https://www.sitepoint.com/getting-started-vagrant-windows/) (referenced Sep 13th, 2017)
  * [Linux (Ubuntu)](https://www.olindata.com/en/blog/2014/07/installing-vagrant-and-virtual-box-ubuntu-1404-lts) (referenced Sep 13th, 2017)
  * [Mac OS X](https://gist.github.com/tomysmile/0618f1aa16341706940ed36b423b431c) (referenced Sep 13th, 2017)

### Firewall ###

Make sure the development/build computers firewall will allow TCP connections to the following ports:
  * 411 (OpenDCHub client connetions)
  * 53696 (OpenDCHub admin telnet connections)
  * 64738 (Mumble client connections)

## Firing up the services ##

Run `vagrant up`.

A guest machine will be created and provisioned with scripts from the provision/ folder. They install Docker Community Edition (CE) and
docker-compose and start the Docker as single host daemon (non-swarm-mode).

## Configuration ##

Should you need to configure the services and default master password, read the [instructions for deployment](DEPLOY.md)

Each service has its own build instructions:
  * [Murmur server](mumble/README.md)
  * [Open DC Hub](opendchub/README.md)
