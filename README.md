# linux stuff

This repo focuses on some basic setup tasks for ubuntu and WSL

bash-prompt.txt

- this can be added to your .bashrc/.bash_profile to show the current git branch and activated python
  virtualenv in your prompt.

install-synaptic.sh

- Installs the Synaptic Package manager, and fixes the issue with quick filter not working. Sometimes it's just easier
  to find the right package(s) with Synaptic than it is to use apt-cache search.

ppa.ssh

- A few PPAs for WSL. Apt packages for Firefox, since snap isn't officially supported, and wslu official repo, since the
  system package doesn't seem to exist.

setup-deadsnakes.sh

- This is just here more so I remember the repo. You want this if you need to install python versions that aren't in the
  main repos.

win-10-theme.sh

- For WSL - Install dark/light Windows 10 themes, and an icon theme, as well as some tools to update your theme. (
  gnome-tweak and lxappearance)

wsl-install-firefox.sh

- YOU DON"T NEED THIS IF YOU USE ppa.sh. This will download firefox from the mozilla site, and overwrite what is
  currently installed with that version. It's an ugly hack to get around systemd.
- this uses extra/firefox.sh to launch firefox. It just updates the paths to go to /opt/firefox, and puts a "&" at the
  end of the line that launches it so it detaches from your terminal.

wsl-profile.sh

- Some handy things to have in your .profile/.bashrc/.bash_profile in WSL.