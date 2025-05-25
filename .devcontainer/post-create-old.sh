#!/bin/bash
set -e


export DEBIAN_FRONTEND=noninteractive
sudo ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
sudo apt-get update
sudo apt-get install -y tzdata devscripts build-essential debhelper fakeroot
sudo dpkg-reconfigure --frontend noninteractive tzdata
