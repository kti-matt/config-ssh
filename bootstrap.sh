#!/bin/bash
# Bootstrap a new host matching these requirements:
#   * Debian 8
#   * VirtualBox
#   * eth0 is DHCP/default route
#   * eth1 is host-only network

# Configure eth1
wget https://raw.githubusercontent.com/kti-matt/host-bootstrap/master/authorized_keys -O /etc/network/interfaces.d/eth1
ifup eth1

# Configure salt
wget https://raw.githubusercontent.com/kti-matt/host-bootstrap/master/SaltStack-Packaging-Team-DE57BFBE.pub -O - -q | apt-key add -
wget https://raw.githubusercontent.com/kti-matt/host-bootstrap/master/saltstack.list -O /etc/apt/sources.list.d/saltstack.list
apt-get update
apt-get install -y salt-minion
wget https://raw.githubusercontent.com/kti-matt/host-bootstrap/master/minion -O /etc/salt/minion
wget https://raw.githubusercontent.com/kti-matt/host-bootstrap/master/grains -O /etc/salt/grains
systemctl restart salt-minion

# Configure sudo
apt-get install -y sudo
adduser matt sudo
mkdir --parent /root/.ssh
wget https://raw.githubusercontent.com/kti-matt/host-bootstrap/master/authorized_keys -O /root/.ssh/authorized_keys
mkdir --parent /home/matt/.ssh
cp /root/.ssh/authorized_keys /home/matt/.ssh/authorized_keys
chmod -R matt:matt /home/matt/.ssh
