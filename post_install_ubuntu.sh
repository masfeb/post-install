#!/bin/bash

LOGFILE="/var/log/post_install_ubuntu.log"
exec > >(tee -a "$LOGFILE") 2>&1

echo "Updating package lists..."
apt update

echo "Upgrading installed packages..."
apt dist-upgrade -y

echo "Allowing sudo group members to execute commands without a password..."
echo "%sudo ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/sudo_passwordless

echo "Setting timezone to Asia/Jakarta..."
timedatectl set-timezone 'Asia/Jakarta'

echo "Disabling swap..."
swapoff -a
sed -i '/swap/d' /etc/fstab

echo "Installing essential packages..."
apt install -y net-tools htop tmux locate ncdu telnet rsync vim perl swaks zip unzip git

echo "Post-installation setup complete."
