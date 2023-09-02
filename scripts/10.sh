#!/bin/sh 

kubectl create ns  kamino

cat > /tmp/baby-yoda.yaml << EOF
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: baby-yoda
  name: baby-yoda
  namespace: kamino
spec:
  containers:
  - image: ubuntu
    name: baby-yoda
    command:
    - /bin/sh
    - -c
    - "sleep 24h"
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
EOF

cat > /tmp/r2d2.yaml << EOF
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: r2d2
  name: r2d2
  namespace: kamino
spec:
  containers:
  - image: ubuntu
    name: r2d2
    command:
    - /bin/sh
    - -c
    - "sleep 24h"
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
EOF

cat > /tmp/yoda.yaml << EOF
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: yoda
  name: yoda
  namespace: kamino
spec:
  containers:
  - image: alpine:3.10.7
    name: yoda
    command:
    - /bin/sh
    - -c
    - "sleep 24h"
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
EOF

cat > /tmp/rex.yaml << EOF
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: rex
  name: rex
  namespace: kamino
spec:
  containers:
  - image: alpine:3.10.7
    name: rex
    command:
    - /bin/sh
    - -c
    - "sleep 24h"
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
EOF

kubectl apply -f baby-yoda.yaml -f yoda.yaml -f rex.yaml -f r2d2.yaml 
