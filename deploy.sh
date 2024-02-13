#!/bin/bash

skaffold run
skaffold run -f monitoring-skaffold.yaml
skaffold run -f auth-config-skaffold.yaml

# change logging level temporarily
# kubectl exec -it -n <namespace> <pod-name> exec -- curl -X POST http://localhost:15000/logging?level=trace