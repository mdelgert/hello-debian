#!/bin/bash

sudo apt-get remove hello-debian
sudo apt-get purge hello-debian
sudo apt-get autoremove
sudo apt-get clean