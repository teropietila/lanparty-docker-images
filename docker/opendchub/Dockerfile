FROM centos:7

ARG opendchub_src

RUN yum install -y \
	gzip gcc perl perl-ExtUtils-Embed make && \
	yum clean all

COPY src/$opendchub_src /tmp/opendchub.tar.gzip

RUN mkdir /opt/opendchub && \
	tar -xvzf /tmp/opendchub.tar.gzip -C /opt/opendchub --strip 1 && \
	rm -f /tmp/opendchub.tar.gzip

WORKDIR /opt/opendchub

RUN	./configure && \
	make && \
	make install && \
	make clean

COPY config /root/.opendchub/config
COPY start.sh /opt/opendchub/start.sh
RUN chmod a+x start.sh

VOLUME ["/root/.opendchub"]

ENTRYPOINT /opt/opendchub/start.sh
