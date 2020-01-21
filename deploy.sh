#!/bin/bash
set -e

component=`udo config view|grep Name|awk '{print $2}'`
udo delete $component
rm -rf .udo
udo create $1 --local-repo $IDP_PATH/index.json -v 9
udo url create $1.$2 --port $3
udo push --fullBuild