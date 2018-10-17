#!/bin/bash

sudo su

VERSION='1.11.1'

apt-get update && apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF > /etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

export DEBIAN_FRONTEND="noninteractive"

apt-get update
apt-get upgrade --assume-yes
apt-get autoremove --assume-yes
apt-get clean
locale-gen en_GB.UTF-8 # Will fix the warning when logging to the box

apt-get install -y docker.io apt-transport-https awscli jq curl nfs-common
apt-get install -y kubelet=$VERSION-00 kubeadm=$VERSION-00 kubectl=$VERSION-00 kubernetes-cni=0.6.0-00
# Hold these packages back so that we don't accidentally upgrade them.
apt-mark hold kubelet=$VERSION-00 kubeadm=$VERSION-00 kubectl=$VERSION-00 kubernetes-cni=0.6.0-00

# https://github.com/kubernetes/kubernetes/issues/44750
iptables -F

# New in 1.9: discovery-token-unsafe-skip-ca-verification
kubeadm join \
  --token c1c911.eca99879cdf5d0af \
  --discovery-token-unsafe-skip-ca-verification \
  172.42.42.10:6443
