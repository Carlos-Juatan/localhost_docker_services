# para adicionar o mkcert para que a conexão entre containers possa ser feita com o certificado TLS

vamos rodar um container temporário que vai fazer upload da pasta certs para um volume criado chamado ca_certs_volume

primeiro abra o cmd no diretório dentro da pasta certs/ca-certs on se encontra o arquivo rootCA.pem e vamos upar o arquivo rootCA.pem para dentro do container

agora usando o comando 
```bash
docker run --rm -it -v ca_certs_volume:/ca-certs -v "%cd%":/source alpine sh -c "cp /source/rootCA.pem /ca-certs/rootCA.pem && ls -l /ca-certs"
```

e agora vamos por nos stacks dos serviços para usar o certificado quando ouver conexão com o traefik