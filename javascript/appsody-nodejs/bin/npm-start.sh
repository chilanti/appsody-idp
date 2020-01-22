#!/bin/bash

set -e
set -x
#cp -R /volume-mount/app/* /project/user-app
ls -latr /project/user-app
ls -latr /project
#ls -latr /volume-mount
#cd /project

#npm install
npm install --prefix user-app && npm audit fix --prefix user-app
#npm install  && npm audit fix 
# Kill the NodeJS process if its running
date
echo Stopping the NodeJS process
pkill -f "node" || echo "No NodeJS process found"

# Start the NodeJS Application
date
echo Starting the NodeJS Application
npm start >> /var/log/app.log 2>&1 &
