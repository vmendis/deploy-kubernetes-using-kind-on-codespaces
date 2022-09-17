#!/bin/bash
kubectl  apply --server-side -f Tools/kube-prometheus/manifests/setup
sleep 30
kubectl  apply --server-side -f Tools/kube-prometheus/manifests
sleep 30
kubectl  --context kind-kind get all,cm,secret,ing -A | grep monitor | grep pod

