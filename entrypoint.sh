#!/bin/bash
echo "Starting Grasshopper"

cd /home/grasshopper/grasshopper
cp conf/grasshopper.conf.example conf/grasshopper.conf

if [ $1 == "poller" ]; then
    echo "Starting Grasshopper poller"
    #/home/grasshopper/grasshopper/cli/grasshopper_control.pl start
    yacron -c /home/grasshopper/grasshopper/conf/poller.yaml
elif [ "$1" == "webserver" ]; then
    echo "Stopping Grasshopper server..."
    httpd -D FOREGROUND
else
    $@
fi

