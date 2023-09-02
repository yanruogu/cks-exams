#!/bin/bash

kubectl create ns prod
kubectl create sa backend-sa -n prod

