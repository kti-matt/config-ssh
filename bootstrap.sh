#!/bin/bash
# Bootstrap a new host matching these requirements:
#   * Debian 8
#   * VirtualBox
#   * eth0 is DHCP/default route
#   * eth1 is host-only network
#
# It will be configured with DHCP on eth1 and to connect to KTI's Salt master. 
