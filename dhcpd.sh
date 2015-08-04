#!/bin/sh

mkdir -p /data

if [ ! -f /conf/dhcpd.conf ]; then
    echo "[Info] using default dhcpd.conf"
    cp /default_dhcpd.conf /data/dhcpd.conf
else
    echo "[Info] found dhcpd.conf in /data/ folder"
    cp /conf/dhcpd.conf /data/dhcpd.conf
fi

if [  "$(ls -A /conf/)" ]; then
    for dr in /conf/*
    do
        if [ "$dr" = "/conf/dhcpd.conf" ]; then
            echo "skip reading dhcpd.conf"
        else
            echo ">>>>> $dr"
            echo "include \"${dr}\";" >> /data/dhcpd.conf
        fi;
    done
fi

if [ ! -f /data/dhcpd.leases ]; then
    touch /data/dhcpd.leases
fi

exec /usr/sbin/dhcpd $@
