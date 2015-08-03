build:
	docker build -t goyoo/yoo-isc-dhcpd .
run:
	docker kill  dhcpd  
	docker rm dhcpd
	docker run  -d --name dhcpd -v /hdd1/conf:/conf goyoo/yoo-isc-dhcpd	
