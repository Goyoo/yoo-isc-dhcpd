FROM debian:8.1
MAINTAINER Tad Wang <wptady@gmail.com>

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

EXPOSE 67
EXPOSE 67/udp
EXPOSE 547
EXPOSE 547/udp
EXPOSE 647
EXPOSE 647/udp
EXPOSE 847
EXPOSE 847/udp

VOLUME	["/conf"]

ENTRYPOINT ["/dhcpd"]
CMD ["-f", "-cf", "/data/dhcpd.conf", "-lf", "/data/dhcpd.leases", "--no-pid"]
