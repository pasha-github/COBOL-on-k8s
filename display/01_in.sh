#!/bin/bash

source ../local.env

KUBECONFIG=""

eval $(ibmcloud ks cluster config $CLUSTER_NAME | grep export)

WATCHER=$(kubectl get pods | grep 'watcher-in' | awk {'print $1'})

kubectl logs ${WATCHER} -f
