# ~/.profile

# prompt
cmd_prompt='$'
[[ $(id -u) -eq 0 ]] && cmd_prompt='#'
PS1='\[\033[0;32m\][\u@\h \[\033[01;31m\]\w\[\033[00;35m\]$(parse_git_branch)\[\033[00m\]\[\033[0;32m\]]'${cmd_prompt}'\[\033[00m\] '

# alias
alias vi='vim'
alias ls='ls -G'
alias ll='ls -l'
alias grep='grep --color'

# function
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \(\1\)/'
}
tag-commit() {
    git rev-parse --short HEAD
}

# path
alias todownload="cd ${HOME}/Downloads"
alias toapps="cd ${HOME}/Apps"
alias towork="cd ${HOME}/Work"
alias github="cd ${HOME}/Work/github.com"
alias gitlab="cd ${HOME}/Work/gitlab"

# PATH
export PATH=.:$PATH
export PATH=${HOME}/Apps/bin:$PATH
export PATH=${HOME}/homebrew/bin:$PATH
export PATH=${HOME}/Apps/maven/bin:${PATH}
export PATH=${HOME}/Apps/helm/:${PATH}


# -----------------------------------------
#      Java
# -----------------------------------------
export PATH="/usr/local/opt/python/libexec/bin:$PATH"


# -----------------------------------------
#      Java
# -----------------------------------------
#export JAVA_HOME=
#export JAVA_CLASSIC=
#export JAVA_LIB=
#export M2_HOME=


# -----------------------------------------
#      Golang
# -----------------------------------------
#[ -s ~/.gorc ] && . ~/.gorc
[ -d ~/Work/go/src ]     || mkdir -p ~/Work/go/src
[ -d ~/Work/github.com ] || mkdir -p ~/Work/github.com
export GOROOT=/usr/local/go
export GOPATH="${HOME}/Work/go"
export GOBIN="${GOPATH}/bin"
export PATH=$PATH:$GOROOT/bin:$GOBIN

# -----------------------------------------
#      Nodejs
# -----------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[ -s ${HOME}/.userfile ] && . ${HOME}/.userfile
