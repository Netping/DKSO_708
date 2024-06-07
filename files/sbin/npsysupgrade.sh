#!/bin/sh
if [ !f /tmp/dkso708-sysupgrade.bin.bz2 ]
  echo "Firmware not found..." > /dev/console
  exit 1
fi 

# Change CPU-led mode to sysupgrade (fast blink)
echo "100" > /sys/class/leds/yellow:cpu1/delay_on
echo "200" > /sys/class/leds/yellow:cpu1/delay_off


sysupgrade -b /tmp/backup.tar.gz
sysupgrade /tmp/dkso708-sysupgrade.bin.bz2
