#!/bin/bash
sudo apt-get update
sudo apt-get install -y apt-transport-https software-properties-common ca-certificates curl wget
wget https://download.docker.com/linux/ubuntu/gpg
sudo apt-key add gpg
echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu artful stable" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get -y install docker-ce=18.06.1~ce~3-0~ubuntu
# install rexray-gcepd
sudo docker plugin install --grant-all-permissions rexray/gcepd GCEPD_TAG=rexray
sudo docker volume ls
# install kubernetes
sudo wget https://packages.cloud.google.com/apt/doc/apt-key.gpg
sudo apt-key add apt-key.gpg
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" >> /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
