FROM nginx:stable-alpine

ADD conf/nginx.conf /etc/nginx/nginx.conf
#ADD conf/service.conf /etc/nginx/conf.d/service.conf

ADD script/entrypoint.sh /entrypoint.sh
ADD script/le.sh /le.sh
ADD script/dhparams.sh /dhparams.sh

RUN \
 rm /etc/nginx/conf.d/default.conf && \
 chmod +x /entrypoint.sh && \
 chmod +x /le.sh && \
 echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
 apk add  --update certbot tzdata openssl daemontools && \
 rm -rf /var/cache/apk/*

CMD ["/entrypoint.sh"]
