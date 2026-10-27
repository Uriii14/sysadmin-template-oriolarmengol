#!/bin/bash

#This file must be executed as sudo "sudo ./users.sh" in order to all the commands work as expected.

# 1.
# We create the three teachers. -m creates their home dir in /home
useradd -m ferran
useradd -m pablo
useradd -m oriol

# We create the profes group
groupadd profes

# We add teachers to the profes group. -aG is append Groups.
# If only did -G would remove from all other groups (sudo, audio,...)
usermod -aG profes ferran
usermod -aG profes pablo
usermod -aG profes oriol

# 2.
# We create the new folder /tmp/prac3.
# -p is just for if we test several times, for avoiding "File exists" error.
mkdir -p /tmp/prac3
# To change ownership we use chown {owner}:{group}
chown root:profes /tmp/prac3

# 3.
# We put some text on a new file.
echo 'printf("hello world")' > /tmp/prac3/file1.txt