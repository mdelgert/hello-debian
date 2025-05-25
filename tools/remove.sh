#!/bin/bash

sudo apt-get remove hello-debian -y
sudo apt-get purge hello-debian -y
sudo apt-get autoremove -y
sudo apt-get clean -y