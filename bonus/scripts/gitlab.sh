#!/bin/bash

apt update && apt upgrade -y
apt install -y curl

IP=$(curl -s ifconfig.me)

apt install -y openssh-server ca-certificates tzdata perl

echo "postfix postfix/mailname string $HOSTNAME" | sudo debconf-set-selections
echo "postfix postfix/main_mailer_type string 'Internet Site'" | sudo debconf-set-selections
apt install -y postfix

curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash

EXTERNAL_URL="http://$IP" apt install -y gitlab-ce

gitlab-ctl reconfigure

PASS=$(cat /etc/gitlab/initial_root_password)

echo "login: root"
echo "password: $PASS"