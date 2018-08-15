


### Create user
```
docker exec -it letsencrypt htpasswd -c /config/nginx/.htpasswd <username>
```

### Add user
```
docker exec -it letsencrypt htpasswd /config/nginx/.htpasswd <username>
```

### Logs in realtime
```
docker logs -f letsencrypt
```
