#!/bin/bash

#
# git clone https://github.com/CrateC/remove_miner_fees.git && cd remove_miner_fees && sudo chmod +x install.sh remove_mining_fees.py
#

# Install dependencies
sudo apt-get update
sudo apt-get install -y python-nfqueue python-scapy


# Add script run to /hive/bin/claymore
file="/hive/bin/claymore"
sudo sed -i -e '3s/^/# Run NoDevFee Script \n/' $file
sudo sed -i -e '4s/^/\sudo \/usr\/bin\/python \/home\/user\/remove_miner_fees\/remove_mining_fees.py \& \n/' $file

miner restart
