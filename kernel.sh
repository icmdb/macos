#!/bin/bash
#
# Setting kernel
#

ulimit -n
# max connections
sysctl kern.maxfiles
# max connection per process
sysctl kern.maxfilesperproc
# port range
sysctl net.inet.ip.portrange

#ulimit -n 1048576
#sudo sysctl -w kern.maxfiles=1048600
#sudo sysctl -w kern.maxfilesperproc=1048576
#sysctl -w net.inet.ip.portrange.first=32768

[ -s /etc/sysctl.conf] || touch /etc/sysctl.conf
cat > /etc/sysctl.conf <<EOL
kern.maxfiles=1048600
kern.maxfilesperproc=1048576
net.inet.ip.portrange.first=49152
net.inet.ip.portrange.last=65535
EOL


# NTFS support for mac
 /etc/fstab
