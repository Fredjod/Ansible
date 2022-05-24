#!/bin/bash

# DB backup script

docker exec owncloud_server occ maintenance:mode --on
dt=$(date "+%Y%m%d")
docker exec owncloud_mariadb /usr/bin/mysqldump -u root --password=owncloud --single-transaction owncloud --result-file=/var/lib/backup/owncloud_$dt.sql
docker exec owncloud_mariadb gzip /var/lib/backup/owncloud_$dt.sql
docker exec owncloud_mariadb find /var/lib/backup/ -type f -mtime +14 -name '*.gz' -exec rm -- '{}' \;
docker exec owncloud_server occ maintenance:mode --off