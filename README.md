# Kubernetes and Docker Install

- Docker version: 18.06.1
- Google Cloud Platform with persistent disk
- Ubuntu 18.04 LTS

## Install with script:

Clone this Repo and move into folder:

`git clone https://github.com/cquan808/k8s-docker-install.git`

`sudo -s`

`cd k8s-docker-install`

Run script to install docker and kubernetes:

`./install-k8s-docker.sh`

## Setup Kubernetes:

Initialize k8s cluster:

`sudo kubeadm init --pod-network-cidr=<gce-k8s-server-ip>`

Issue the following commands before you join a node as instructed:

`mkdir -p $HOME/.kube`

`sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config`

`sudo chown $(id -u):$(id -g) $HOME/.kube/config`

**Note** To reset clusters `sudo kubeadm reset`, `sudo systemctl restart kubelet`, and retry `kubeadm init`

## Install a network (I picked Calico)

Install an etcd instance:

`sudo kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/etcd.yaml`

Install the RBAC roles required for Calico:

`sudo kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/rbac.yaml`

Install Calico:

`sudo kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/calico.yaml`

Check all pods are running with command:

`watch kubectl get pods --all-namespaces`

**Note:** CTRL+C to exit watch

Remove the taints on the master so that you can schedule pods on it:

`sudo kubectl taint nodes --all node-role.kubernetes.io/master-`

Confirm that you now have a node in your cluster with the following command:

`sudo kubectl get nodes -o wide`
