#!/bin/bash

# echo "setting up docker"
# ./setup-docker.sh

# echo "setting up k3d"
# ./setup-k3d.sh

# echo "setting up argocd"
# ./setup-argocd.sh

# forwarding on 8080
kubectl port-forward svc/argocd-server 8080:443 --address 0.0.0.0 -n argocd &

# argocd password
PASS=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)

echo "argocd-login: admin"
echo "argocd-password: $PASS"