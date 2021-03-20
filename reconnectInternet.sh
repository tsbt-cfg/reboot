#!/bin/bash
CONNECTION=$(iSpeed/fast --single-line)
IGNORECASE=1
ISNOTCONNECTED=`echo $CONNECTION | awk -F[e,E]rror '{ print $2 }'| sed 's/ //g'`

if ! [ -z "$ISNOTCONNECTED" ];then # test an empty variable
echo $CONNECTION
./bin/disable.sh
fi
