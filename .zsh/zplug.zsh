ZPLUG_SUDO_PASSWORD=
ZPLUG_PROTOCOL=ssh

zplug "zplug/zplug", hook-build:'zplug --self-manage'

zplug "$HOME/.zsh", from:local, use"<->_*.zsh"

zplug "b4b4r07/enhancd", use:init.sh
if zplug check "b4b4r07/enhancd"; then
    export ENHANCD_FILTER="fzf --height 50% --reverse --ansi"
    export ENHANCD_DOT_SHOW_FULLPATH=1
fi
zplug "b4b4r07/zsh-vimode-visual", use:"*.zsh", defer:3
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "junegunn/fzf-bin", \
    as:command, \
    from:gh-r, \
    rename-to:"fzf", \
    frozen:1

zplug "junegunn/fzf", \
    as:command, \
    use:"bin/fzf-tmux"

zplug "motemen/ghq", \
    as:command, \
    from:gh-r, \
    rename-to:ghq
