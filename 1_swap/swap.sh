#!/bin/bash
# We must execute this file with: sudo ./swap.sh (root permissions)
# Path and size of the SWAPFILE
SWAPFILE = /home/uriii/AMSA/sysadmin-template-oriolarmengol/1_swap/swapfile
GB = 8
# Write 8GB of 0's (count for not filling the full disk)
dd if=/dev/zero of="$SWAPFILE" bs=1MiB count=$((GB*1024))

chmod 0600 "$SWAPFILE"
# Make the file a SWAP space
mkswap "$SWAPFILE"
# Enable the SWAP
swapon "$SWAPFILE"