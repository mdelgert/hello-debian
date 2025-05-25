#!/bin/bash

cd ../build-artifacts

# wget https://github.com/mdelgert/hello-debian/releases/download/v1.0.0/hello-debian_0.0.2-1_amd64.deb
# wget $(curl -s https://api.github.com/repos/mdelgert/hello-debian/releases/latest | grep "browser_download_url.*deb" | cut -d '"' -f 4)
# sudo dpkg -i hello-debian_0.0.2-1_amd64.deb

wget -O release.deb $(curl -s https://api.github.com/repos/mdelgert/hello-debian/releases/latest | grep "browser_download_url.*deb" | cut -d '"' -f 4)
sudo dpkg -i release.deb
