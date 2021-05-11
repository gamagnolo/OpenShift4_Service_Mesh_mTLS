#!/bin/bash

bookinfo_Deployments="
        details-v1 \
        productpage-v1 \
        ratings-v1 \
        reviews-v1 \
        reviews-v2 \
        reviews-v3"

function checkPodsStatus() {

  echo -en "\n\nCheck Pods status for Deployment: $DEPLOYMENT_NAME\n"

  replicas=1
  readyReplicas=0 
  counter=1
  while (( $replicas != $readyReplicas && $counter != 20 ))
  do
    sleep 1 
    oc get deployment $DEPLOYMENT_NAME -o json -n bookinfo > /tmp/$DEPLOYMENT_NAME.json
    replicas=$(cat /tmp/$DEPLOYMENT_NAME.json | jq .status.replicas)
    readyReplicas=$(cat /tmp/$DEPLOYMENT_NAME.json | jq .status.readyReplicas)
    echo -en "\n$counter    $DEPLOYMENT_NAME    $replicas   $readyReplicas\n"
    let counter=counter+1
  done
}

for DEPLOYMENT_NAME in $bookinfo_Deployments;
do
  checkPodsStatus
done
sleep 10
# Check that Sidecars exist
for POD_NAME in $(oc get pods -n bookinfo -o jsonpath='{range .items[*]}{.metadata.name}{"\n"}')
do
    OUTPUT=$(oc get pod $POD_NAME  -n bookinfo -o jsonpath='{.metadata.name}{"    :\t\t"}{.spec.containers[*].name}{"\n"}')
    if [[ "$OUTPUT" == *"istio-proxy"* ]]; then
       echo "SUCCESS! POD $POD_NAME has the Sidecar"
    fi
done
