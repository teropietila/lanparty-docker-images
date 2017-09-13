FROM centos:7

ARG source_url

RUN yum install -y wget bzip2 && \
	yum clean all

RUN mkdir /opt/murmur && \
	wget -O /tmp/murmur.tar.bz2 --progress=dot:mega $source_url && \
	tar -xvjf /tmp/murmur.tar.bz2 -C /opt/murmur --strip 1 && \
	rm -f /tmp/murmur.tar.bz2

VOLUME ["/var/local/murmur"]

COPY murmur.ini /etc/murmur.ini
COPY start.sh /opt/murmur/start.sh
RUN chmod a+x /opt/murmur/start.sh

CMD /opt/murmur/start.sh
