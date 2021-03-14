#!/bin/bash
if /usr/bin/snap enable influxdb-configurable; then
echo influxdb enabled
else
echo influxdb already enabled
fi

if /usr/bin/snap enable tsbt; then
echo tsbt enabled
else
echo tsbt already enabled
fi
