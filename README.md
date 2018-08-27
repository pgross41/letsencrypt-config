

### Enable autostart on boot
```
sudo ./install-autostart.sh
```

### Create user
```
sudo docker exec -it letsencrypt htpasswd -c /config/nginx/.htpasswd <username>
```

### Add user
```
sudo docker exec -it letsencrypt htpasswd /config/nginx/.htpasswd <username>
```

### Logs in realtime
```
sudo docker logs -f letsencrypt
```

### View banned IPs
```
sudo docker exec -it letsencrypt fail2ban-client status nginx-http-auth
```

### View fail2ban log
```
sudo docker exec -it letsencrypt cat /config/log/fail2ban/fail2ban.log
```

### Host IP from inside container (host.docker.internal equivalent)
```
ip -4 route list match 0/0 | cut -d' ' -f3
```