# host-bootstrap

To bootstrap a VirtualBox host, do:

    wget https://git.io/vPWEz -O - | bash

You can omit some or all steps with:

    ETH=false SALT=false SUDO=false wget https://git.io/vPWEz -O - | bash

To just add my public key to authorized_keys, do:

    wget https://git.io/vXzYD -O .ssh/authorized_keys

To just install salt-minion, do:

    wget https://git.io/v1LBE -O - | bash
