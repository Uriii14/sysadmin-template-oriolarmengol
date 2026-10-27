#!/bin/bash

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
sudo usermod -aG profes oriols