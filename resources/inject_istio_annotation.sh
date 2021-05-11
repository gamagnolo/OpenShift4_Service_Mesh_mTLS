#!/bin/bash

bookinfo_Deployment="
        details-v1 \
        productpage-v1 \
        ratings-v1 \
        reviews-v1 \
        reviews-v2 \
        reviews-v3" 

# Responsible for injecting the istio annotation that opts in a Deployment for auto injection of the envoy sidecar
function injectAndResume() {

  echo -en "\n\nInjecting istio sidecar annotation into Deployment: $DEPLOYMENT_NAME\n"

  oc patch deployment/$DEPLOYMENT_NAME -p '{"spec":{"template":{"metadata":{"annotations":{"sidecar.istio.io/inject":"true"}}}}}'

}

# Enable bookinfo Deployment for Envoy auto-injection
for DEPLOYMENT_NAME in $bookinfo_Deployment;
do
  injectAndResume
done
