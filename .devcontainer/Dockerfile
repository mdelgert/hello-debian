FROM ubuntu:24.04

# Disable interactive frontend for tzdata
ENV DEBIAN_FRONTEND=noninteractive

# Set timezone + install packages
RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && \
    apt-get update && \
    apt-get install -y tzdata devscripts build-essential debhelper fakeroot sudo && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Create vscode user with passwordless sudo
# RUN useradd -m vscode && \
#     echo 'vscode ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/vscode && \
#     chmod 0440 /etc/sudoers.d/vscode
