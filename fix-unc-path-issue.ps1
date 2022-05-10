# Fix for: '\\wsl$\Ubuntu-22.04\home\username' CMD.EXE was started with the above path as the current directory. UNC paths are not supported. Defaulting to Windows directory.
setx WSLENV BASH_ENV/u
setx BASH_ENV /etc/bash.bashrc