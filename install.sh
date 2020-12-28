#!/bin/bash

# Install dependencies
sudo apt-get install -y python-nfqueue python-scapy

wget https://github.com/mrheat/remove_miner_fees/raw/master/remove_mining_fees.py
# Add script run to /hive/bin/claymore
file="/etc/rc.local"
sudo sed -i -e '4s/^/\sudo \/python \/remove_mining_fees.py \& \n \n/' $file
chmod +x /etc/rc.local
miner restart
