#!/bin/bash

kubectl create ns istio-system
kubectl create sa service-account-web -n istio-system

cat > /tmp/test-web-pod.yaml << EOF
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: test-web-pod
  name: test-web-pod
  namespace: istio-system
spec:
  serviceAccount: service-account-web
  containers:
  - image: nginx:1.21
    name: test-web-pod
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}
EOF

kubectl apply -f /tmp/test-web-pod.yaml
