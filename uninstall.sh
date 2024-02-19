#!/bin/bash

kubectl delete -f istio/istio-system/manifests/kiali-dashboard.yaml
# Wait for kiali deletion. Kiali must be deleted before kiali-operator.
kubectl wait --for=delete svc/kiali -n istio-system
kubectl wait --for=delete deployment/kiali -n istio-system

skaffold delete -f istio/istio-auth-module/auth-config-skaffold.yaml
skaffold delete -f istio/istio-system/monitoring-skaffold.yaml
skaffold delete -f istio/istio-system/istiod-skaffold.yaml