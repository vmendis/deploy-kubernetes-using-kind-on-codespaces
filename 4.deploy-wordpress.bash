#!/bin/bash
kubectl  apply -f Tools/WordPress/0.namespace.yaml
sleep 10
kubectl apply -f  Tools/WordPress/1.pv.yaml
sleep 10
kubectl apply -f Tools/WordPress/2.mysql.yaml
sleep 10
kubectl apply -f Tools/WordPress/3.wordpress.yaml
sleep 10
kubectl  --context kind-kind get all,cm,secret,ing -A | grep wordpress | grep pod
