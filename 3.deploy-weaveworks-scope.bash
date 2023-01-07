#!/bin/bash
kubectl apply -f https://github.com/weaveworks/scope/releases/download/v1.13.2/k8s-scope.yaml

echo "*****"
echo " "
echo "sleeping until pod stabalises"
echo " "
sleep 30
kubectl port-forward -n weave "$(kubectl get -n weave pod --selector=weave-scope-component=app -o jsonpath='{.items..metadata.name}')" 4040


