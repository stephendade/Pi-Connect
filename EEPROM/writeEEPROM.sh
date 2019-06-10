#!/bin/bash
cd ./hats/eepromutils
make
cd ../../
./hats/eepromutils/eepmake Pi-Connect-v1.txt Pi-Connect-v1.bin
sudo ./hats/eepromutils/eepflash.sh -w -f=Pi-Connect-v1.bin -t=24c32 -d=0 -a=50
