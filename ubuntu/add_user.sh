#!/usr/bin/env bash

echo "Setup user account"
echo "Enter username: "
read username

adduser $username

usermod -aG sudo $username

mkdir -p /home/$username
usermod -d /home/$username $username

echo "Created new sudo user: $username"
