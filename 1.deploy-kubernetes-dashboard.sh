#!/bin/sh
# Deploy the Kubernetes Dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.6.1/aio/deploy/recommended.yaml

# Create a simple user for dashboard
# Referenece : https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md
echo " "
echo "Creating a service user ..."
sleep 10
kubectl apply -f Tools/dashboard-adminuser.yaml

