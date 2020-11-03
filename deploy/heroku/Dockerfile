FROM appsmith/appsmith-server

RUN apk add --update nginx && rm -rf /var/cache/apk/*
RUN mkdir -p /tmp/nginx/client-body
RUN apk add gettext

COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf.template /etc/nginx/conf.d/default.conf.template
COPY website /usr/share/nginx/html



EXPOSE 80

ENTRYPOINT []
CMD sh -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;' && java -Dserver.port=8080 -Djava.security.egd='file:/dev/./urandom' -jar server.jar"

