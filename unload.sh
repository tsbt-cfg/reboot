#!/bin/bash
NOTIFY="2.5"

FTEXT='load average:'
`uptime > /dev/tty1`
cat /sys/class/thermal/thermal_zone0/temp > /dev/tty1
`uptime > /dev/tty2`
cat /sys/class/thermal/thermal_zone0/temp > /dev/tty2


LOAD5MIN="$(uptime | awk -F "$FTEXT" '{ print $2 }' | cut -d, -f2 | sed 's/ //g')"

if expr $LOAD5MIN \> $NOTIFY ;then
echo "High load 5 min" $LOAD5MIN
/usr/bin/snap disable tsbt
/usr/bin/snap disable influxdb-configurable
else
/usr/bin/snap enable influxdb-configurable
/usr/bin/snap enable tsbt
fi
