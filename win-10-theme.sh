#!/usr/bin/env bash
WORKING_DIR=${PWD}
echo "Install pre-requisites: unzip, lxappearance, gnome-tweaks, miocrosoft core fonts, murrine theme engine, and pixmap"
sudo apt install -y unzip lxappearance gnome-tweaks msttcorefonts gtk2-engines-murrine pixmap
# Desktop themes
echo "Extracting Windows 10 dark and light themes - https://github.com/B00merang-Project/Windows-10"
sudo unzip -d /usr/share/themes/ themes/3.2.zip
sudo unzip -d /usr/share/themes/3.2-dark.zip

# Icon theme
echo "Downloading We10X icon theme (this can take awhile) - https://github.com/yeyushengfan258/We10X-icon-theme"
git clone https://github.com/yeyushengfan258/We10X-icon-theme.git
cd "${WORKING_DIR}"
cd "${WORKING_DIR}/We10X-icon-theme"
sudo ./install.sh
cd "${WORKING_DIR}"
echo "Cleaning up..."
rm -fr "${WORKING_DIR}/We10X-icon-theme"

echo "Installing Windows 8.1 Cursor theme - https://www.gnome-look.org/p/1084938/"
tar -xvf themes/175797-Win-8.1-NS-S.tar.bz2
sudo cp -rf Win-8.1-NS-S/Win-8.1-S /usr/share/icons/
sudo cp -rf Win-8.1-NS-S/Win-8.1-NS /usr/share/icons/
echo "Cleaning up..."
rm -fr Win-8.1-NS-S/

echo "Now you can adjust your X Server application appearance with either lxappearance, or gnome-tweaks."