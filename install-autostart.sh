#!/bin/bash 

url=$1
if [ -z "$url" ]; then
    echo "url param required"
    exit 1
fi

cat >/etc/systemd/system/letsencrypt.service <<EOF
[Unit]
Description=letsencrypt
Requires=docker.service
After=docker.service dbus.socket

[Service]
Type=simple
Restart=always
RestartSec=5s
ExecStartPre=-/usr/bin/docker stop letsencrypt
ExecStart=$(dirname "$(readlink -f "$0")")/docker-run.sh $1
ExecStop=-/usr/bin/docker stop letsencrypt

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl enable letsencrypt
