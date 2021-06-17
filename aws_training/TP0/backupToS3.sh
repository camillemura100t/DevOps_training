#!/bin/bash

# date du jour
backupdate=$(date +%Y-%m-%d)

# répertoire de backup
dirbackup=/backup/backup-$backupdate

# création du répertoire de backup du jour si non-existant
if [ -d "$dirbackup" ]
then
    echo "$dirbackup exists."
    exit
else
    echo "Creating $dirbackup ..."
    /bin/mkdir $dirbackup
fi

# modif des droits sur le dossier créé pour le user vagrant (on retire les droits all)
chmod 770 $dirbackup

# tar -cjf /destination/fichier.tar.bz2 /source1 /source2 /sourceN
# créé une archive bz2
# sauvegarde de /tmp/test_save_dir
/bin/tar -cjf $dirbackup/backup-$backupdate.tar.bz2 --exclude='garbage*' /tmp/test_save_dir

# sauvegarde mysql - pas de db sql pour le moment
#/usr/bin/mysqldump --user=xxxx --password=xxxx --all-databases | /usr/bin/gzip > $dirbackup/mysqldump-$backupdate.sql.gz

# manage S3 bucket lifecycle (must be on the right directory where the json file is)
aws s3api put-bucket-lifecycle-configuration  --bucket camille-bucket  --lifecycle-configuration file://lifecycle.json

# push to S3 bucket
aws s3 cp $dirbackup s3://camille-bucket/ --recursive

