#!/bin/sh
kind create cluster --config Kind/config.yaml
kind get clusters
kubectl --context kind-kind cluster-info
kubectl  --context kind-kind get all,cm,secret,ing -A
#


