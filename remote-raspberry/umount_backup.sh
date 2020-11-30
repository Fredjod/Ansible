#!/bin/bash

sudo service nmbd stop
sudo service smbd stop
sudo /etc/init.d/avahi-daemon stop
sudo umount /mnt/backup