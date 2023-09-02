#!/bin/bash

kubectl create ns db 

cat > /tmp/db1-test.yaml << EOF
apiVersion: v1
data:
  password: Y2tzMTIzCg==
  username: Y2tz
kind: Secret
metadata:
  creationTimestamp: null
  name: db1-test
  namespace: db
EOF

kubectl apply -f /tmp/db1-test.yaml
