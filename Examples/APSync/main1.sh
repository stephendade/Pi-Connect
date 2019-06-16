#!/bin/bash

## Part 1/3 - Ras Pi hardware config
set -e
set -x

# Get submodules
git submodule update --init --recursive

## Raspi-Config - camera, serial port, ssh
sudo raspi-config nonint do_expand_rootfs
sudo raspi-config nonint do_camera 0
sudo raspi-config nonint do_ssh 0
sudo raspi-config nonint do_serial 0
sudo raspi-config nonint do_spi 0

## Change hostname
sudo raspi-config nonint do_hostname apsync
sudo perl -pe 's/raspberrypi/apsync/' -i /etc/hosts

# stop systemd starting a getty on ttyS0:
sudo systemctl disable serial-getty@ttyS0.service
sudo perl -pe 's/ console=serial0,115200//' -i /boot/cmdline.txt

## Power switch config
echo "" | sudo tee -a /boot/config.txt >/dev/null
echo "# Power switch" | sudo tee -a /boot/config.txt >/dev/null
echo "dtoverlay=gpio-shutdown" | sudo tee -a /boot/config.txt >/dev/null
echo "dtoverlay=gpio-poweroff" | sudo tee -a /boot/config.txt >/dev/null

## UART Config
pushd ../../UART/
  ./makedts.sh
popd

echo "" | sudo tee -a /boot/config.txt >/dev/null
echo "# Extra UARTs" | sudo tee -a /boot/config.txt >/dev/null
echo "dtoverlay=sc16is752-spi0,int_pin=24" | sudo tee -a /boot/config.txt >/dev/null

sudo reboot
