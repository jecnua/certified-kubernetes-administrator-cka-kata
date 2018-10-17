#!/bin/bash

USER_OVERRIDE='ubuntu'
HOSTNAME=$(hostname)
# FLAGS='--skip-preflight-checks'
# Or:
# This work without skip preflight checks
VERSION='1.11.1'
CIDR='10.244.0.0/16'

sudo su

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF > /etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

export DEBIAN_FRONTEND="noninteractive"

apt-get update
# apt-get upgrade --assume-yes
# apt-get autoremove --assume-yes
# apt-get clean
locale-gen en_GB.UTF-8 # Will fix the warning when logging to the box

apt-get install -y docker.io apt-transport-https awscli jq curl nfs-common
apt-get install -y kubelet=$VERSION-00 kubeadm=$VERSION-00 kubectl=$VERSION-00 kubernetes-cni=0.6.0-00
# Hold these packages back so that we don't accidentally upgrade them.
apt-mark hold kubelet=$VERSION-00 kubeadm=$VERSION-00 kubectl=$VERSION-00 kubernetes-cni=0.6.0-00

# https://github.com/kubernetes/kubernetes/issues/44750
iptables -F
# You need to specify the address or it will use the internal one
# https://github.com/kubernetes/kubeadm/issues/629
# -pod-network-cidr needed by flannel
kubeadm init \
  --token c1c911.eca99879cdf5d0af "$FLAGS" \
  --kubernetes-version v"$VERSION" \
  --apiserver-advertise-address=172.42.42.10 \
  --pod-network-cidr="$CIDR"

cd /home/$USER_OVERRIDE || exit
mkdir -p /home/$USER_OVERRIDE/.kube
sudo cp -i /etc/kubernetes/admin.conf /home/$USER_OVERRIDE/.kube/config
sudo chown "$USER_OVERRIDE":"$USER_OVERRIDE" -R /home/$USER_OVERRIDE/.kube
echo "export KUBECONFIG=/home/$USER_OVERRIDE/.kube/config" | tee -a /home/$USER_OVERRIDE/.bashrc

# Use flannel for now
wget https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
chmod 777 kube-flannel.yml

# kubectl apply -f kube-flannel.yml
su $USER_OVERRIDE -c "kubectl apply -f kube-flannel.yml"
