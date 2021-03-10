#! /bin/bash

#
# {{ ansible_managed }}
#

FILE="{{ cnode_home }}/conf/mainnet-shelley-genesis.json"
slotsPerKESPeriod=`jq -r '.slotsPerKESPeriod' $FILE`
echo slotsPerKESPeriod: ${slotsPerKESPeriod}

slotNo=$(cardano-cli query tip --mainnet | jq -r '.slotNo')
echo slotNo: ${slotNo}

kesPeriod=$((${slotNo} / ${slotsPerKESPeriod}))
echo kesPeriod: ${kesPeriod}

startKesPeriod=${kesPeriod}
echo startKesPeriod: ${startKesPeriod}
