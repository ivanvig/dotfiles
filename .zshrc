
### Added by Zplugin's installer
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk

#set history size
export HISTSIZE=10000
#save history after logout
export SAVEHIST=10000
#history file
export HISTFILE=~/.zhistory
#append into history file
setopt INC_APPEND_HISTORY
#save only one command if 2 common are same and consistent
setopt HIST_IGNORE_DUPS
#add timestamp for each entry
setopt EXTENDED_HISTORY

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu yes select
alias dotconf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

zplugin ice blockf
zplugin light zsh-users/zsh-completions

# Plugin history-search-multi-word loaded with tracking.
zplugin load zdharma/history-search-multi-word

# Load the pure theme, with zsh-async library that's bundled with it.
zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure

zplugin light softmoth/zsh-vim-mode
# Two regular plugins loaded without tracking.
zplugin light zsh-users/zsh-autosuggestions
zplugin ice atinit'zpcompinit; zpcdreplay' wait'!1'
zplugin light zdharma/fast-syntax-highlighting

#
#autoload -Uz compinit
#compinit
#
#zplugin cdreplay -q
