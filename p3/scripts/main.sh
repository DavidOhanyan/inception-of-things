#!/bin/bash

echo "setting up docker"
./setup/setup-docker.sh

echo "setting up k3d"
./setup/setup-k3d.sh

echo "setting up argocd"
./setup/setup-argocd.sh

echo "applying argocd manifests"
./sync/apply.sh

echo "forwarding argocd on 8081"
kubectl port-forward svc/argocd-server 8081:443 --address 0.0.0.0 -n argocd &

echo "forwarding web on 5000"
kubectl port-forward --address 0.0.0.0 svc/app-service 5000:80 -n dev &

# argocd password
PASS=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)

echo "argocd-login: admin"
echo "argocd-password: $PASS"