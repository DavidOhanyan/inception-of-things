!/bin/bash

apt-get update && apt-get upgrade -y
apt install curl -y

curl -sfL https://get.k3s.io | sh -

kubectl apply -f ./p2/confs/app1/k3s/deployment.yaml -f ./p2/confs/app1/k3s/service.yaml
kubectl apply -f ./p2/confs/app2/k3s/deployment.yaml -f ./p2/confs/app2/k3s/service.yaml
kubectl apply -f ./p2/confs/app3/k3s/deployment.yaml -f ./p2/confs/app3/k3s/service.yaml

kubectl apply -f ./p2/confs/ingress.yml
