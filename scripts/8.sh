#!/bin/bash

kubectl create ns server

cat > /tmp/web1.yaml << EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: web1
  name: web1
spec:
  replicas: 1
  selector:
    matchLabels:
      app: web1
  template:
    metadata:
      labels:
        app: web1
    spec:
      nodeName: k8s-worker1
      containers:
      - image: httpd
        name: httpd
        resources: {}
EOF

cat > /tmp/web2.yaml << EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: web2
  name: web2
spec:
  replicas: 1
  selector:
    matchLabels:
      app: web2
  strategy: {}
  template:
    metadata:
      labels:
        app: web2
    spec:
      nodeName: k8s-worker1
      containers:
      - image: httpd
        name: httpd
        resources: {}
EOF

cat > /tmp/web3.yaml << EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: web3
  name: web3
spec:
  replicas: 1
  selector:
    matchLabels:
      app: web3
  strategy: {}
  template:
    metadata:
      labels:
        app: web3
    spec:
      nodeName: k8s-worker1
      containers:
      - image: httpd
        name: httpd
        resources: {}
EOF

kubectl apply -f /tmp/web1.yaml -f /tmp/web2.yaml -f /tmp/web3.yaml -n server
