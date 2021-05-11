#!/bin/bash

OUTPUT="$(oc get project bookinfo -o template --template='{{.metadata.labels}}')";
SUB1='kiali'
SUB2='maistra'

while [[ $OUTPUT != *"$SUB1"*  || $OUTPUT != *"$SUB2"* ]]
do
   echo "waiting....Project bookinfo STILL NOT part of the Mesh....waiting...."
   OUTPUT="$(oc get project bookinfo -o template --template='{{.metadata.labels}}')";
done
echo "SUCCESS! Project bookinfo is now part of the Mesh"
