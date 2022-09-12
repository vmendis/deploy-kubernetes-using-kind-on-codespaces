# Deploy-kubernetes-using-kind-on-codespaces
Notes on Deploying a kuberntes cluster using kind on Github Codespaces.
WIP. Notes are not completed as of 10.Sep.2022 !!!

Github Codespaces gives a cloud based development enviornment which can be hacked
to do other interesting small projects !

It is possible to use virtual machines (VM) from Azure or AWS for these type of hacks. But one must login to Azure or AWS and create the VMs. Here we get one-click enviornment for experementing. The beauty with codespace is, if you screw-up your VM, just delete and re-create a new one. takes only a few minutes.

<add more notes in here>

A Kind kubernetes cluster with multiple Master nodes will not survive a VM shutdown and re-start. See https://github.com/kubernetes-sigs/kind/issues/1689


Steps.

Add notes in here .... about using the code given in this repo

1. $ ./0.deploy-kind-cluster.sh

Once the kubernets cluster is built, wait for few minutes for all the pods to be in "Running" mode before executing step 2.  Use this command to check.

$ kubectl  --context kind-kind get all,cm,secret,ing -A


2. Deploy Kubernetes dashboard.
This is for demostration purposes only. It is not recommended to run Kubernetes Dashboard in Production.

Warning: The sample user created in the tutorial will have administrative privileges and is for educational purposes only.

$ ./1.deploy-kubernetes-dashboard.sh
$ kubectl proxy
"Your application running on port 8001 is available....." message pops up. Also, "PORTS" tab on the screen get highlited.

Click on "Open in Browser" button.

Normally, Kubectl will make Dashboard available at http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/.

But for the codespace enviornment, we must construct a new URL.

Take the URL from new tab or browser window opened.
Example : https://deploy-kubernetes-using-kind-on-000x0xxxxxxf0000-8001.githubpreview.dev/

Add 
api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy


to the end of it. The
final url must look like this :

https://deploy-kubernetes-using-kind-on-000x0xxxxxxf0000-8001.githubpreview.dev/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy





