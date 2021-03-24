#!/bin/bash
sleep 2m #make time not to permit reboot.timer reboot again by the clock
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

sudo dbus-send --system --print-reply \
--dest=org.freedesktop.login1 /org/freedesktop/login1 \
"org.freedesktop.login1.Manager.Reboot" boolean:true

