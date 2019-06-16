#!/bin/bash

set -e
set -x

sudo apt install python-pip libtalloc-dev -y
pip2 install future --user

pushd ~/
  rm -rf ./APWeb
  git clone -b video_streaming https://github.com/shortstheory/APWeb.git
popd

pushd ~/APWeb
 git submodule update --init --recursive
 make
popd

sudo cp APWeb.service /etc/systemd/system/APWeb.service
sudo systemctl enable APWeb.service
sudo systemctl start APWeb.service

