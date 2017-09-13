# Open DC Hub build guide #

## How to build the latest Open DC Hub version? ##

Check the newest version from [Opend DC hub download page](https://sourceforge.net/projects/opendchub/files/). Download the compressed tarball to src/ folder and run
```
docker build -t teropietila/lanparty-opendchub:<opendchub-version> -t teropietila/lanparty-mumble:latest --build-arg opendchub_src=<name-of-the-file-in-src-folder> .
```

where <opendchub-version> is the version being built (e.g. 0.8.3) and <name-of-the-file-in-src-folder> should be the filename in src/ folder

## How to push the image

If the build is ok, push the image to Docker hub with:
```
user@host:~> docker login <use your Docker ID and password>
user@host:~> docker push teropietila/lanparty-opendchub:latest
user@host:~> docker push teropietila/lanparty-opendchub:<opendchub-version>
```
