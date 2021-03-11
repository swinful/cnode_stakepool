#!/bin/bash

BLOCKPRODUCING_IP={{ lookup('dig', groups.producers[0]) }}
BLOCKPRODUCING_PORT=6000
CNODE_VALENCY=1
curl -s -o {{ cnode_conf_dir }}/{{ cluster }}-topology.json "https://api.clio.one/htopology/v1/fetch/?max=20&customPeers=${BLOCKPRODUCING_IP}:${BLOCKPRODUCING_PORT}:${CNODE_VALENCY}|relays-new.cardano-mainnet.iohk.io:3001:2"

# Restart relay after update
if [ "$?" -eq "0" ]; then
  sudo {{ prefix }}/etc/rc.d/{{ cnode_type }} restart
fi

