#!/bin/bash
cd /home/container

# Replace startup variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`

# Make tmp dir
export TMPDIR=/home/container/tmp/

if [ -d "/home/container/tmp/" ] 
then
    mkdir /home/container/tmp/
fi

cd /home/container

# Run the Server
/usr/local/bin/python3 -m pip install --no-cache-dir -r requirements.txt --upgrade
echo -e ":/home/container$ ${MODIFIED_STARTUP}"
eval ${MODIFIED_STARTUP}
