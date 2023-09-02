#!/bin/bash 

kubectl create clusterrolebinding crb1  --user=system:anonymous --clusterrole=cluster-admin
kubectl create clusterrolebinding crb2  --user=system:anonymous --clusterrole=cluster-admin


