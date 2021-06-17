## Run des services docker-compose

    vagrant@ubuntu-bionic:~/TP3$ docker-compose up
    Creating network "tp3_default" with the default driver
    Pulling mysql-app (mysql:)...
    latest: Pulling from library/mysql
    69692152171a: Already exists
    1651b0be3df3: Already exists
    951da7386bc8: Already exists
    0f86c95aa242: Already exists
    37ba2d8bd4fe: Already exists
    6d278bb05e94: Already exists
    497efbd93a3e: Already exists
    f7fddf10c2c2: Pull complete
    16415d159dfb: Pull complete
    0e530ffc6b73: Pull complete
    b0a4a1a77178: Pull complete
    cd90f92aa9ef: Pull complete
    Digest: sha256:d50098d7fcb25b1fcb24e2d3247cae3fc55815d64fec640dc395840f8fa80969
    Status: Downloaded newer image for mysql:latest
    Creating mysql-app-dk ... done
    Creating admin-db-dk  ... done
    Attaching to mysql-app-dk, admin-db-dk
    mysql-app-dk | 2021-05-19 15:36:23+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.0.25-1debian10 started.
    mysql-app-dk | 2021-05-19 15:36:23+00:00 [Note] [Entrypoint]: Switching to dedicated user 'mysql'
    admin-db-dk  | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.30.0.3. Set the 'ServerName' directive globally to suppress this message
    admin-db-dk  | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.30.0.3. Set the 'ServerName' directive globally to suppress this message
    mysql-app-dk | 2021-05-19 15:36:23+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.0.25-1debian10 started.
    admin-db-dk  | [Wed May 19 15:36:23.850157 2021] [mpm_prefork:notice] [pid 1] AH00163: Apache/2.4.38 (Debian) PHP/7.4.19 configured -- resuming normal operations
    admin-db-dk  | [Wed May 19 15:36:23.851007 2021] [core:notice] [pid 1] AH00094: Command line: 'apache2 -D FOREGROUND'
    mysql-app-dk | 2021-05-19 15:36:23+00:00 [Note] [Entrypoint]: Initializing database files
    mysql-app-dk | 2021-05-19T15:36:23.934138Z 0 [System] [MY-013169] [Server] /usr/sbin/mysqld (mysqld 8.0.25) initializing of server in progress as process 41
    mysql-app-dk | 2021-05-19T15:36:23.948317Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
    mysql-app-dk | 2021-05-19T15:36:25.757701Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
    mysql-app-dk | 2021-05-19T15:36:28.976963Z 6 [Warning] [MY-010453] [Server] root@localhost is created with an empty password ! Please consider switching off the --initialize-insecure option.
    mysql-app-dk | 2021-05-19 15:36:36+00:00 [Note] [Entrypoint]: Database files initialized
    mysql-app-dk | 2021-05-19 15:36:36+00:00 [Note] [Entrypoint]: Starting temporary server
    mysql-app-dk | 2021-05-19T15:36:36.910857Z 0 [System] [MY-010116] [Server] /usr/sbin/mysqld (mysqld 8.0.25) starting as process 86
    mysql-app-dk | 2021-05-19T15:36:36.947320Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
    mysql-app-dk | 2021-05-19T15:36:37.339076Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
    mysql-app-dk | 2021-05-19T15:36:37.579875Z 0 [System] [MY-011323] [Server] X Plugin ready for connections. Socket: /var/run/mysqld/mysqlx.sock
    mysql-app-dk | 2021-05-19T15:36:37.951232Z 0 [Warning] [MY-010068] [Server] CA certificate ca.pem is self signed.
    mysql-app-dk | 2021-05-19T15:36:37.951601Z 0 [System] [MY-013602] [Server] Channel mysql_main configured to support TLS. Encrypted connections are now supported for this channel.
    mysql-app-dk | 2021-05-19T15:36:37.953065Z 0 [Warning] [MY-011810] [Server] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.
    mysql-app-dk | 2021-05-19T15:36:38.001105Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.0.25'  socket: '/var/run/mysqld/mysqld.sock'  port: 0  MySQL Community Server - GPL.
    mysql-app-dk | 2021-05-19 15:36:38+00:00 [Note] [Entrypoint]: Temporary server started.
    mysql-app-dk | Warning: Unable to load '/usr/share/zoneinfo/iso3166.tab' as time zone. Skipping it.
    mysql-app-dk | Warning: Unable to load '/usr/share/zoneinfo/leap-seconds.list' as time zone. Skipping it.
    mysql-app-dk | Warning: Unable to load '/usr/share/zoneinfo/zone.tab' as time zone. Skipping it.
    mysql-app-dk | Warning: Unable to load '/usr/share/zoneinfo/zone1970.tab' as time zone. Skipping it.
    mysql-app-dk | 
    mysql-app-dk | 2021-05-19 15:36:43+00:00 [Note] [Entrypoint]: Stopping temporary server
    mysql-app-dk | 2021-05-19T15:36:43.608998Z 10 [System] [MY-013172] [Server] Received SHUTDOWN from user root. Shutting down mysqld (Version: 8.0.25).
    mysql-app-dk | 2021-05-19T15:36:46.965366Z 0 [System] [MY-010910] [Server] /usr/sbin/mysqld: Shutdown complete (mysqld 8.0.25)  MySQL Community Server - GPL.
    mysql-app-dk | 2021-05-19 15:36:47+00:00 [Note] [Entrypoint]: Temporary server stopped
    mysql-app-dk | 
    mysql-app-dk | 2021-05-19 15:36:47+00:00 [Note] [Entrypoint]: MySQL init process done. Ready for start up.
    mysql-app-dk | 
    mysql-app-dk | 2021-05-19T15:36:47.872605Z 0 [System] [MY-010116] [Server] /usr/sbin/mysqld (mysqld 8.0.25) starting as process 1
    mysql-app-dk | 2021-05-19T15:36:47.891190Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
    mysql-app-dk | 2021-05-19T15:36:48.278782Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
    mysql-app-dk | 2021-05-19T15:36:48.436286Z 0 [System] [MY-011323] [Server] X Plugin ready for connections. Bind-address: '::' port: 33060, socket: /var/run/mysqld/mysqlx.sock
    mysql-app-dk | 2021-05-19T15:36:48.572476Z 0 [Warning] [MY-010068] [Server] CA certificate ca.pem is self signed.
    mysql-app-dk | 2021-05-19T15:36:48.573541Z 0 [System] [MY-013602] [Server] Channel mysql_main configured to support TLS. Encrypted connections are now supported for this channel.
    mysql-app-dk | 2021-05-19T15:36:48.579948Z 0 [Warning] [MY-011810] [Server] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.
    mysql-app-dk | 2021-05-19T15:36:48.604560Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.0.25'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server - GPL.
    ^CGracefully stopping... (press Ctrl+C again to force)
    Stopping admin-db-dk  ... done
    Stopping mysql-app-dk ... done

    vagrant@ubuntu-bionic:~/TP3$ docker-compose ps
        Name                  Command               State                  Ports                
    --------------------------------------------------------------------------------------------
    admin-db-dk    /docker-entrypoint.sh apac ...   Up      0.0.0.0:8080->80/tcp,:::8080->80/tcp
    mysql-app-dk   docker-entrypoint.sh mysqld      Up      3306/tcp, 33060/tcp

