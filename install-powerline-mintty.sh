#!/usr/bin/env bash
mkdir -p $HOME/.bash/themes/git_bash_windows_powerline
git clone https://github.com/diesire/git_bash_windows_powerline.git $HOME/.bash/themes/git_bash_windows_powerline

if [[ -f "$HOME/.bashrc" ]]; then
  echo "# Theme\nTHEME=$HOME/.bash/themes/git_bash_windows_powerline/theme.bash\nif [ -f $THEME ]; then\n    . $THEME\nfi\nunset THEME" >> $HOME/.bashrc
fi
if [[ -f "$HOME/.bash_profile" ]]; then
  echo "# Theme\nTHEME=$HOME/.bash/themes/git_bash_windows_powerline/theme.bash\nif [ -f $THEME ]; then\n    . $THEME\nfi\nunset THEME" >> $HOME/.bash_profile
fi