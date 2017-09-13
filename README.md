# LanParty server #

This projects intention is to simplify the installation of services in LAN parties organized by Bairakyn ry members.
With this project, the person responsible for organizing the event, can configure the main server more easily
without every organizer needing to do the same installation setups every time.

This project contains the necessary tools and instructions to build the docker images, ship them to Docker Hub and
run them in (any) Docker environment.

## Services ##

The following services being deployed to LanParty server are..

### Murmur (Mumble server) ###

[VoiP service](https://wiki.mumble.info/wiki/Main_Page) for gamers to use in local area network when communicating with party members is required.

### OpenDCHub ###

[Server for OpenDC++ clients](http://opendchub.sourceforge.net/) to use when sharing files among gamers is required.


## Instructions ##

LanParty organizers wishing to take advantage of this projects already built images, [should read these instructions](docker/DEPLOY.md)

Maintainers of the services, who wish to develop, update and package the services, should read the following instructions:
  * [Murmur service](docker/mumble/README.md)
  * [Open DC Hub service](docker/opendchub/README.md)


