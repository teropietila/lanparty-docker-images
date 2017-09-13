FROM centos:7

ARG source_url

RUN yum install -y \
	wget gzip \
	gcc perl perl-ExtUtils-Embed make && \
	yum clean all

RUN mkdir /opt/opendchub && \
	wget -O /tmp/opendchub.tar.gzip --progress=dot:mega $source_url  && \
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
