#!/bin/bash

set -e
set -x

# This adds in the relevant config to /boot/config.txt

## Raspi-Config - serial port enabled, no console
sudo raspi-config nonint do_serial 2

# Power switch config
echo "" | sudo tee -a /boot/config.txt >/dev/null
echo "# Power switch" | sudo tee -a /boot/config.txt >/dev/null
echo "dtoverlay=gpio-shutdown" | sudo tee -a /boot/config.txt >/dev/null
echo "dtoverlay=gpio-poweroff" | sudo tee -a /boot/config.txt >/dev/null

