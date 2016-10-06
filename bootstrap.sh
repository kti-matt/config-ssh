#!/bin/bash
# Bootstrap a new host matching these requirements:
#   * Debian 8
#   * VirtualBox
#   * eth0 is DHCP/default route
#   * eth1 is host-only network
#

# Configure eth1
wget https://raw.githubusercontent.com/kti-matt/host-bootstrap/master/authorized_keys -O /etc/network/interfaces.d/eth1
ifup eth1

# Configure sudo
apt-get install -y sudo
adduser matt sudo
mkdir --parent /root/.ssh
wget https://raw.githubusercontent.com/kti-matt/host-bootstrap/master/authorized_keys -O /root/.ssh/authorized_keys
mkdir --parent /home/matt/.ssh
cp /root/.ssh/authorized_keys /home/matt/.ssh/authorized_keys
chmod -R matt:matt /home/matt/.ssh

# Configure salt

