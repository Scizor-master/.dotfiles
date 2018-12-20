ZPLUG_SUDO_PASSWORD=
ZPLUG_PROTOCOL=ssh

zplug "zplug/zplug", hook-build:'zplug --self-manage'

# zplug "$HOME/.zsh", from:local, use:"<->_*.zsh"

zplug "b4b4r07/enhancd", use:init.sh
if zplug check "b4b4r07/enhancd"; then
  export ENHANCD_FILTER="fzf --height 50% --reverse --ansi"
  export ENHANCD_DOT_SHOW_FULLPATH=1
fi
zplug "b4b4r07/zsh-vimode-visual", use:"*.zsh", defer:3

zplug "zsh-users/zsh-completions"
zplug "Valodim/zsh-curl-completion"

zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "stedolen/jq", \
  as:command, \
  from:gh-r, \
  rename-to:jq
zplug "junegunn/fzf-bin", \
  as:command, \
  from:gh-r, \
  rename-to:"fzf", \
  frozen:1
zplug "monochromegane/the_platinum_searcher", \
  as:command, \
  from:gh-r, \
  rename-to:"pt", \
  frozen:1

zplug "scizorman/zsh-garbage", as:command, use:bin/garbage

zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
