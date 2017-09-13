# LanParty server #

This projects intention is to simplify the installation of service in LAN parties organized by Bairakyn ry.
With this project, the person responsible for organizing the event, can configure the main server more easily
without every organizer needing to do the same installation setups every time.

## Services ##

### Murmur (Mumble server) ###

[VoiP service](https://wiki.mumble.info/wiki/Main_Page) for gamers to use in local area network when communicating with party members is required.

### OpenDCHub ###

[Server for OpenDc++ clients](http://opendchub.sourceforge.net/) to use when sharing files among gamers is required.

## Requirements ##

### Hardware ###

Any relatively new hardware will suffice running the services in this project. 

### Software ### 

#### Production ####

The main server is required to have Docker Community Edition (CE) installed and running with version >= 17.06. Also the docker-compose should be
installed with version >= 1.15.0. The Docker installation is supposed to be in non-swarm-mode or at least in single manager setup. Any other kind
of distribution of these services are untested. Lastly, (almost) any git version will suffice for cloning this project to the main server
and deploying the services.

OS provision scripts are only for Red Hat Enterprise Linux 7 (RHEL7) or its derivates (e.g. Centos 7). These are the only supported operating systems for now
but any decent sysop can provision his own server with the previously mentioned packages. And if doing so, should also contribute to this project
by commiting his provision scripts to the project

#### Development ####

For developing purposes of this project, the developers machine must have the previosly mentioned packages installed and in addition, 
the Vagrant and Virtualbox softwares with version >= 1.9.7 and >= 5.1.26 respectively. This project includes the Vagrantfile for developers
to easily use the same kind of environment.


## Deploying the Services ##

### Main Server ###

#### OS ####

Install any of the previously mentioned operating systems to the server. Instructions to do so are beyond this project.

#### Git ####

Install the before mentioned git version control software and clone the projects repository to the server. e.g.

`git clone https://url/to/the/repository.git`

#### Firewall ####

Make sure the main servers firewall will allow TCP connections to the following ports:
  * 411 (OpenDCHub client connetions)
  * 53696 (OpenDCHub admin telnet connections)
  * 64738 (Mumble client connections)

#### Docker CE ####

Install by hand the previosly mentioned Docker and docker-compose packages with correct versions, or if you installed the RHEL7/Centos7 operating system,
you can execute the scripts in provision directory with following parameters:

```bash
./provision/docker-engine.sh docker-ce-17.06.0.ce-1.el7.centos.x86_64
./provision/docker-compose.sh 1.15.0
```

You can launch the service stack with the following command:
`sudo /usr/local/bin/docker-compose up -d`

and you can bring the service stack down with:
`sudo /usr/local/bin/docker-compose down`

Environment variable ADMIN_PASS can be given when starting the service stack as:
`ADMIN_PASS=myVerySecretPassword sudo /usr/local/bin/docker-compose up -d`

The ADMIN_PASS environment variable will the set given password as the Mumble SuperUser password and OpenDCHub admin password. If
the environment variable is empty or not given, a password `foobar` will be used. You can easily change the password when restarting
the stack with:
```
ADMIN_PASS=passwordOne sudo /usr/local/bin/docker-compose up -d
sudo /usr/local/bin/docker-compose down
ADMIN_PASS=passwordTwo sudo /usr/local/bin/docker-compose up -d
```

Restarting the service stack retains the data of the services, but should you wish to start from scratch, you can run
the following commands when the stack is up:
```
sudo /usr/local/bin/docker-compose down
sudo docker system prune
ADMIN_PASS=myVerySecretPassword sudo /usr/local/bin/docker-compose up -d
```

By doing so, you need to configure every service again. This, however, doesn't trigger the building of the Docker
images again. Should you wish to do so, run `sudo docker images -q | xargs sudo docker rmi` followed by the stack startup
`ADMIN_PASS=myVerySecretPassword sudo /usr/local/bin/docker-compose up -d`

#### Murmur (Mumble server) ####

Connect with the username `SuperUser` and supply the ADMIN_PASS you defined earlier when starting the service stack. You can now
administer the server via the Mumble client (adding channels, setting ACLs, etc). How you wish to setup the service is up to you,
[some instructions](https://wiki.mumble.info/wiki/Main_Page) may be helpful.

Lastly, connect to the server with your regular username, accept the self-signed certificate and click Self -> Register. Instruct the 
other gamers to do the same thing.

One way of administering the server is registering as regular user and giving admin permission to that user while logged in as SuperUser.


#### Open DC Hub ####

Configuring the hub is supposed to be done via telnet connection. Run `telnet 10.0.0.1 53696` where the ipv4 address
is the actual address of your main server. Login by giving the command (with the extra $ and | characters) and the ADMIN_PASS
you defined earlier: `$adminpass myVerySecretPassword|`

You can then set the Message Of The Day or other options with the following commands:
```
$set motd Message of the day|
$set key value|
$commands|
$exit|
```

## Final Notes ##

While this is not a fully install-and-forget setup, it eases out some of the server administering responsibilities of the organizer.
Every organizer can have some degree of customization options should he want to use that.

There can be an option of building an actual full blown virtual server that can be used in every Lanparty but this project does not require 
you to do so (but it doesn't prohibit you to do so either).
