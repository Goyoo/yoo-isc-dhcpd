build:
	docker build -t goyoo/yoo-isc-dhcpd .
run: 
	docker kill  dhcpd; docker rm dhcpd; docker run --net=host  -d --name dhcpd -v /opt/dhcpd:/conf   goyoo/yoo-isc-dhcpd
kill: 
	docker kill dhcpd
