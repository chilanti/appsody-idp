#!/bin/sh

set -e

date
echo Started - Full build using runtime container folders

#Original appsody prep:
#ENV APPSODY_PREP="export APPSODY_DEV_MODE=prep;  ../validate.sh"
export APPSODY_DEV_MODE=prep
../validate.sh

#Original appsody run:
#ENV APPSODY_RUN="export APPSODY_DEV_MODE=run; mvn -B -Pstack-image-run -DappsDirectory=apps -Dmaven.repo.local=/mvn/repository liberty:dev"
export APPSODY_DEV_MODE=run
mvn -B -Pstack-image-run -DappsDirectory=apps -Dmaven.repo.local=/mvn/repository clean package liberty:deploy liberty:start

date
echo Finished - Full build using container folders