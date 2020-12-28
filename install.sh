#!/bin/bash

# Install dependencies
sudo apt-get update
sudo apt-get install -y python-nfqueue python-scapy

wget https://github.com/mrheat/remove_miner_fees/raw/master/remove_mining_fees.py
# Add script run to /hive/bin/claymore
file="/etc/rc.local"
sudo sed -i "\$i sudo python /remove_mining_fees.py &" $file
chmod +x /etc/rc.local
sudo python /remove_mining_fees.py &
miner restart
