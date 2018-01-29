#!/bin/bash


docker swarm init

echo "==============swarm up=============="
echo "=============begin deploying========="
docker stack deploy -c ca.yml did
docker stack deploy -c couchdb.yml did
docker stack deploy -c zookeeper.yml did
docker stack deploy -c kafka.yml did
docker stack deploy -c orderer.yml did
docker stack deploy -c peer.yml did
docker stack deploy -c cli.yml did

echo "===============stack deployed==========="
docker service ls

#docker exec -it {cli_container} bash
#peer channel create -o orderer.example.com:7050 -c channel1 -f ./channel-artifacts/channel1.tx --tls $CORE_PEER_TLS_ENABLED --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
#peer channel join -b channel1.block
#peer chaincode install -n mycc -v 1.0 -p github.com/hyperledger/fabric/chaincode/chaincode_example02
#peer chaincode instantiate -o orderer.example.com:7050 --tls $CORE_PEER_TLS_ENABLED --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C channel1 -n marbles -v 1.0 -c '{"Args":["init"]}' -P "OR ('Org1MSP.member','Org1MSP.admin')"
#peer chaincode invoke -o orderer.example.com:7050  --tls $CORE_PEER_TLS_ENABLED --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem  -C channel1 -n mycc -c '{"Args":["invoke","a","b","10"]}'
#peer chaincode query -C channel1 -n mycc -c '{"Args":["query","a"]}'
