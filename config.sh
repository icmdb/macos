#!/bin/bash

#set -x

touch ${HOME}/.userfile

for conf in $(ls | grep -v "LICENSE\|.md\|.sh\|ssh\|Z")
do
    echo ln -s $(pwd)/${conf} ${HOME}/.${conf}
    ln -s $(pwd)/${conf} ${HOME}/.${conf}
done


# https://github.com/pyenv/pyenv 
cd ${HOME}/Work/github.com/
git clone https://github.com/pyenv/pyenv.git ${HOME}/Work/github.com/pyenv
ln -s ${HOME}/Work/github.com/pyenv ${HOME}/.pyenv

# https://github.com/pyenv/pyenv-installer
curl https://pyenv.run | bash
source ~/.profile
pyenv update

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.userfile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.userfile
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.userfile

#\cp ssh/config  ${HOME}/.ssh/config
#[ -s ${HOME}/.ssh/servers ] || \cp ssh/servers ${HOME}/.ssh/servers
#[ -d /tmp/hosts ] || mkdir -pv /tmp/hosts
