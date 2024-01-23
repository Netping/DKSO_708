#!/bin/sh

config_file="/etc/macaddr"

count=0

while read -r line; do
    count=$((count+1))

    if [ $count -eq 1 ]; then
        mac1=$(echo "$line" | awk '{print $1}')
    elif [ $count -eq 2 ]; then
        mac2=$(echo "$line" | awk '{print $1}')
        break
    fi
done < "$config_file"

ifconfig eth0 hw ether $mac1
ifconfig eth1 hw ether $mac2

uci set network.lan.macaddr=$mac1
uci set network.wan.macaddr=$mac2
uci commit network
