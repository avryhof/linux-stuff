#!/usr/bin/env bash
if [ "$(whoami)" != "root" ]; then
  echo Please run this script as root or using sudo
  exit
else
  apt install -y bzip2
  wget -O firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US"
  tar -xf firefox.tar.bz2
  mv firefox /opt/
  ln -s /opt/firefox/firefox-bin /usr/lib/firefox/firefox-100
  rm firefox.tar.bz2

  # These lines can modify an existing firefox.sh file to run our new version
  # sed -i -e "s=/usr/lib/firefox=/opt/firefox=" /usr/lib/firefox/firefox.sh
  # sed -i -e "s/MOZ_APP_NAME=firefox/MOZ_APP_NAME=firefox-100/" /usr/lib/firefox/firefox.sh

  # Restore original
  # sed -i -e "s=/opt/firefox=/usr/lib/firefox=" /usr/lib/firefox/firefox.sh
  # sed -i -e "s/MOZ_APP_NAME=firefox-100/MOZ_APP_NAME=firefox/" /usr/lib/firefox/firefox.sh

  # This replaces the firefox.sh script with one that contains our new firefox version, and also appends "&" to the exec
  # command, so it runs in the background on WSL.  This allows the app to run, and our shell to remain available.
  cp ./extra/firefox.sh /usr/lib/firefox/firefox.sh
fi
