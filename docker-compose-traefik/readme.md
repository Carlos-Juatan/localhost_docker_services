# Começando a instalação instale o traefik
abra o teminal no local da stack do traefik e faça o deploy digitando
```bash
docker-compose -f traefik.yml up -d
```

depois dentro da mesma pasta faça o deploy do portainer digitando
```bash
docker-compose -f portainer.yml up -d
```

# Fazendo o deploy pelo PORTAINER
agora todos os deploys serão feitos pelo portainer adicionando novas stacks

detra da pasta que tem o **traefik.yml** e o **portainer.yml** também deve ter a pasta **stacks** e dentro dela faça a instalação na ordem

- redis
- postgres

para criar o banco de dados para o baserow acesse o terminal do postgres pelo **portainer** e digite

```bash
psql -U postgres
```
ou diretamente no cmd

```bash
docker exec -it postgres psql -U postgres
```

Para acessar o gerenciador de banco de dados do postgres

troque o **'Hg0S152LsEBnZM4yLDGL'** caso tenha uma senha diferente e cole no terminal para poder criar o banco de dados do baserow

```bash
postgres=# CREATE USER baserow_user WITH PASSWORD 'Hg0S152LsEBnZM4yLDGL';
CREATE ROLE
postgres=# CREATE DATABASE baserow_db OWNER baserow_user;
CREATE DATABASE
postgres=# GRANT ALL PRIVILEGES ON DATABASE baserow_db TO baserow_user;
GRANT
postgres=# \q
/ #
```
- **'Hg0S152LsEBnZM4yLDGL'** é a senha que pode ser mudada e fica em ( DATABASE_PASSWORD: Hg0S152LsEBnZM4yLDGL ) no stack do baserow
- **baserow_db** é definido no ( DATABASE_NAME: baserow_db )  no stack do baserow
- **baserow_user** é definido no ( DATABASE_USER: baserow_user )  no stack do baserow

>finalizando para poder acessar os serviços o baserow em específico precisar ser acessado usando o link [http://brow.codesefaz.local](http://brow.codesefaz.local)

 

que é definido no alias do network da stack
```yml
networks:
  network_compose_public:
    aliases:
      - brow.codesefaz.local
```

para definir as credenciais no n8n você vai usar o e-mail e senha usados no rimeiro login no [https://brow.codesefaz.local](https://brow.codesefaz.local)

mas para outros serviços pode tanto usar o nome do container do serviço como o alias do network da stack seguido da porta que o serviço usa
```yml
networks:
  network_compose_public:
    aliases:
      - nome_do_serviço.endereço_Url # evo.codesefaz.local # para evolution
```

# Criando o banco de dados no postgres para o n8n
```bash
CREATE USER n8n_user WITH PASSWORD 'EeaIx9G7LpV1P8o9Nqi';
CREATE DATABASE n8n_queue OWNER n8n_user;
GRANT ALL PRIVILEGES ON DATABASE n8n_queue TO n8n_user;
```

# Criando o banco de dados no postgres para a Evolution API
```bash
CREATE USER evolution_api_user WITH PASSWORD 'KR0k249haJgXCXcxSSwo';
CREATE DATABASE evolution OWNER evolution_api_user;
GRANT ALL PRIVILEGES ON DATABASE evolution TO evolution_api_user;
```

# Continuando o deploy dos serviços temos
  - **baserow.yml** - precisa criar o banco de dados no postgres
  - **n8n** - instalação sem ser no modo fila no momento.
  - **mongodb.yml** - nescessário para roda a **evolution api**
  - **evolution_api_v1.yml** - precisa do redi e do mongodb para funcionar

# n8n usando o webhook

seguindo o exemplo da evolution para usar o webhook do n8n pode usar tanto o nome do container como o alias da network seguido da porta que o serviço usa

[http://n8n:5678/webhook-test/evolution-message-webhook](http://n8n:5678/webhook-test/evolution-message-webhook)

[http://workflows.codesefaz.local:5678/webhook-test/evolution-message-webhook](http://workflows.codesefaz.local:5678/webhook-test/evolution-message-webhook)

> **evolution-message-webhook** foi o path definio dento do node webhook do n8n

o nome do container do n8n é **n8n** e a porta usada no n8n é **5678**
  - por isso **n8n:5678** funciona que é o nome do serviço(container) e a porta que o serviço usa
  - lembrando que tem que ser **http** para o acesso direto entre **containers** usar **https** nesse caso não funciona

# n8n usando o HTTP request

assim como para usar o HTTP request também pode usar tanto o nome do container como o alias da network

[http://evolution_v1:8080/message/sendText/robonildo](http://evolution_v1:8080/message/sendText/robonildo)

[http://evo.codesefaz.local:8080/message/sendText/robonildo](http://evo.codesefaz.local:8080/message/sendText/robonildo)

o nome do container da evolution api é **evolution_v1** e a porta usada no evolution api é **8080**
