# Execute o comando abaixo para fazer o deploy da stack do banco de dados:
docker-compose -f postgres.yaml up -d

# Abra o banco de dados e crie o banco de dados evolution:
docker exec -it postgres psql -U postgres
CREATE DATABASE evolution;
\q # Sair do psql

# Execute o comando abaixo para fazer o deploy da stack do Redis:
docker-compose -f redis.yaml up -d

# Execute o comando abaixo para fazer o deploy da stack do RabbitMQ:
docker-compose -f rabbitmq.yaml up -d

# Execute o comando abaixo para fazer o deploy da stack do evolution-api:
docker-compose -f evolution-api.yaml up -d

# Verifique se o container do evolution-api está rodando:
http://localhost:8080 