#!/bin/bash
echo "Starting Grasshopper"

cd /home/grasshopper/grasshopper
cp conf/grasshopper.conf.example conf/grasshopper.conf
cp conf/grasshopper-apache.conf.example /etc/httpd/conf.d/grasshopper.conf

chmod 775 /home/grasshopper
ln -s /home/grasshopper/grasshopper /var/www/html/grasshopper


if [ $1 == "poller" ]; then
    echo "Starting Grasshopper poller"
    yacron -c /home/grasshopper/grasshopper/conf/poller.yaml
elif [ "$1" == "webserver" ]; then
    echo "Stopping Grasshopper server..."
    httpd -D FOREGROUND
else
    $@
fi

