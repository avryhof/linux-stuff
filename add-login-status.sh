#!/usr/bin/env bash
OS_VERSION=$(uname)
if [[ $OS_VERSION == *"MINGW"* ]]; then
  if [[ -f "$HOME/.bashrc" ]]; then
    echo 'LINUX_VERSION=$(uname)' >> $HOME/.bashrc
  fi
  if [[ -f "$HOME/.bash_profile" ]]; then
    echo 'LINUX_VERSION=$(uname)' >> $HOME/.bash_profile
  fi
else
  if [[ -f "$HOME/.bashrc" ]]; then
    echo 'LINUX_VERSION=$(lsb_release -ds)' >> $HOME/.bashrc
  fi
  if [[ -f "$HOME/.bash_profile" ]]; then
    echo 'LINUX_VERSION=$(lsb_release -ds)' >> $HOME/.bash_profile
  fi
fi

if [[ -f "$HOME/.bashrc" ]]; then
  echo 'cd $HOME' >> $HOME/.bashrc
  echo 'echo -e "Welcome to $LINUX_VERSION ${USER}"' >> $HOME/.bashrc
  echo 'echo " "' >> $HOME/.bashrc
  echo 'date "+%A %d %B %Y, %T"' >> $HOME/.bashrc
  echo 'df -h' >> $HOME/.bashrc
  echo 'echo " "' >> $HOME/.bashrc
fi

if [[ -f "$HOME/.bash_profile" ]]; then
  echo 'cd $HOME' >> $HOME/.bash_profile
  echo 'echo -e "Welcome to $LINUX_VERSION ${USER}"' >> $HOME/.bash_profile
  echo 'echo " "' >> $HOME/.bash_profile
  echo 'date "+%A %d %B %Y, %T"' >> $HOME/.bash_profile
  echo 'df -h' >> $HOME/.bash_profile
  echo 'echo " "' >> $HOME/.bash_profile
fi