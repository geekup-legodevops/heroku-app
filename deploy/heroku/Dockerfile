FROM appsmith/appsmith-editor as frontend

FROM appsmith/appsmith-server
RUN mkdir -p /var/www/appsmith
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
COPY --from=appsmith/appsmith-editor /var/www/appsmith /var/www/appsmith

RUN apk add --update nginx && \ 
				rm -rf /var/cache/apk/* && \
				mkdir -p /tmp/nginx/client-body && \
				apk add gettext && apk add bash && \
				rm /bin/sh && \
				ln -s /bin/bash /bin/sh



COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf.template /etc/nginx/conf.d/default.conf.template
COPY website /usr/share/nginx/html
COPY bootstrap.sh .

EXPOSE 80

ENTRYPOINT ["./bootstrap.sh"]
CMD ["$PORT"]