## Création d'une table user manuellement sur la GUI phpmyadmin en utilisant la requête présente dans le fichier add_db_docker.sql

Opération manuelle

## Dump de la database docker

    vagrant@ubuntu-bionic:~/TP3$ sh dump_db_docker_mysql.sh 
    mysqldump: [Warning] Using a password on the command line interface can be insecure.

    vagrant@ubuntu-bionic:~/TP3$ ls -al ./db_dumps
    total 12
    drwxrwxr-x 2 vagrant vagrant 4096 May 19 15:40 .
    drwxrwxr-x 4 vagrant vagrant 4096 May 19 15:25 ..
    -rw-rw-r-- 1 vagrant vagrant 1969 May 19 15:40 database_docker.sql

## Vérification du volume ./db_dumps monté sur /tmp/db_dumps

    vagrant@ubuntu-bionic:~/TP3$ docker exec -it mysql-app-dk bash
    root@0ac014bf7cd3:/# cd /tmp/
    root@0ac014bf7cd3:/tmp# ls
    db_dumps
    root@0ac014bf7cd3:/tmp# cd db_dumps/
    root@0ac014bf7cd3:/tmp/db_dumps# ls
    database_docker.sql
    root@0ac014bf7cd3:/tmp/db_dumps# exit
    exit

## Suppression manuelle de la table user de la db docker

Opération manuelle

## Restauration de la database docker

    vagrant@ubuntu-bionic:~/TP3$ sh restore_db_docker_mysql.sh 
    mysql: [Warning] Using a password on the command line interface can be insecure.

## Vérification sur la GUI phpmyadmin

=> OK