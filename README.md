### Official repository
```
https://github.com/appsmithorg/appsmith
```

###  How to run
1. Run `install.sh` script

```
cp appsmith/deploy/install.sh .
chmod +x install.sh
./install.sh
```

2. Check if all containers are up
```
docker ps

#Output should look like this
CONTAINER ID        IMAGE                             COMMAND                  CREATED             STATUS              PORTS                                      NAMES
3b8f2c9638d0        appsmith/appsmith-editor          "/bin/sh -c 'while :…"   17 minutes ago      Up 17 minutes       0.0.0.0:80->80/tcp, 0.0.0.0:443->443/tcp   appsmith_nginx_1
f5a365aada1c        appsmith/appsmith-server:latest   "/bin/sh -c /entrypo…"   17 minutes ago      Up 17 minutes       0.0.0.0:8080->8080/tcp                     appsmith_appsmith-internal-server_1
84b15adf470a        mongo                             "docker-entrypoint.s…"   17 minutes ago      Up 17 minutes       0.0.0.0:27017->27017/tcp                   appsmith_mongo_1
09b42d5b0f1a        redis                             "docker-entrypoint.s…"   17 minutes ago      Up 17 minutes       0.0.0.0:6379->6379/tcp                     appsmith_redis_1
90833ba6d75a        certbot/certbot                   "/bin/sh -c 'trap ex…"   17 minutes ago      Up 17 minutes       80/tcp, 443/tcp                            appsmith_certbot_1
```