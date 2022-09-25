#!/bin/bash

# File backup script

dt=$(date "+%Y%m%d")
tar cvzf /tmp/jaudin_files_$dt.tar.gz /mnt/owncloud/data/files/jaudin/files && echo "targz process done"
mv /tmp/jaudin_files_$dt.tar.gz /mnt/owncloud/files_backup/
find /mnt/owncloud/files_backup/ -type f -mtime +14 -name '*.gz' -exec rm -- '{}' \;