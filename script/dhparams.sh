#!/bin/sh

#replace LE_FQDN
sed -i "s|LE_FQDN|${LE_FQDN}|g" /etc/nginx/conf.d/*.conf

#generate dhparams.pem
if [ ! -f /etc/nginx/ssl/dhparams.pem ]; then
    echo "make dhparams"
    cd /etc/nginx/ssl
    openssl dhparam -out dhparams.pem 2048
    chmod 600 dhparams.pem
fi