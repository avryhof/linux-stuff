#!/usr/bin/env bash
CMD=$1
NEW_KERNEL_VERSION=$2
CURRENT_KERNEL=$(uname -r)

if [[ $CMD = ls ]]; then
  echo "Currently installed kernels -"
  sudo apt list --installed | grep linux-image
  echo ""
  echo Currently running: "${CURRENT_KERNEL}"
  echo ""
elif [[ $CMD == available ]]; then
  apt-cache search linux-image|grep -E -i '^linux\-image\-[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+\-[[:digit:]]+\-generic'
  echo ""
elif [[ $CMD = install ]]; then
  sudo apt install linux-image-${NEW_KERNEL_VERSION}-generic --install-recommends
elif [[ $CMD = boot ]]; then
  sudo kexec -l -t bzImage /boot/vmlinuz-${NEW_KERNEL_VERSION}-generic --initrd=/boot/initrd.img-${NEW_KERNEL_VERSION}-generic --reuse-cmdline && systemctl kexec
else
  echo "$0 <command> [Kernel Version]"
  echo ""
  echo "available           List available kernels in APT."
  echo "boot <version>      Use kexec tools to boot into a new kernel without a full reboot."
  echo "install <version>   Install this kernel version."
  echo "ls                  List Installed Kernel versions."
  echo ""
fi