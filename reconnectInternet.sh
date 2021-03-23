#!/bin/bash
CONNECTION=$(nping "noip.com")
IGNORECASE=1
ISCONNECTED=`echo $CONNECTION | awk -F[f,F]'ailed: 0' '{ print $2 }'| sed 's/ //g'`

if  ![ -z "$ISCONNECTED" ];then # test for Failed: 0
echo $CONNECTION
./bin/disable.sh
fi
