#!/bin/bash

apt-get update && apt-get upgrade -y
apt install curl -y

while [ ! -f p1/confs/server-ip ] || [ ! -f p1/confs/server-token ]; do
  echo "⏳ Waiting for the server to get ready..."
  sleep 3
done

SERVER_IP=$(cat  p1/confs/server-ip)
TOKEN=$(cat p1/confs/server-token)


curl -sfL https://get.k3s.io | K3S_URL="https://$SERVER_IP:6443" K3S_TOKEN="$TOKEN" sh -

rm -rf p1/confs/server-ip p1/confs/server-token