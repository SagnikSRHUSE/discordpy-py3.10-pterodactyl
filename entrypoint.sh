#!/bin/bash
cd /home/container

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

# Replace startup variables
MODIFIED_STARTUP=$(echo -e $(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g'))

# Make tmp dir
export TMPDIR=/home/container/tmp/

if [ -d "/home/container/tmp/" ] 
then
    mkdir /home/container/tmp/
fi

cd /home/container

# Run the Server
echo -e ":/home/container$ ${MODIFIED_STARTUP}"
eval ${MODIFIED_STARTUP}
