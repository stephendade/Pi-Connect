#!/bin/bash

set -e
set -x

# This adds in the relevant config to /boot/config.txt

## Raspi-Config - serial port
sudo raspi-config nonint do_serial 0

# stop systemd starting a getty on ttyS0:
sudo systemctl disable serial-getty@ttyS0.service
sudo perl -pe 's/ console=serial0,115200//' -i /boot/cmdline.txt

# Power switch config
echo "" | sudo tee -a /boot/config.txt >/dev/null
echo "# Power switch" | sudo tee -a /boot/config.txt >/dev/null
echo "dtoverlay=gpio-shutdown" | sudo tee -a /boot/config.txt >/dev/null
echo "dtoverlay=gpio-poweroff" | sudo tee -a /boot/config.txt >/dev/null

