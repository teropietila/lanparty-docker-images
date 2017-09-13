# LanParty server #

This projects intention is to simplify the installation of service in LAN parties organized by Bairakyn ry members.
With this project, the person responsible for organizing the event, can configure the main server more easily
without every organizer needing to do the same installation setups every time.

## Services ##

### Murmur (Mumble server) ###

[VoiP service](https://wiki.mumble.info/wiki/Main_Page) for gamers to use in local area network when communicating with party members is required.

### OpenDCHub ###

[Server for OpenDC++ clients](http://opendchub.sourceforge.net/) to use when sharing files among gamers is required.

## Requirements ##

### Hardware ###

Any relatively new hardware will suffice when running the services in this project. The Virtualbox instance in this project
is restricted to single CPU and 512MB RAM.

### Software ###

The main server is required to have installed
  * [Virtualbox, 5.1.26 or later](https://www.virtualbox.org)
  * [Vagrant, 1.9.7 or later](https://www.vagrantup.com/)
  * SSH client (OpenSSH, [Putty for Windows](http://www.putty.org/))

Vagrant is a tool for building and managing virtual machine environments and it supports multiple backends. One of these
backends is Virtualbox, a virtualization software. All of them should run in Windows, Linux or Mac OS X. There are, as always, some gotchas
when working on these environments but some decent googling should provide support for your problems. Logging inside the guest machine requires
the SSH client.

## Installation ##

### OS ###

Install an operating system to the server, a recently new Windows, Linux or Mac OS X should suffice. Instructions on doing so is beyond this project

### Vagrant / VirtualBox / SSH Client ###

After installing the OS, install the Vagrant, Virtualbox and SSH client.

Some places to start and learn from with different operating systems:
  * [Windows](https://www.sitepoint.com/getting-started-vagrant-windows/) (referenced Sep 13th, 2017)
  * [Linux (Ubuntu)](https://www.olindata.com/en/blog/2014/07/installing-vagrant-and-virtual-box-ubuntu-1404-lts) (referenced Sep 13th, 2017)
  * [Mac OS X](https://gist.github.com/tomysmile/0618f1aa16341706940ed36b423b431c) (referenced Sep 13th, 2017)

### Firewall ###

Make sure the physical servers firewall will allow TCP connections to the following ports:
  * 411 (OpenDCHub client connetions)
  * 53696 (OpenDCHub admin telnet connections)
  * 64738 (Mumble client connections)

### Firing up the services ###

Run `vagrant up`.

A guest machine will be created and provisioned with scripts from the provision/ folder. They install Docker Community Edition (CE) and
docker-compose and start the Docker as single host daemon (non-swarm-mode). The containers inside the guest machine are built and run
at startup.

## Configuration

### Setting the administrator password ###

The `vagrant up` command reads hosts environment variable named `ADMIN_PASS` and passes it to the guest machine. The guest
machine passes it to the Docker containers. This variable is used as password when setting the SuperUser account in Mumble and admin
account in OpenDCHub. If the environment variable is empty or not given, a password `foobar` will be used.

The environment variable retains inside the guest machine so resetting the password requires you to run
```
vagrant destroy
ADMIN_PASS=myVerySecretPassword
vagrant up
```

### Murmur (Mumble server) ###

Connect with the username `SuperUser` and supply the `ADMIN_PASS` you defined earlier. You can now administer the server via the
Mumble client (adding channels, setting ACLs, etc). How you wish to setup the service is up to you, [some instructions](https://wiki.mumble.info/wiki/Main_Page) may be helpful.

Lastly, connect to the server with your regular username, accept the self-signed certificate and click Self -> Register. Instruct the
other gamers to do the same thing.

One way of administering the server is registering as regular user and giving admin permission to that user while logged in as SuperUser.

### Open DC Hub ###

Configuring the hub is supposed to be done via telnet connection. Run `telnet 10.0.0.1 53696` where the ipv4 address
is the actual address of your physical server. Log in by giving the command (with the extra $ and | characters) and the `ADMIN_PASS`
you defined earlier: `$adminpass myVerySecretPassword|`

You can then set the Message Of The Day or other options with the following commands:
```
$set motd Message of the day|
$set key value|
$commands|
$exit|
```
