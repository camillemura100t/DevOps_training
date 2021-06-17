#!/bin/bash
# On part du principe que docker / docker-compose sont installés
# A améliorer avec fonctions (input, select database to dump, select database to restore)

docker exec mysql-app-dk sh -c 'exec mysqldump -uroot -p"$MYSQL_ROOT_PASSWORD" docker' > ./db_dumps/database_docker.sql