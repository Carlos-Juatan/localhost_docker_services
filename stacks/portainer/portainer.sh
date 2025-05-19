#!/bin/bash

# Faz o download da imagem do portainer
docker pull portainer/portainer-ce:2.30.0-alpine

# Executa o Stack do Portainer
docker stack deploy --prune --detach=false --resolve-image always -c portainer.yaml portainer
