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
# We change ownership: owner oriol and group profes
chown oriol:profes /tmp/prac3/file1.txt
# We change permissions with chmod:
# Owner can rwx (rwx = 111 = 7), group can rwx (7), ohters no permissions (000 = 0).
# So, as it's user, group, others (ugo), it will be 770.
chmod 770 /tmp/prac3/file1.txt

# 4.
# We create the three personal files
echo "Hi, Im Oriol" > /tmp/prac3/oriol.txt
echo "Hi, Im Ferran" > /tmp/prac3/ferran.txt
echo "Hi, Im Pablo" > /tmp/prac3/pablo.txt
# We make each teacher owner of its file, and from group profes
chown oriol:profes /tmp/prac3/oriol.txt
chown ferran:profes /tmp/prac3/ferran.txt
chown pablo:profes /tmp/prac3/pablo.txt
# We change permissions so the owner can rwx (7), group nothing (0), others nothing (0)
chmod 700 /tmp/prac3/oriol.txt /tmp/prac3/ferran.txt /tmp/prac3/pablo.txt