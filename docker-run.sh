#!/bin/bash 

url=$1

sudo docker run \
  --rm \
  --cap-add=NET_ADMIN \
  --name=letsencrypt \
  -v $(dirname "$(readlink -f "$0")")/config:/config \
  -e PGID=50 -e PUID=1000  \
  -e EMAIL=pgross41@gmail.com \
  -e URL=$url \
  -e SUBDOMAINS=nvr,cams,h-a \
  -e VALIDATION=http \
  -p 80:80 -p 443:443 \
  -e TZ=America/Chicago \
  lsioarmhf/letsencrypt
