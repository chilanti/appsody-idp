# Appsody IDP prototypes

## Running the IDP with udo
### Prerequisites
- clone this repo
- start crc and log into it with oc as admin
- create project with `oc new-project <project-name>` 
- set permissions on the cluster
    - To enable privileged containers, run `oc adm policy add-scc-to-group privileged system:serviceaccounts:<project-name>`
    - To enable containers to run as root, run `oc adm policy add-scc-to-group anyuid system:serviceaccounts:<project-name>`

### Create and run the project
This example shows openliberty and can be adapted to run the appsody-nodejs IDP.
```
mkdir myproject; cd myproject
appsody init java-openliberty
udo create appsody-openliberty --local-repo <clone-location>/appsody-idp/index.json -v 9
udo url create openliberty.apps-crc.testing --port 9080
udo push --fullBuild
# make a change to a java file
udo push
```

### To reset after making a change to the idp
```
udo delete
rm -rm .udo
udo create appsody-openliberty --local-repo <clone-location>/appsody-idp/index.json -v 9
udo url create openliberty.apps-crc.testing --port 9080
udo push --fullBuild
```