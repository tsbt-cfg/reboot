#!/bin/bash

CONNECTION=$(nping -v0 -d0 "noip.com")
ISCONNECTED=`echo $CONNECTION | awk -F[l,L]'ost: 0' '{ print $2 }'| sed 's/ //g'`
UPTIMELT60MIN=$(uptime | awk -F'min' '{print$2}' | sed 's/ //g')
test $ISCONNECTED && echo "internet connected" > /dev/tty2 || echo "internet disconnected" > /dev/tty2
RESULT=$(test $UPTIMELT60MIN && echo 'not lt 60' || echo $ISCONNECTED)
test $RESULT && echo '' || disable.sh


