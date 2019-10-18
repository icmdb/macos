#!/bin/bash

#set -x

OS_NAME="$(uname -s)"

touch ${HOME}/.userfile

[ -d ${HOME}/.ssh/ ] || mkdir -o ${HOME}/.ssh/
[ -L ${HOME}/.ssh/config ] || ln -s $(pwd)/ssh/config ${HOME}/.ssh/config
[ -s ${HOME}/.ssh/servers ] || \cp ssh/servers ${HOME}/.ssh/servers
[ -d /tmp/hosts ] || mkdir -pv /tmp/hosts

for conf in $(ls | grep -v "LICENSE\|.md\|.sh\|ssh\|Z\|ansible")
do
    echo ln -s $(pwd)/${conf} ${HOME}/.${conf}
    [ -L ${HOME}/.${conf} ] || ln -s $(pwd)/${conf} ${HOME}/.${conf}
done

mac_config() {
    defaults write -g ApplePressAndHoldEnabled -bool false

    mkdir -pv /Users/$(whoami)/Documents/Screenshots
    defaults write com.apple.screencapture location /Users/$(whoami)/Documents/Screenshots
}

linux_config() {
    pass
}

case "${OS_NAME}" in 
    Darwin)
        mac_config;;
        break
    Linux)
        linux_cofnig;;
        break
esac
