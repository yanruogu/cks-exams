#!/bin/bash 

kubectl create ns testing
kubectl create ns dev-team

cat > /tmp/users-service.yaml << EOF
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: users-service
  name: users-service
  namespace: dev-team
spec:
  containers:
  - image: nginx:1.21
    name: users-service
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
EOF

kubectl apply -f /tmp/users-service.yaml 
