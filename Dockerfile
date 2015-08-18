FROM debian:8.1
MAINTAINER Tad Wang <wptad@tom.com>

RUN \
	DEBIAN_FRONTEND=noninteractive && \
	echo "deb http://mirrors.aliyun.com/debian/ wheezy main"> /etc/apt/sources.list && \
	echo "deb http://mirrors.aliyun.com/debian/ wheezy-updates main">> /etc/apt/sources.list && \
	echo "deb http://security.debian.org/ wheezy/updates main">> /etc/apt/sources.list && \
	apt-get update && \
	apt-get install -y netmask isc-dhcp-server

ADD dhcpd.sh /dhcpd
ADD dhcpd.conf /default_dhcpd.conf
RUN chmod +x /dhcpd

EXPOSE 67/udp

VOLUME	["/conf"]

ENTRYPOINT ["/dhcpd"]
CMD ["-f", "-cf", "/data/dhcpd.conf", "-lf", "/data/dhcpd.leases", "--no-pid"]
