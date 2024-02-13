#!/bin/bash

kubectl delete -f kiali-dashboard.yaml
# Wait for kiali deletion. Kiali must be deleted before kiali-operator.
kubectl wait --for=delete svc/kiali -n istio-system
kubectl wait --for=delete deployment/kiali -n istio-system

skaffold delete -f auth-config-skaffold.yaml
skaffold delete -f monitoring-skaffold.yaml
skaffold delete