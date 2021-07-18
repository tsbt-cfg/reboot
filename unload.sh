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

CONNECTION=$(nping -v0 -d0 noip.com)
ISCONNECTED=`echo $CONNECTION | awk -F[l,L]'ost: 0' '{ print $2 }'| sed 's/ //g'`

test $ISCONNECTED && echo "internet connected" > /dev/tty1 || echo "internet disconnected" > /dev/tty1
test $ISCONNECTED && echo "internet connected" > /dev/tty2 || echo "internet disconnected" > /dev/tty2
