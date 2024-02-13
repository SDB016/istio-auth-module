#!/bin/bash

skaffold run
skaffold run -f monitoring-skaffold.yaml
skaffold run -f auth-config-skaffold.yaml