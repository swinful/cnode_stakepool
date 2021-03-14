# cnode - Ansible role for the setup a Cardano Stake Pool on FreeBSD

This role only supports the setup of a relay node at the moment.


## Playbook Setup

File: sample1_playbook.yml
- hosts: relays
  strategy: free
  roles:$
      - { role: cnode_stakepool, cnode_user: remote_username }

File: sample1_playbook.yml
- hosts: relays
  strategy: free
  roles:
    - role: cnode_stakepool
      vars:
        cnode_user: cnode_daemon


## Inventory file setup
File: sample1_inventory.ini
[all:vars]
ansible_python_interpreter=/path/to/python (if not detected automatically)

[producers]
fully_qualified_producer_hostname (we need this to setup peers)

[relays]
your_relay_node_hostname


File: sample2_inventory.ini
[all:vars]
ansible_python_interpreter=/usr/local/bin/python3.7

[producers]
producer.cardano-node.com

[relays]
relay.cardano-node.com



