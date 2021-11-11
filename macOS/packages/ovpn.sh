#!/usr/bin/env bash

echo "Downloading OVPN-client"
OVPN=~/Downloads/OVPN.zip
curl -L https://files.ovpn.com/client/latest/OVPN.zip -o $OVPN
unzip $OVPN -d ~/Downloads/
rm -rf $OVPN