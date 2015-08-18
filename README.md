# Yoo DHCP Service Based On Docker

## Install

* Pull yoo-isc-dhcpd Image

```

Docker pull goyoo/yoo-isc-dhcpd

```

* Custom Configuration


docker kill  dhcpd; docker rm dhcpd; docker run --net=host  -d --name dhcpd -v /opt/dhcpd:/conf   goyoo/yoo-isc-dhcpd



* Edit File: `/opt/dhcpd/custom.conf`

```

subnet 192.168.8.0 netmask 255.255.255.0 {
  range 192.168.8.100 192.168.8.200;
  option routers 192.168.8.1;
  option domain-name "localhost";
  option domain-name-servers 114.114.114.114;
  host host-1-1 { hardware ethernet 00:25:91:fd:f9:9d; fixed-address 192.168.8.20;}
  host host-1-2 { hardware ethernet 00:25:91:fc:9b:e9; fixed-address 192.168.8.21;}
}

```

* RUN Service

```
docker kill  dhcpd; docker rm dhcpd; docker run --net=host  -d --name dhcpd -v /opt/dhcpd:/conf   goyoo/yoo-isc-dhcpd
```


* `NOTE`: You can replace `/opt/dhcpd` folder as you want.



## Furthermore Configuration

if you want to replace `dhcpd.conf`, just simple add `dhcpd.conf` file in `/opt/dhcpd/` folder.

