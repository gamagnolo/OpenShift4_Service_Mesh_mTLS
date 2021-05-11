# OPENSHIFT 4 mTLS SERVICE MESH
Automatically (via scripts) install, deploy and apply a STRICT mTLS OpenShift Service Mesh to a microservices-based Cloud Native application.
Observe the near real-time encrypted traffic flowing bidirectionally within the Mesh via Grafana dashboard and the Mesh topology/configuration via Kiali dashboard.

## Environment
OpenShift 4.x

## Prerequisites
OpenShift 4.x with Operators ElasticSearch, Jaeger, Kiali, Service Mesh installed

## Goals
Apply a STRICT mTLS Service Mesh to a microservices-based Cloud Native application

## Steps
0. Ensure OCP 4.x cluster is up and running and Prerequisites are met

1. Launch the automation_script.sh with the following parameters:
   
   [$1] OCP CLUSTER MASTER API <br/>
   [$2] OCP ADMIN USER <br/>
   [$3] OCP ADMIN PWD <br/>
   [$4] NAME OF THE NAMESPACE THAT WILL CONTAIN THE APPS ON WHICH TO APPLY THE MESH <br/>
   [$5] NAME OF THE NAMESPACE WHERE THE SERVICE MESH CONTROL PLANE WILL BE INSTALLED <br/>

