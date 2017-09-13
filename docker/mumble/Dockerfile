FROM centos:7

ARG murmur_src

VOLUME ["/var/local/murmur"]

COPY src/$murmur_src /tmp/murmur.tar.bz2
RUN yum install -y bzip2 && \
	yum clean all

RUN mkdir /opt/murmur && \
    tar -xvjf /tmp/murmur.tar.bz2 -C /opt/murmur --strip 1 && \
	rm -f /tmp/murmur.tar.bz2

COPY murmur.ini /etc/murmur.ini
COPY start.sh /opt/murmur/start.sh
RUN chmod a+x /opt/murmur/start.sh

CMD /opt/murmur/start.sh
