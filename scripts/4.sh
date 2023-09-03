#!/bin/bash

kubectl create ns istio-system
kubectl create sa service-account-web -n istio-system

cat > /tmp/role1.yaml << EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: role1
  namespace: istio-system
rules:
- apiGroups:
  - ""
  resources:
  - pods
  verbs:
  - create
  - watch
EOF

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

kubectl apply -f /tmp/role1.yaml
kubectl create rolebinding sa-dev-1 --serviceaccount=istio-system:service-account-web --role=role1 -n istio-system
kubectl apply -f /tmp/test-web-pod.yaml
