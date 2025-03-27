#!/bin/bash

LOGFILE="/var/log/post_install_rhel.log"
exec > >(tee -a "$LOGFILE") 2>&1

echo "Checking for updates..."
dnf check-update

echo "Updating installed packages..."
dnf update -y

echo "Setting timezone to Asia/Jakarta..."
timedatectl set-timezone Asia/Jakarta

echo "Installing EPEL repository..."
dnf install -y epel-release

echo "Installing essential packages..."
dnf install -y net-tools htop tmux locate ncdu telnet rsync vim perl swaks zip unzip git

echo "Post-installation setup complete."
