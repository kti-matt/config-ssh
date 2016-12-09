#!/bin/bash
# Bootstrap a new host matching these requirements:
#   * Debian 8
#   * VirtualBox
#   * eth0 is DHCP/default route
#   * eth1 is host-only network

# Use these environment variables to allow configurations to be skipped.
ETH=${CONF_ETH:-true}
SALT=${CONF_SALT:-true}
SUDO=${CONF_SUDO:-true}
USER=${SUDO_USER:-matt}

# Configure eth1
if [ "$ETH" = "true" ]; then
  wget https://raw.githubusercontent.com/kti-matt/host-bootstrap/master/eth1 -O /etc/network/interfaces.d/eth1
  ifup eth1
fi

# Configure salt
if [ "$SALT" = "true" ]; then
  wget https://raw.githubusercontent.com/kti-matt/host-bootstrap/master/SaltStack-Packaging-Team-DE57BFBE.pub -O - -q | apt-key add -
  wget https://raw.githubusercontent.com/kti-matt/host-bootstrap/master/saltstack.list -O /etc/apt/sources.list.d/saltstack.list
  apt-get update
  apt-get install -y salt-minion
  wget https://raw.githubusercontent.com/kti-matt/host-bootstrap/master/minion -O /etc/salt/minion
  wget https://raw.githubusercontent.com/kti-matt/host-bootstrap/master/grains -O /etc/salt/grains
  systemctl restart salt-minion
fi

# Configure sudo
if [ "$SUDO" = "true" ]; then
  apt-get install -y sudo
  adduser ${USER} sudo
  mkdir --parent /root/.ssh
  wget https://raw.githubusercontent.com/kti-matt/host-bootstrap/master/authorized_keys -O /root/.ssh/authorized_keys
  mkdir --parent /home/${USER}/.ssh
  cp /root/.ssh/authorized_keys /home/${USER}/.ssh/authorized_keys
  chown -R ${USER}:${USER} /home/${USER}/.ssh
fi
