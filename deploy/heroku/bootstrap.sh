#!/bin/bash

set -e

if [[ -z "${APPSMITH_MAIL_ENABLED}" ]]; then
    unset APPSMITH_MAIL_ENABLED
fi

if [[ -z "${APPSMITH_OAUTH2_GITHUB_CLIENT_ID}" ]] || [[ -z "${APPSMITH_OAUTH2_GITHUB_CLIENT_SECRET}" ]]; then
    unset APPSMITH_OAUTH2_GITHUB_CLIENT_ID
    unset APPSMITH_OAUTH2_GITHUB_CLIENT_SECRET
fi

if [[ -z "${APPSMITH_OAUTH2_GOOGLE_CLIENT_ID}" ]] || [[ -z "${APPSMITH_OAUTH2_GOOGLE_CLIENT_SECRET}" ]]; then
    unset APPSMITH_OAUTH2_GOOGLE_CLIENT_ID
    unset APPSMITH_OAUTH2_GOOGLE_CLIENT_SECRET
fi


cat /etc/nginx/conf.d/default.conf.template | envsubst "$(printf '$%s,' $(env | grep -Eo '^APPSMITH_[A-Z0-9_]+'))" | sed -e 's|\${\(APPSMITH_[A-Z0-9_]*\)}||g' > /etc/nginx/conf.d/default.conf.template.1

envsubst "\$PORT" < /etc/nginx/conf.d/default.conf.template.1 > /etc/nginx/conf.d/default.conf

nginx

java -Xmx128m -Dserver.port=8080 -Djava.security.egd='file:/dev/./urandom' -jar server.jar

