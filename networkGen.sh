#!/bin/bash


./bin/cryptogen generate --config=./crypto-config.yaml

echo "==============generated crypto artifacts================"
export FABRIC_CFG_PATH=$PWD

./bin/configtxgen -profile 2OrdererGenesis -outputBlock ./channel-artifacts/genesis.block

echo "=============generated genesis block=================="


./bin/configtxgen -profile allChannel -outputCreateChannelTx ./channel-artifacts/all.tx -channelID all

echo "=================generated channel1 from Channel1 profile==========================="

./bin/configtxgen -profile allChannel -outputAnchorPeersUpdate ./channel-artifacts/IDP1MSPanchors.tx -channelID all -asOrg IDP1MSP
./bin/configtxgen -profile allChannel -outputAnchorPeersUpdate ./channel-artifacts/IDP2MSPanchors.tx -channelID all -asOrg IDP2MSP
./bin/configtxgen -profile allChannel -outputAnchorPeersUpdate ./channel-artifacts/IDP3MSPanchors.tx -channelID all -asOrg IDP3MSP
./bin/configtxgen -profile allChannel -outputAnchorPeersUpdate ./channel-artifacts/AS1MSPanchors.tx -channelID all -asOrg AS1MSP
./bin/configtxgen -profile allChannel -outputAnchorPeersUpdate ./channel-artifacts/AS2MSPanchors.tx -channelID all -asOrg AS2MSP
./bin/configtxgen -profile allChannel -outputAnchorPeersUpdate ./channel-artifacts/RP1MSPanchors.tx -channelID all -asOrg RP1MSP

echo "=================generated 6 AnchorPeers of each Orgs for channel1==========================="

echo "============pls go change the public key of each org in folder crypto-config/peer.org/ca "
echo "=================to correspond to the key of each ca.org in the docker-compose file============="
