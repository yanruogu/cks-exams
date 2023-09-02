#!/bin/bash

cat > /tmp/tomcat.yaml << EOF
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: tomcat
  name: tomcat
spec:
  containers:
  - image: tomcat
    name: tomcat
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
EOF

kubectl apply -f /tmp/tomcat.yaml
