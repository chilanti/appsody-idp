#!/bin/sh

set -e

date
echo Started - Update build using runtime container folders

#Original appsody run on change:
#ENV APPSODY_RUN_ON_CHANGE="export APPSODY_DEV_MODE=run; ../validate.sh && mvn -Pstack-image-run -DappsDirectory=apps -Dmaven.repo.local=/mvn/repository liberty:dev"
#ENV APPSODY_RUN_KILL=true
export APPSODY_DEV_MODE=run
../validate.sh
mvn -B -Pstack-image-run -DappsDirectory=apps -Dmaven.repo.local=/mvn/repository package -DskipTests

date
echo Finished - Incremental build using container folders