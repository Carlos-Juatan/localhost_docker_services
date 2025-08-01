```bash
openssl s_client -connect 172.18.0.14:443 -showcerts
echo $SSL_CERT_FILE
ls -l /usr/local/share/ca-certificates/rootCA.crt
cat /usr/local/share/ca-certificates/rootCA.crt | head
cat /etc/hosts
ping evolution.codesefaz.local
apk add curl # se não tiver o curl instaldo, mas dependendo do sistema operacional pode ser outro código
curl -vvv https://evolution.codesefaz.local
```



```bash
docker exec -it chatwoot_admin-chatwoot_admin-1 /bin/sh
/app # cat /etc/hosts # Verifique se evo.codesefaz.local está lá
/app # ping evo.codesefaz.local # Verifique se resolve para 172.18.0.14
/app # curl -vvv https://evo.codesefaz.local # Teste a conexão SSL novamente
```

```bash
docker exec -it chatwoot_admin-chatwoot_admin-1 /bin/sh
/app # cat Gemfile.lock | grep -i http
# Procure por gems como: faraday, httparty, http-client, net-http-persistent, etc.
```