#!/bin/bash
# Install salt-minion

# Configure salt
wget https://raw.githubusercontent.com/kti-matt/host-bootstrap/master/SaltStack-Packaging-Team-DE57BFBE.pub -O - -q | apt-key add -
wget https://raw.githubusercontent.com/kti-matt/host-bootstrap/master/saltstack.list -O /etc/apt/sources.list.d/saltstack.list
apt-get update
apt-get install -y salt-minion
