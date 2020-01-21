#!/bin/bash

set -e
set -x
#cp -R /volume-mount/app/* /project/user-app
#cd /project

#npm install
#npm install --prefix app && npm audit fix --prefix app
# Kill the NodeJS process if its running
date
echo Stopping the NodeJS process
pkill -f "node" || echo "No NodeJS process found"

# Start the NodeJS Application
date
echo Starting the NodeJS Application
npm run start >> /var/log/app.log 2>&1 &
