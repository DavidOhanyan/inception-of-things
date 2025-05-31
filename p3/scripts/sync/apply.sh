#!/bin/bash

kubectl apply -f ../confs/argo_projects/dev.yaml -n argocd
kubectl apply -f ../confs/argo_applications/argo.yaml -n argocd