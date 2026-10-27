#!/bin/bash

# 1.
# We create the three teachers. -m creates their home dir in /home
sudo useradd -m ferran
sudo useradd -m pablo
sudo useradd -m oriol

# We create the profes group
sudo groupadd profes

# We add teachers to the profes group. -aG is append Groups.
# If only did -G would remove from all other groups (sudo, audio,...)
sudo usermod -aG profes ferran
sudo usermod -aG profes pablo
sudo usermod -aG profes oriol

# 2.
# We create the new folder /tmp/prac3.
# -p is just for if we test several times, for avoiding "File exists" error.
sudo mkdir -p /tmp/prac3
# To change ownership we use chown {owner}:{group}
sudo chown root:profes /tmp/prac3
