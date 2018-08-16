Param(
  [string]$url
)

docker stop letsencrypt
docker run `
  --rm `
  --cap-add=NET_ADMIN `
  --name=letsencrypt `
  -v C:\git\letsencrypt-config\config:/config `
  -e PGID=50 -e PUID=1000  `
  -e EMAIL=pgross41@gmail.com `
  -e URL=$url `
  -e SUBDOMAINS=nvr,cams,h-a `
  -e VALIDATION=http `
  -p 80:80 -p 443:443 `
  -e TZ=America/Chicago `
  linuxserver/letsencrypt
