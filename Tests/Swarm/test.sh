# Crie a rede overlay para o Docker Swarm:
docker network create --driver=overlay network_public

# Execute o comando abaixo para fazer o deploy da stack Traefik:
docker stack deploy --prune --resolve-image always -c traefik.yaml traefik

#  Execute o comando abaixo para fazer o deploy da stack do Evolution API v2:
docker stack deploy --prune --resolve-image always -c evolution_api_v2.yaml evolution_v2