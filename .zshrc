# oh-my-zsh
# ----------------------------------
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ryoabe"
plugins=(git svn ruby osx bundler brew rails golang)
source $ZSH/oh-my-zsh.sh

# Basic
# ----------------------------------
case "${OSTYPE}" in
freebsd*|darwin*)
alias ls="ls -G -w"
;;
linux*)
alias ls="ls --color"
;;
esac
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"
alias du="du -h"
alias df="df -h"
alias ll='ls -Galh'
alias lr='ls -Galtrh'
alias rm='rm -i'
alias prev='open -a preview'
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias atom="/Applications/Atom.app/Contents/MacOS/Atom"
#alias diff='colordiff -u'
alias his='history | sort'
alias hg='his | fgrep'

# Backlog
# ----------------------------------
function scn(){
	openBacklog rxdev SCN $1
}

function openBacklog() {
	open "https://$1.backlog.jp/view/$2-$3"
}

# Chrome
# ----------------------------------
alias chrm="open -a '/Applications/Google Chrome.app/'"
function chrome(){
	chrm "http://$@"
}

# Git
# ----------------------------------
alias g="git"
alias gad="git add"
alias gbr="git branch"
alias gci="git commit"
alias gco="git checkout"
alias gdi="git diff"
alias gdc="git diff --cached"
alias gds="git diff --stat"
alias gf="git fetch"
alias ggr="git grep"
alias gls="git log --stat"
alias glo="git log --oneline"
alias glp="git log -p"
alias gls="git ls-files"
alias gm="git merge"
alias gst="git status -s"
alias gsh="git show"
alias gsp="git stash pop"
alias gss="git stash save"
alias gssh="git stash show"
alias gsl="git stash list"
alias gPull="git pull"
alias glg="git log --graph --decorate --pretty='%C(yellow)%h%Creset %C(cyan)%an%Creset %Cgreen[%cr]%Creset %s'"
alias gl="glg -15"
alias up='cd ./$(git rev-parse --show-cdup)' # cd to current repo's root dir
alias gcb="git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1 /'" # Show current branch

# functions
# ----------------------------------
# cdの後に自動的にls -la
function chpwd() { ll }

# rbenv
# ----------------------------------
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Rails
# ----------------------------------
alias bi='bundle install --path vendor/bundle -j 20'
alias bg='bundle exec guard'
alias rc='bundle exec rails c'
alias rs='bundle exec rails s'
alias be='bundle exec'

# Android
# ----------------------------------
export PATH=$PATH:~/Library/Android/sdk/platform-tools

# percol
# ----------------------------------

# Interactive pgrep / pkill
function ppgrep() {
    if [[ $1 == "" ]]; then
        PERCOL=percol
    else
        PERCOL="percol --query $1"
    fi
    ps aux | eval $PERCOL | awk '{ print $2 }'
}

function ppkill() {
    if [[ $1 =~ "^-" ]]; then
        QUERY=""            # options only
    else
        QUERY=$1            # with a query
        [[ $# > 0 ]] && shift
    fi
    ppgrep $QUERY | xargs kill $*
}

# zsh history search

function exists { which $1 &> /dev/null }

if exists percol; then
    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }

    zle -N percol_select_history
    bindkey '^R' percol_select_history
fi

# autojump
# ----------------------------------
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# pyenv
# export PATH="$HOME/.pyenv/shims:$PATH"

# TensorFlow
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64"
export CUDA_HOME=/usr/local/cuda

# Gradle
# export PATH="$HOME/.gradle/bin/:$PATH"
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/ryoabe/.sdkman"
[[ -s "/Users/ryoabe/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/ryoabe/.sdkman/bin/sdkman-init.sh"

# Oracle
export ORACLE_BASE=/usr/local/oracle
export ORACLE_HOME=$ORACLE_BASE/product/instantclient_12_1/x64-12.1.0.2.0
export PATH=$ORACLE_HOME/bin:$PATH
export OCI_DIR=$ORACLE_HOME/lib
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH
export TNS_ADMIN=$ORACLE_BASE/admin/network
export SQLPATH=$ORACLE_HOME/sqlplus/admin
export NLS_LANG=Japanese_Japan.AL32UTF8
alias sqlplus='rlwrap sqlplus'

# Node
export NODE_PATH=/usr/local/lib/node_modules

# Google Cloud SDK
# source "$HOME/bin/google-cloud-sdk/path.zsh.inc"
# source "$HOME/bin/google-cloud-sdk/completion.zsh.inc"

# Common
export PATH="$HOME/bin:$PATH"

# Go
export GOPATH=$HOME/.go
export PATH="$GOPATH/bin:$PATH"