# LanParty server administration #

## Requirements ##

### Hardware ###

Any relatively new hardware will suffice when running the services in this project.

### Software ###

The main LanParty server is required to be installed with...
  * Docker Community edition (Docker CE), version 17.06 or later
    * [Docker for Windows](https://docs.docker.com/docker-for-windows/)
	* [Docker for Linux (CentOs)](https://docs.docker.com/engine/installation/linux/docker-ce/centos/)
	* [Docker for Mac](https://docs.docker.com/docker-for-mac/)
  * [docker-compose](https://docs.docker.com/compose/install/), version 1.15.0 or later
    * Please note that docker-compose is already included in the "Docker for Windows" and "Docker for Mac" instructions

### Firewall ###

Make sure the LanParty servers firewall will allow TCP connections to the following ports:
  * 411 (OpenDCHub client connetions)
  * 53696 (OpenDCHub admin telnet connections)
  * 64738 (Mumble client connections)

## Firing up the service stack ##

You can copy the docker/docker-compose.yml file to any locations you wish in the LanParty server. Or you can run it from this projects cloned folder.
Change the current workdir to folder you chose and simply run `docker-compose up`.

This downloads (and caches) the images from Docker Hub, sets up network and volumes for the containers and launches the services in foreground. You can
observe the service logs in this mode. By pressing Ctrl-C the service stack is shut down. Should you wish to run the services in background mode,
use `docker-compose up -d` and shut down the service stack by `docker-compose down`

## Configuration ##

### Setting the administrator password ###

Each service is deployed with default master password `foobar`. Should you wish to change this password, you need to launch the stack with
environment variable `ADMIN_PASS`. For example, starting the stack with command `ADMIN_PASS=myVerySecretPassword docker-compose run -d`. The default
master password is changed every time the stack is launched.

How you can set one-off environment variables in your chosen OS, is beyond the scope for this tutorial.

### Murmur (Mumble server) ###

Use your Mumble client and connect with the username `SuperUser` and supply the `ADMIN_PASS` you defined earlier. You can now administer the server
(adding channels, setting ACLs, etc). How you wish to setup the service is up to you, [some instructions](https://wiki.mumble.info/wiki/Main_Page) may be helpful.

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

### Resetting the service stack ###

By default, the services retain their data in Docker volumes, so relaunching the service stack does not lose previous configuration (except the default master password).
Should you wish to do a clean start for some reason, run the following commands:
```sh
$ docker-compose down
$ docker system prune
$ ADMIN_PASS=myVerySecretPassword docker-compose up -d
```

