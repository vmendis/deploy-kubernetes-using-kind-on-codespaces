#!/bin/bash
kubectl  apply -f Tools/WordPress/create-namespace.yaml
sleep 30
kubectl apply -f Tools/WordPress/secret.yaml
sleep 20
kubectl apply -f  Tools/WordPress/wordpress.yaml
kubectl  --context kind-kind get all,cm,secret,ing -A | grep wordpress | grep pod
