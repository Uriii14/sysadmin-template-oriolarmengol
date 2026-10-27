#!/bin/bash

# We'll execute this file with sudo "sudo ./tmpfs.sh" for not adding sudo every command.

# We create the directory with the "mount point" in this folder (./)
mkdir -p ./mytmpfs
# We create the tmpfs, with the simple command -t tmpfs is for type, -o(ptions) size is for defining a size
# so it doesn't get all RAM, followed by name and mount point.
mount -t tmpfs -o size=2G tmpfs ./mytmpfs