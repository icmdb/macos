#!/bin/bash

#set -x

UNAME_S="$(uname -s)"

touch ${HOME}/.userfile

[ -d /tmp/hosts ]              || mkdir -pv /tmp/hosts
[ -d ${HOME}/.ssh/ ]           || mkdir -pv ${HOME}/.ssh/
[ -d ${HOME}/.ssh/ssh.conf.d ] || mkdir -pv ${HOME}/.ssh/ssh.conf.d/
[ -f ${HOME}/.ssh/config ]     || ln -s $(pwd)/ssh/config ${HOME}/.ssh/config

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

case "${UNAME_S}" in 
    Darwin)
        mac_config
        ;;
    Linux)
        linux_cofnig
        ;;
esac
