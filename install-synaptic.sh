#!/usr/bin/env bash
# Install Synaptic and enable the quick filter, which doesn't seem to happen by default anymore
sudo apt install -y synaptic apt-xapian-index
sudo update-apt-xapian-index -vf
