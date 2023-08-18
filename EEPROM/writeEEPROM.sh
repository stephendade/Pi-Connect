#!/bin/bash

#requires the i2c-tools package
# and i2c enabled
# and "dtparam=i2c0=on" in /boot/config.txt
# and bcm2835-v4l2 commented out in /etc/modules
# and camera disabled
cd ./hats/eepromutils
make
cd ../../
./hats/eepromutils/eepmake Pi-Connect-Lite-v2.txt Pi-Connect-Lite-v2.bin
sudo ./hats/eepromutils/eepflash.sh -w -f=Pi-Connect-Lite-v2.bin -t=24c32 -d=0 -a=50

#Verify via: ls /proc/device-tree/hat/, then "cat" the folders
