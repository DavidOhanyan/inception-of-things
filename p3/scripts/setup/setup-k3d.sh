#!/bin/bash

USER_NAME=${SUDO_USER:-$(whoami)}
USER_HOME=$(eval echo "~$USER_NAME")

echo $USER_NAME
echo $USER_HOME

mkdir -p $USER_HOME/.kube

# installing k3d
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

# creating cluster
k3d cluster create mycluster

cp /root/.kube/config $USER_HOME/.kube/config
chown -R $USER_NAME:$USER_NAME $USER_HOME/.kube

# downloading kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm -rf kubectl