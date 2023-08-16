#!/usr/bin/env bash
mkdir -p $HOME/.bash/themes/git_bash_windows_powerline
git clone https://github.com/diesire/git_bash_windows_powerline.git $HOME/.bash/themes/git_bash_windows_powerline

if [[ -f "$HOME/.bashrc" ]]; then
  cat powerline-scripts/bash-mintty.txt >> $HOME/.bashrc
fi
if [[ -f "$HOME/.bash_profile" ]]; then
  cat powerline-scripts/bash-mintty.txt >> $HOME/.bash_profile
fi