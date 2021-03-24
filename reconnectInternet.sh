#!/bin/bash

CONNECTION=$(nping "noip.com")
ISCONNECTED=`echo $CONNECTION | awk -F[f,F]'ailed: 0' '{ print $2 }'| sed 's/ //g'`
UPTIMELT60MIN=$(uptime | awk -F'min' '{print$2}' | sed 's/ //g')
test $ISCONNECTED && echo "internet connected" > /dev/tty2 || echo "internet disconnected" > /dev/tty2
test $ISCONNECTED && test $UPTIMELT60MIN && echo $CONNECTION || disable.sh
