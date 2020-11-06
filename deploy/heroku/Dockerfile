FROM appsmith/appsmith-editor as frontend

FROM appsmith/appsmith-server
RUN mkdir -p /var/www/appsmith
COPY --from=appsmith/appsmith-editor /var/www/appsmith /var/www/appsmith

RUN apk add --update nginx && rm -rf /var/cache/apk/*
RUN mkdir -p /tmp/nginx/client-body
RUN apk add gettext
RUN apk add bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh



COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf.template /etc/nginx/conf.d/default.conf.template
COPY website /usr/share/nginx/html


EXPOSE 80

ENTRYPOINT []
CMD sh -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf && nginx && java -Xmx490m -Dserver.port=8080 -Djava.security.egd='file:/dev/./urandom' -jar server.jar"

