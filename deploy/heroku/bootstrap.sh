#!/bin/bash
application_port="$1"

envsubst $1 < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

nginx

function get_maximum_heap(){ 
    case $(ulimit -u) in
        256)
            maximum_heap=490
            ;;
        *)
            maximum_heap=900
            ;;
    esac
}

get_maximum_heap

application_run_command="java -Xmx${maximum_heap}m -Dserver.port=8080 -Djava.security.egd='file:/dev/./urandom' -jar server.jar"

eval $application_run_command

