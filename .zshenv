# add $HOME/.lcaol/bin scripts
export PATH="$PATH:$HOME/.local/bin"

# pyenv
export PATH="/home/yevhens/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#go
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/bin"

# gocode
export GOPATH="$HOME/goprojects"
export PATH="$PATH:$GOPATH/bin"

# emsdk
export PATH="/home/yevhens/emsdk:$PATH"
export PATH="/home/yevhens/emsdk/clang/e1.38.30_64bit:$PATH"
export PATH="/home/yevhens/emsdk/node/8.9.1_64bit/bin:$PATH"
export PATH="/home/yevhens/emsdk/emscripten/1.38.30:$PATH"

export EMSDK="/home/yevhens/emsdk"
export EM_CONFIG="/home/yevhens/.emscripten"
export LLVM_ROOT="/home/yevhens/emsdk/clang/e1.38.30_64bit"
export EMSCRIPTEN_NATIVE_OPTIMIZER="/home/yevhens/emsdk/clang/e1.38.30_64bit/optimizer"
export BINARYEN_ROOT="/home/yevhens/emsdk/clang/e1.38.30_64bit/binaryen"
export EMSDK_NODE="/home/yevhens/emsdk/node/8.9.1_64bit/bin/node"
export EMSCRIPTEN="/home/yevhens/emsdk/emscripten/1.38.30"

# android
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"

export PATH="$PATH:/usr/local"

# bspwm
export XDG_CONFIG_HOME="$HOME/.config"

# elasticsearch
export PID_DIR="/var/run/elasticsearch"
export PID_FILE="/var/run/elasticsearch.pid"

# git
alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gb="git branch"
alias gc="git commit"
alias gcm="git commit -m"
alias gp="git push"
alias gd="git diff"
# alias go="git checkout"

# yadm
alias ys="yadm status"
alias ya="yadm add"
alias yc="yadm commit"
alias ycm="yadm commit -m"
alias yp="yadm push"

# bluetoothctl
alias blist="bluetoothctl list"
alias bcon="bluetoothctl connect"

# ruby
export PATH="$PATH:/home/yevhens/.gem/ruby/2.6.0/bin"
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# flatpak
export XDG_DATA_DIRS="/var/lib/flatpak/exports/share"
export XDG_DATA_DIRS="$XDG_DATA_DIRS:/home/yevhens/.local/share/flatpak/exports/share"

# browser
export BROWSER="qutebrowser"

# Locale
export LC_ALL="en_US.UTF-8"

# AirPods
export AIRPODS="18:81:0E:92:BC:9B"
