#!/bin/sh

echo "Restore default settings"
if [ -e /etc/config/netping/default/config.tar ]
then
	tar x -f /etc/config/netping/default/config.tar -C /etc/config
else
	echo "Default settings not found"
fi

echo "Restore default password"

echo -e "ping\nping\n" | passwd > /dev/null

reboot
