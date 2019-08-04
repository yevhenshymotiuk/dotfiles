# zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob
unsetopt beep
bindkey -e

# compinstall
zstyle :compinstall filename '/home/yevhens/.zshrc'

autoload -Uz compinit
compinit

# antibody
source <(antibody init)
antibody bundle zdharma/fast-syntax-highlighting
antibody bundle zdharma/history-search-multi-word
antibody bundle denysdovhan/spaceship-prompt spaceship
antibody bundle sorin-ionescu/prezto
antibody bundle sorin-ionescu/prezto folder:modules/git
antibody bundle sorin-ionescu/prezto folder:modules/completion
antibody bundle zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# theme
ZSH_THEME="spaceship"

# spaceship
SPACESHIP_BATTERY_SHOW=false
# SPACESHIP_RUBY_SYMBOL=' '
SPACESHIP_PYENV_SYMBOL=' '
SPACESHIP_ELIXIR_SYMBOL=' '
SPACESHIP_PACKAGE_SYMBOL=' '
SPACESHIP_NODE_SYMBOL=' '

# doctl
. <(doctl completion zsh)
alias dossh='doctl compute ssh'

alias ls='exa'
