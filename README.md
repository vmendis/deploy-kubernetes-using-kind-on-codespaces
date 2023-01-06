# Deploy-kubernetes-using-kind-on-codespaces
Notes on Deploying a kuberntes cluster using kind on Github Codespaces.
WIP. Notes are not completed as of 10.Sep.2022 !!!

Github Codespaces gives a cloud based development enviornment which can be hacked 
to do other interesting small projects !

It is possible to use virtual machines (VM) from Azure or AWS for these type of hacks. But one must login to Azure or AWS and create the VMs. Here we get one-click enviornment for experementing. The beauty with codespace is, if you screw-up your VM, just delete and re-create a new one. takes only a few minutes.

As of 13.Sep.2022, I am on the Codespace Beta program. Hence I am not paying for the Codespaces I create. Beaware the costs associated running codespaces before trying the steps given in here.


Halfway through this project I switched to using Ubuntu from Alpine. 

Observations :

i. Building the Ubuntu image with the required tools was loslower swer compared to Alpine.
This can be speed up by building an ubuntu docker image with docker and pusing it into dockerhub and using it.

ii. It was easy to enable SSHD on the Ubuntu based Codespace. This can be achived by adding a features section into the devcontainer.json
 "features": {
      "ghcr.io/devcontainers/features/sshd:1": {
          "version": "latest"


iii. After installing Prometheus related tools the load average of the Ubuntu based container went realy high. Becuase of load issues I switched back to using Alpine.




A Kind kubernetes cluster with multiple Master nodes will not survive a VM shutdown and re-start. See https://github.com/kubernetes-sigs/kind/issues/1689


Steps.

Add notes in here .... about using the code given in this repo

1. $ ./0.deploy-kind-cluster.sh

Once the kubernets cluster is built, wait for few minutes for all the pods to be in "Running" mode before executing step 2.  Use this command to check.

$ kubectl  --context kind-kind get all,cm,secret,ing -A


2. Deploy Kubernetes dashboard.
This is for demostration purposes only. It is not recommended to run Kubernetes Dashboard in Production.

Warning: The sample user created in the tutorial will have administrative privileges and is for educational purposes only.

$ ./1.deploy-kubernetes-dashboard.

$ kubectl -n kubernetes-dashboard create token admin-user

NOTE: This generates a token and we require this token to login to the Kubernetes ashboard.

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

Select the method "Token" to authenticate

Copy/Paste the token 

3. Deploy Proemetheus and friends.

The Manifests in this repo is from Release v0.11.0
https://github.com/prometheus-operator/kube-prometheus

Grafana version : 9.1.4
Issues I came across: 

"Origin Not Allowed" error/warning

a. https://github.com/grafana/grafana/issues/45117#issuecomment-1033842787
b. https://community.grafana.com/t/after-update-to-8-3-5-origin-not-allowed-behind-proxy/60598

Workaround (Not recommended in Production) : Change image to be 8.3.3
           image: grafana/grafana:8.3.3
           


======================================================
Resources I used bulding this repo :

1. Insperation for this project.
https://www.youtube.com/watch?v=hh2K5XCN6Nk - Running a Kubernetes cluster in GitHub CodeSpaces | an Introduction

2. Used notes from this page on installing Docker inside an Ubuntu Docker image.
https://community.datastax.com/questions/5369/how-do-i-setup-kind-on-ubuntu-to-run-the-kubernete.html

3. Installing Kubernetes Dashboard.
https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/

4. GitHub Codespaces
https://docs.github.com/en/codespaces

5. Using GitHub CLI to ssh into codespace.
https://cli.github.com/manual/gh_codespace_ssh

6. How to install and set up OpenSSH (SSHD) server and client on the Alpine Linux system
https://www.cyberciti.biz/faq/how-to-install-openssh-server-on-alpine-linux-including-docker/

====
ChangeLog

6.Jan.2022

Added code to .devcontainer/dockerfile to :
  
  o Install bash-completion package on Alpine Linux     //https://www.cyberciti.biz/faq/alpine-linux-enable-bash-command-autocomplete/
  o Kubectl and 'k' autocomplete.

