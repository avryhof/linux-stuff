# set DISPLAY to use X terminal in WSL
# in WSL2 the localhost and network interfaces are not the same than windows
export DISPLAY=$(grep nameserver /etc/resolv.conf | awk '{print $2}'):0.0
export LIBGL_ALWAYS_INDIRECT=1
# export dbus_enable="YES"

export WIN_PROFILE=$(cmd.exe /C echo %USERPROFILE%|tr -d '\r')
export USERPROFILE=`wslpath $WIN_PROFILE`

export BROWSER=firefox
export EDITOR=nano
