FROM appsmith/appsmith-server

RUN apk add --update nginx && rm -rf /var/cache/apk/*
RUN mkdir -p /tmp/nginx/client-body

COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf
COPY website /usr/share/nginx/html



EXPOSE 80

CMD sh -c '/usr/sbin/nginx && java -Dserver.port=8080 $JAVA_OPTS -jar /server.jar -XX:+UseContainerSupport'

