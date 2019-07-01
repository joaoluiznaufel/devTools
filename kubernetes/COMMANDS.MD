`kubectl cluster-info`

`kubectl get nodes`

`kubectl create deployment first-deployment --image=katacoda/docker-http-server`

get pods with set namespace and watch enabled
`kubectl get pods -n kube-system  -w`

list all the contexts
`kubectl config get-contexts`

set the context
`kubectl config use-context minikube` 

apply a new file to the cluster
`kubectl apply -f service.yml`

list all services
`kubectl get services`
