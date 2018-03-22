#!/bin/bash
sudo su
yum install -y epel-release
yum install -y ansible
yum install -y vim
useradd usuario
usermod -aG wheel usuario
mkdir /home/usuario/.ssh/
cp /tmp/llave/* /home/usuario/.ssh/
chown -R usuario:usuario /home/usuario/.ssh/
chmod 400 id_rsa
chmod 644 id_rsa.pub
