# Murmur Server build guide #

## How to build the latest Murmur version? ##

Check the newest version from [Murmur frontpage](https://wiki.mumble.info/wiki/Main_Page). Download the
Static Linux Server. Put the compressed tarball to src/ folder and run
```
docker build -t teropietila/lanparty-mumble:<murmur-version> -t teropietila/lanparty-mumble:latest --build-arg mumble_src=<name-of-the-file-in-src-folder> .
```

where <murmur-version> is the version being built (e.g. 1.2.19) and <name-of-the-file-in-src-folder> should be filename in the src/ folder

## How to push the image

If the build is ok, push the image to Docker hub with:
```
user@host:~> docker login <use your Docker ID and password>
user@host:~> docker push teropietila/lanparty-mumble:latest
user@host:~> docker push teropietila/lanparty-mumble:<murmur-version>
```
