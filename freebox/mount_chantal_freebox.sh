#!/bin/bash

sudo openvpn --client --config /etc/openvpn/client/config_openvpn_routed_orn79vpn.ovpn --auth-user-pass /root/.vpn_chantat_credentials &
sleep 10s
sudo mount /mnt/chantal