#!/bin/bash

#set -x

touch ${HOME}/.userfile

[ -d ${HOME}/.ssh/ ] || mkdir -o ${HOME}/.ssh/
[ -L ${HOME}/.ssh/config ] || ln -s $(pwd)/ssh/config ${HOME}/.ssh/config
[ -s ${HOME}/.ssh/servers ] || \cp ssh/servers ${HOME}/.ssh/servers
[ -d /tmp/hosts ] || mkdir -pv /tmp/hosts

for conf in $(ls | grep -v "LICENSE\|.md\|.sh\|ssh\|Z")
do
    echo ln -s $(pwd)/${conf} ${HOME}/.${conf}
    [ -L ${HOME}/.${conf} ] || ln -s $(pwd)/${conf} ${HOME}/.${conf}
done



