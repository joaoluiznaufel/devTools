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
sudo kubeadm init --pod-network-cidr=10.244.0.0/16
```

1.9 - To start using your cluster, you need to run the following as a regular user:
```
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

2.0 - You should now deploy a pod network to the cluster. I choose calico
```
kubectl apply -f https://docs.projectcalico.org/v3.7/manifests/calico.yaml
```
Other network policies
Canal, AWS VPC, Flannel, Weave Net

2.1 - Now its time to join nodes
To be able to do this:
 - SSH to the machine
 - Become root (sudo su -)
 - Run the command that was output by kubeadm init.
 
 ```
 kubeadm join --token <token> <master-ip>:<master-port> --discovery-token-ca-cert-hash sha256:<hash>
 ```
 
If you do not have the token, you can get it by running the following command on the control-plane node:

```
kubeadm token list
```

By default, tokens expire after 24 hours. If you need to create a new one:
```
kubeadm token create
```

If you don’t have the value of --discovery-token-ca-cert-hash, you can get it by running the following command chain on the control-plane node:
```
openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | \
   openssl dgst -sha256 -hex | sed 's/^.* //'
```
