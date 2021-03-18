#!/bin/bash
NOTIFY="2.5"

FTEXT='load average:'
LOAD5MIN="$(uptime | awk -F "$FTEXT" '{ print $2 }' | cut -d, -f2 | sed 's/ //g')"

if expr $LOAD5MIN \> $NOTIFY ;then
echo "High load 5 min" $LOAD5MIN
/usr/bin/snap disable tsbt
/usr/bin/snap disable influxdb-configurable
else
/usr/bin/snap enable influxdb-configurable
/usr/bin/snap enable tsbt
fi