#!/bin/bash
# On part du principe que docker / docker-compose sont installés
# Ne fonctionne que si la database est déjà créée
# A améliorer avec fonctions (input, select database to dump, select database to restore)

docker exec -i mysql-app-dk sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD" docker' < ./db_dumps/database_docker.sql