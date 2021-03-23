#!/bin/bash
CONNECTION=$(nping "noip.com")
ISCONNECTED=`echo $CONNECTION | awk -F[f,F]'ailed: 0' '{ print $2 }'| sed 's/ //g'`

test $ISCONNECTED && echo $CONNECTION || ./bin/disable.sh
