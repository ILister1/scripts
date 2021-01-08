#!/bin/bash

#update vm
sudo apt update && sudo apt upgrade -y


# install Azure CLI on VM and provision Kubernetes cluster with 1 node
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
az login
az group create -n k8group -l uksouth
az aks create --resource-group k8group --name myAKSCluster --node-count 1 --enable-addons monitoring --generate-ssh-keys
az aks show --name myAKSCluster --resource-group k8group
sudo az aks install-cli
az aks get-credentials --resource-group k8group --name myAKSCluster

#install docker
curl https://get.docker.com | sudo bash

#configure kubectl

curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv ./kubectl /usr/local/bin/kubectl 

# git config

git config --global user.name "ILister1"
git config --global user.email "ilister@qa.com"
