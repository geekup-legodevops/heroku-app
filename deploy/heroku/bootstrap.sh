#!/bin/bash

set -e

function get_maximum_heap(){ 
    resource=$(ulimit -u)
    if [[ "$resource" -le 256 ]]; then
        maximum_heap=128
    elif [[ "$resource" -le 512 ]]; then
        maximum_heap=256
    fi
}


function start_applcation(){
    nginx
    if [[ ! -z ${maximum_heap} ]]; then
        backend_start_command="java -Xmx${maximum_heap}m -XX:+UseContainerSupport -Dserver.port=8080 -Djava.security.egd='file:/dev/./urandom' -jar server.jar"
    else
        backend_start_command="java -XX:+UseContainerSupport -Dserver.port=8080 -Djava.security.egd='file:/dev/./urandom' -jar server.jar"
    fi
    eval $backend_start_command
}

# Check for enviroment vairalbes
if [[ -z "${APPSMITH_MAIL_ENABLED}" ]]; then
    unset APPSMITH_MAIL_ENABLED # If this field is empty is might cause application crash
fi

cat /etc/nginx/conf.d/default.conf.template | envsubst "$(printf '$%s,' $(env | grep -Eo '^APPSMITH_[A-Z0-9_]+'))" | sed -e 's|\${\(APPSMITH_[A-Z0-9_]*\)}||g' > /etc/nginx/conf.d/default.conf.template.1

envsubst "\$PORT" < /etc/nginx/conf.d/default.conf.template.1 > /etc/nginx/conf.d/default.conf

get_maximum_heap
start_applcation

