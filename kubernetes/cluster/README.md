How to install kubernetes in two ubuntu nodes

Let's do two nodes, one for master and another one for a simple node

What is your hardware?
2 GB or more of RAM per machine. Any less leaves little room for your apps.
2 CPUs or more on the control-plane node
Full network connectivity among all machines in the cluster. A public or private network is fine.

1 - Before install kubernetes

1.1 - install docker in both nodes
```
sudo apt install docker.io
```

1.2 - Enable docker with sudo systemctl
```
sudo systemctl enable docker
```

1.3 - Add kubernetes signed key on both the nodes
```
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
```

1.4 - Add kubernetes repository
```
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
```

1.5 - Install kubeadm on all nodes
What is kubeadm? The command to bootstrap the cluster.
Kubeadm also supports other cluster lifecycle functions, such as upgrades, downgrade, and managing bootstrap tokens.
```
sudo apt install kubeadm
```

1.6 - Disable swap memory on both nodes
```
sudo swapoff -a
```

1.7 - Unique hostnames to each node
```
sudo hostnamectl set-hostname master-node
```
and 
```
hostnamectl set-hostname slave-node
```

1.8 - Initialize Kubernetes on the master node
```
sudo kubeadm init
```

1.9 - To start using your cluster, you need to run the following as a regular user:
```
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

2.0 - You should now deploy a pod network to the cluster.
```
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
/docs/concepts/cluster-administration/addons/
```
