#!/bin/bash
#
# @reference:
#   https://www.java.com/zh_CN/download/help/mac_install.xml
#   https://www.oracle.com/technetwork/java/javase/downloads/index.html
#   https://www.oracle.com/technetwork/java/javase/downloads/java-archive-javase8-2177648.html
#   https://maven.apache.org/install.html
#

# ssh-keygen -t rsa -C "your.email@example.com" -b 4096

# install xcode
xcode-select --install

[ -d "${HOME}/Apps" ] || mkdir -pv ${HOME}/Apps/

# install brew
# @TODO
brew install telnet
brew install tree
brew install wget

# install java 

# install golang


# install python
brew install python
sudo easy_install pip

# install node

# install maven
mkdir   -p ~/Apps/
wget -c -P ~/Downloads/ http://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/3.6.2/binaries/apache-maven-3.6.2-bin.zip
unzip   -d ~/Apps/ ~/Downloads/apache-maven-3.6.2-bin.zip
ln -s ~/Apps/apache-maven-3.6.2 ~/Apps/maven

# install kubectl helm
wget https://get.helm.sh/helm-v3.0.0-beta.3-darwin-amd64.tar.gz

# install terraform
