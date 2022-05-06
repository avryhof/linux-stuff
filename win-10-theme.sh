#!/usr/bin/env bash
WORKING_DIR=${PWD}
sudo apt install -y unzip lxappearance gnome-tweaks msttcorefonts gtk2-engines-murrine pixmap
# Desktop themes
mkdir -p ~/.themes
wget https://github.com/B00merang-Project/Windows-10/archive/3.2.zip
wget https://github.com/B00merang-Project/Windows-10-Dark/archive/3.2-dark.zip
unzip -d ~/.themes/3.2.zip
unzip -d ~/.themes/3.2-dark.zip
# Icon theme
cd "${WORKING_DIR}"
git clone https://github.com/yeyushengfan258/We10X-icon-theme.git
cd ${PWD}/We10X-icon-theme
sudo ./install.sh
cd "${WORKING_DIR}"
rm -fr "${WORKING_DIR}/We10X-icon-theme"