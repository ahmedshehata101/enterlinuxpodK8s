#!/bin/bash


#(C) Ahmed Shehata
#The purpose of this script is to enter any linux pod in K8s cluster , you can provide a name space if you don't default namespace will be used.
#

podname=$1
namespace=$2
k8sexist=$(which kubectl)
if [ -z "$k8sexist"  ]
then
        echo "No Kubectl command found in this system,exiting....!"
        exit 1
fi
if [ -z "$podname" ]
then
        echo "Error: No Pod Name has been specified,exiting...!"
        exit 1
else
        if [ -z $namespace ]
        then
/usr/bin/kubectl exec -it $podname  -- /bin/bash
else
/usr/bin/kubectl exec -it $podname -n $namespace -- /bin/bash
        fi
