#!/bin/bash

for conf in $(ls | grep -v 'LICENSE\|README.md\|config.sh')
do
    echo ln -s $(pwd)/${conf} ${HOME}/.${conf}
done

