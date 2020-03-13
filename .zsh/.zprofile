#!/usr/bin/env zsh
# PATH
typeset -gxU path PATH
path=( \
  $HOME/bin(N-/) \
  $HOME/.local/bin \
  /usr/local/bin \
  "$path[@]" \
)

# FPATH
# NOTE: Set fpath before compinit
typeset -gxU fpath FPATH
fpath=( \
  $HOME/.zsh/completions(N-/) \
  $HOME/.zsh/functions(N-/) \
  "$fpath[@]" \
)

# Initialize 'anyenv'
export ANYENV_ROOT=$HOME/.anyenv
export ANYENV_DEFINITION_ROOT=$XDG_CONFIG_HOME/anyenv/anyenv-install
export PATH=$HOME/.anyenv/bin:$PATH

ANYENV_INIT_SOURCE=$ZDOTDIR/anyenv-init.zsh
if [[ -e ${ANYENV_INIT_SOURCE} ]]; then
  ret=$(diff ${ANYENV_INIT_SOURCE} <(anyenv init -))
  [[ $ret != '' ]] && anyenv init - > ${ANYENV_INIT_SOURCE}
else
  anyenv init - > ${ANYENV_INIT_SOURCE}
fi
source ${ANYENV_INIT_SOURCE}

# direnv
eval "$(direnv hook zsh)"

# Go
export GOPATH=${GOPATH:-$HOME/go}
export PATH="$GOPATH/bin:$PATH"

# Rust
export PATH=$HOME/.cargo/bin:$PATH

# Python
# Pipenv
export PIPENV_VENV_IN_PROJECT=true

# Poetry
export PATH=$HOME/.poetry/bin:$PATH
export POETRY_VIRTUALENVS_IN_PROJECT=true

# JVM
# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s $SDKMAN_DIR/bin/sdkman-init.sh ]] && source $SDKMAN_DIR/bin/sdkman-init.sh


# Aliases
# ls -> exa
alias ls='exa -g --time-style=long-iso'
alias ll='ls -lF'
alias la='ls -aF'
alias lla='ls -laF'

# cat -> bat
alias cat='bat'

# grep -> ripgrep
alias grep='rg --color=auto'

alias mv='mv -i'
alias du='du -h'
alias cp="${ZSH_VERSION:+nocorrect} cp -i"
alias mkdir="${ZSH_VERSION:+nocorrect} mkdir"
alias sudo="${ZSH_VERSION:+nocorrect} sudo"

# Global aliases
alias -g G='| rg'
alias -g L='| less'
alias -g X='| xargs'
alias -g N='| >/dev/null 2>&1'
alias -g N1='| >/dev/null'
alias -g N2='| 2>/dev/null'

(( $+galiases[H] )) || alias -g H='| head'
(( $+galiases[T] )) || alias -g T='| tail'

alias -g CP='| pbcopy'
alias -g CC='tee /dev/tty | pbcopy'


# Keybind
# Vim-like key bind as default
bindkey -v

# Escape insert mode 
bindkey -M viins 'jj' vi-cmd-mode

# Add Emacs-like keybind
bindkey -M viins '^F' forward-char
bindkey -M viins '^B' backward-char
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^E' end-of-line
bindkey -M viins '^K' kill-line
bindkey -M viins '^Y' yank
bindkey -M viins '^W' backward-kill-word
bindkey -M viins '^U' backward-kill-line
bindkey -M viins '^H' backward-delete-char
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^G' send-break
bindkey -M viins '^P' up-line-or-history
bindkey -M viins '^N' down-line-or-history
bindkey -M viins '^D' delete-char-or-list
bindkey -M vicmd '^A' beginning-of-line
bindkey -M vicmd '^E' end-of-line
bindkey -M vicmd '^K' kill-line
bindkey -M vicmd '^P' up-line-or-history
bindkey -M vicmd '^N' down-line-or-history
bindkey -M vicmd '^Y' yank
bindkey -M vicmd '^W' backward-kill-word
bindkey -M vicmd '^U' backward-kill-line

# Surround.vim
autoload -Uz is-at-least
if is-at-least 5.0.8; then
  autoload -Uz surround
  zle -N delete-surround surround
  zle -N change-surround surround
  zle -N add-surround surround
  bindkey -a cs change-surround
  bindkey -a ds delete-surround
  bindkey -a ys add-surround
  bindkey -M visual S add-surround
fi

# Insert a last word
autoload -Uz smart-insert-last-word
zle -N insert-last-word smart-insert-last-word
zstyle :insert-last-word match '*([^[:space:]][[:alpha:]/\\]|[[:alpha:]/\\][^[:space:]])*'

# select hisotries
autoload -Uz select-history
zle -N select-history
bindkey '^R' select-history


# Completions
# Styles
# Completing grouping
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''

# Completing misc
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'
zstyle ':completion:*' use-cache true
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Directory
zstyle ':completion:*:cd:*' ignored-parents parent pwd
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
