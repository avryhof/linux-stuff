#!/usr/bin/env bash
sudo pip install powerline-shell

if [[ -f "$HOME/.bashrc" ]]; then
  cat powerline-scripts/bash-linux.txt >> $HOME/.bashrc
fi
if [[ -f "$HOME/.bash_profile" ]]; then
  cat powerline-scripts/bash-linux.txt >> $HOME/.bash_profile
fi