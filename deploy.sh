#!/bin/bash

skaffold run -f istio/istio-system/istiod-skaffold.yaml
skaffold run -f istio/istio-system/monitoring-skaffold.yaml
skaffold run -f istio/istio-auth-module/auth-config-skaffold.yaml

# add label for auth config resources
kubectl label pods -l app=istio-ingressgateway jwt=enabled -n istio-system

# change logging level temporarily
# kubectl exec -it -n <namespace> <pod-name> exec -- curl -X POST http://localhost:15000/logging?level=trace