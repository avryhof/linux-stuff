#!/usr/bin/env bash
sudo pip install powerline-shell

if [[ -f "$HOME/.bashrc" ]]; then
  echo 'function _update_ps1() {\n    PS1=$(powerline-shell $?)\n}' >> $HOME/.bashrc
  echo 'if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then\n    PROMPT_COMMAND='_update_ps1; $PROMPT_COMMAND"\nfi" >> $HOME/.bashrc
fi
if [[ -f "$HOME/.bash_profile" ]]; then
  echo 'function _update_ps1() {\n    PS1=$(powerline-shell $?)\n}' >> $HOME/.bash_profile
  echo 'if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then\n    PROMPT_COMMAND='_update_ps1; $PROMPT_COMMAND"\nfi" >> $HOME/.bash_profile
fi