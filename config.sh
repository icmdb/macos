#!/bin/bash

set -x

for conf in $(ls | grep -v 'LICENSE\|README.md\|config.sh\|install.sh\|ssh')
do
    ln -s $(pwd)/${conf} ${HOME}/.${conf}
done

\cp ssh/config  ${HOME}/.ssh/config
\cp ssh/servers ${HOME}/.ssh/servers
