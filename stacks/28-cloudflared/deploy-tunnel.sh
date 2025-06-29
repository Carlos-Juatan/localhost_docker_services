#!/bin/bash

docker pull cloudflare/cloudflared:latest

docker stack deploy --prune --detach=false --resolve-image always -c cloudflared.yaml cloudflared
