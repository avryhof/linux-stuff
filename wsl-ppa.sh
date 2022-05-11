#!/usr/bin/env bash
sudo apt install software-properties-common apt-transport-https wget curl ca-certificates gnupg2 ubuntu-keyring -y
sudo add-apt-repository ppa:mati75/nosnapbrowsers
sudo add-apt-repository ppa:wslutilities/wslu
wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt update && sudo apt upgrade -y packages-microsoft-prod