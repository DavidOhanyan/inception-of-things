!/bin/bash

apt-get update && apt-get upgrade -y
apt install curl -y

curl -sfL https://get.k3s.io | sh -

K3S_TOKEN=$(cat /var/lib/rancher/k3s/server/node-token)
SERVER_IP=$(grep -Po '(?<=ip:\s")[0-9\.]+' p1/Vagrantfile | head -1)

echo $K3S_TOKEN >  p1/confs/server-token
echo $SERVER_IP > p1/confs/server-ip
