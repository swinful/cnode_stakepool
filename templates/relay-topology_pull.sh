#!/bin/bash

MAX_PEERS=15
BLOCKPRODUCING_IP={{ lookup('dig', cnode_producer) }}
BLOCKPRODUCING_PORT=6000
CNODE_VALENCY=1
curl -s -o {{ cnode_conf_dir }}/{{ cluster }}-topology.json "https://api.clio.one/htopology/v1/fetch/?max=${MAX_PEERS}&customPeers=${BLOCKPRODUCING_IP}:${BLOCKPRODUCING_PORT}:${CNODE_VALENCY}|relays-new.cardano-mainnet.iohk.io:3001:2"

# Restart relay after update
# if [ "$?" -eq "0" ]; then
#   sudo {{ prefix }}/etc/rc.d/{{ cnode_type }} restart
# fi

