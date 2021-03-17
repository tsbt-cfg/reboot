!/bin/bash
CONNECTION=$(speed-test --json)
ISNOTCONNECTED=`echo $CONNECTION | awk -F'error' '{ print $2 }'| sed 's/ //g'`

if ! [ -z "$ISNOTCONNECTED" ];then # test an empty variable
echo $CONNECTION
./bin/disable.sh
fi