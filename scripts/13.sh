#!/bin/bash 

kubectl create ns sec-ns

cat > /tmp/sec-ns.yaml << EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: secdep
  name: secdep
  namespace: sec-ns
spec:
  replicas: 1
  selector:
    matchLabels:
      app: secdep
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: secdep
    spec:
      containers:
      - command:
        - /bin/sh
        - -c
        - sleep 24h
        image: busybox
        name: busybox
        resources: {}
EOF

kubectl apply -f /tmp/sec-ns.yaml 
