#!/bin/bash

sudo nmbd stop
sudo smbd stop
sudo /etc/init.d/avahi-daemon stop
sudo umount /mnt/backup
sudo shutdown -h now