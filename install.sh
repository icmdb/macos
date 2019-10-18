#!/bin/bash
#
# @reference:
#   https://brew.sh/
#   https://github.com/pyenv/pyenv
#   https://github.com/pyenv/pyenv-installer
#   https://www.java.com/zh_CN/download/help/mac_install.xml
#   https://www.oracle.com/technetwork/java/javase/downloads/index.html
#   https://www.oracle.com/technetwork/java/javase/downloads/java-archive-javase8-2177648.html
#   https://maven.apache.org/install.html
#

# ssh-keygen -t rsa -C "your.email@example.com" -b 4096

touch ~/.userfile

[ -d "${HOME}/Apps/bin" ]        || mkdir -pv ${HOME}/Apps/bin
[ -d "${HOME}/Work/github.com" ] || mkdir -pv ${HOME}/Work/github.com/

# install xcode
#   https://developer.apple.com/xcode/
xcode-select --install

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install \
    readline \
    xz \
    zlib
    telnet \
    tree \
    wget
##      /usr/local/etc/openssl@1.1/certs
##      /usr/local/opt/openssl@1.1/bin/c_rehash
#echo 'export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"' >> ~/.userfile
#export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"         >> ~/.userfile
#export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"    >> ~/.userfile
## library
grep '# library' ~/.userfile || cat >> ~/.userfile <<EOL
# library $(date +%F_%T)
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/zlib/lib/pkgconfig"
EOL

# install python & pip
#   https://pip.pypa.io/en/stable/installing/
#   https://docs.conda.io/en/latest/miniconda.html
## pip for python2 default
wget -P ~/Download/ https://bootstrap.pypa.io/get-pip.py
sudo python ~/Download/get-pip.py
sudo pip install virtualenv
## conda
wget -P ~/Download/ https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
sh ~/Download/Miniconda3-latest-MacOSX-x86_64.sh
conda create test
conda info -e
conda activate test
which python
## clone pyenv & create link
#git clone https://github.com/pyenv/pyenv ${HOME}/Work/github.com/pyenv
#ln -s ${HOME}/Work/github.com/pyenv ${HOME}/.pyenv
#curl https://pyenv.run | bash
#echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.userfile
#source ~/.userfile
#mkdir ~/.pyenv/cache
#wget -c -P ~/.pyenv/cache/
#pyenv install 2.7.16
#pyenv install 3.7.3
#which python
#which pip
### update pip
#pip install --upgrade pip
### install virtualenv
#pip install virtualenv

# install golang
#       https://golang.org/dl/
#       https://golang.org/doc/install/source
#       https://sourabhbajaj.com/mac-setup/Go/README.html
#git clone https://go.googlesource.com/go ~/Work/github.com/go
#cd ~/Work/github.com/golang/go
#git checkout go1.13.1
#. ~/.userfile
#export GOROOT_BOOTSTRAP=~/Apps/go1.13.1
#mkdir -p ${GOROOT_BOOTSTRAP}
#ln -s ~/Apps/go1.13.1 ~/Apps/go
#./all.bash
## from package
wget -P ~/Downloads/ https://dl.google.com/go/go1.13.1.darwin-amd64.pkg
open ~/Downloads/go1.13.1.darwin-amd64.pkg

# install node
#   https://github.com/nvm-sh/nvm   
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash


# install java
#   

# install maven
wget -c -P ~/Downloads/ http://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/3.6.2/binaries/apache-maven-3.6.2-bin.zip
unzip   -d ~/Apps/ ~/Downloads/apache-maven-3.6.2-bin.zip
ln -s      ~/Apps/apache-maven-3.6.2 ~/Apps/maven

# install docker
#   

# install kubectl helm
#   https://helm.sh/docs/using_helm/#installing-helm   
wget https://get.helm.sh/helm-v3.0.0-beta.3-darwin-amd64.tar.gz

# install terraform
#   https://github.com/tfutils/tfenv
git clone https://github.com/tfutils/tfenv.git ~/Work/github.com/tfutils/tfenv
[ -L ~/.tfenv ] || ln -s ~/Work/github.com/tfutils/tfenv ~/.tfenv
grep tfenv ~/.userfile || echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.userfile
source ~/.userfile
tfenv install $(tfenv list-remote|head -1)

# Sublime
#   https://www.sublimetext.com/docs/3/osx_command_line.html
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/Apps/bin

# VSCode
grep 'Visual Studio' ~/.userfile || cat << EOF >> ~/.userfile
# Add Visual Studio Code (code)
#   https://code.visualstudio.com/docs/setup/mac
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF

# VirtualBox
#   @TODO:
