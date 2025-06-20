#!/bin/bash
echo "Starting Grasshopper"

if [ $1 == "poller" ]; then
    echo "Starting Grasshopper poller..."
    yachron -c /home/grasshopper/config/poller.yaml
elif [ "$1" == "webserver" ]; then
    echo "Stopping Grasshopper server..."
    httpd -D FOREGROUND
else
    $@
fi

