#!/bin/bash
#
# Copy files from timemachine backup disk need to reset mode.
# 
# @reference:
#       https://apple.stackexchange.com/questions/26776/what-is-the-mark-at-the-end-of-file-description
#

# File List
FDS=$(cat EOF
ansible
kubernetes
Work
EOF
)

cd ${HOME}

for fd in ${FDS}
do
    sudo xattr -r -c        ${fd}
    sudo chmod -R -N        ${fd}
    sudo chown -R $(whoami) ${fd}
done

