# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/yevhens/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

### Added by Zplugin's installer
source '/home/yevhens/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

# zplugin ice svn lucid wait'!0' atload'prompt steeef'; zplugin snippet PZT::modules/prompt
# zplugin ice svn lucid; zplugin snippet PZT::modules/git
zplugin ice lucid; zplugin load zdharma/fast-syntax-highlighting
zplugin ice lucid atload"bindkey '^[[A' history-substring-search-up; bindkey '^[[B' history-substring-search-down"; zplugin load zsh-users/zsh-history-substring-search
zplugin ice lucid pick'spaceship.zsh'; zplugin load denysdovhan/spaceship-prompt

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# source <(antibody init)
# antibody bundle zdharma/fast-syntax-highlighting
# antibody bundle zdharma/history-search-multi-word
# antibody bundle denysdovhan/spaceship-prompt spaceship
# antibody bundle sorin-ionescu/prezto
# antibody bundle sorin-ionescu/prezto folder:modules/git
# antibody bundle sorin-ionescu/prezto folder:modules/completion
# antibody bundle zsh-users/zsh-history-substring-search

ZSH_THEME="spaceship"

SPACESHIP_BATTERY_SHOW=false
# SPACESHIP_RUBY_SYMBOL=' '

. <(doctl completion zsh)
alias dossh='doctl compute ssh'

alias ls='exa'
