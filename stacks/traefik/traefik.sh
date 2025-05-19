#!/bin/bash

# Faz o download da imagem do traefik v2
docker pull traefik:v2.11.24

# Executa o Stack do Traefik v2
docker stack deploy --prune --detach=false --resolve-image always -c traefik.yaml traefik
