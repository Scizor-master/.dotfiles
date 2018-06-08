has(){
    type "${1:?too few arguments}" &>/dev/null
}

# Reload resets completion function.
reload(){
    local f
    f=($HOME/.zsh/completions/*(.))
    unfunction $f:t 2>/dev/null
    autoload -U $f:t
}

# Returns true if current shell is first shell.
is_login_shell(){
    [[ $SHLVL == 1 ]]
}

# Returns true if cwd is in git repository
is_git_repo(){
    git rev-parse --is-inside-work-tree &>/dev/null
    return $status
}

# Returns true if GNU screen is running.
is_screen_running(){
    [[ -n $STY ]]
}

# Returns true if tmux is running.
is_tmux_running(){
    [[ -n $TMUX ]]
}

# Returns true if GNU screen or tmux is running.
is_screen_or_tmux_running(){
    is_screen_running || is_tmux_running
}

# Returns true if the current shell is running from command line.
shell_has_started_interactively(){
    [[ -n $PS1 ]]
}

# Returns true if the ssh daemon is available.
is_ssh_running(){
    [[ -n $SSH_CLIENT ]]
}

# Export the PLATFORM variable as you see fit.
detect_os(){
    export PLATFORM
    case "${(L):-$(uname)}" in
        *'linux'*)
            PLATFORM='linux'
            ;;
        *'darwin'*)
            PLATFORM='osx'
            ;;
        *'bsd'*)
            PLATFORM='bsd'
            ;;
        *)
            PLATFORM='unknown'
            ;;
    esac
}

# Returns true if running os is Linux.
is_linux(){
    detect_os
    if [[ $PLATFORM == 'linux' ]]; then
        return 0
    else
        return 1
    fi
}

# Returns true if running os is OSX.
is_osx(){
    detect_os
    if [[ $PLATFORM == 'osx' ]]; then
        return 0
    else
        return 1
    fi
}

# Returns true if running os is FreeBSD.
is_bsd(){
    detect_os
    if [[ $PLATFORM == 'bsd' ]]; then
        return 0
    else
        return 1
    fi
}

# Returns OS name of the platform that is running.
get_os(){
    local os
    for os in osx linux bsd; do
        if is_$os; then
            echo $os
        fi
    done
}

# Export DISTRIBUTION variable.
detect_distribution(){
    export DISTRIBUTION
    if [ -e /etc/debian_version ] || [ -e /etc/debian_release ]; then
        if [ -e /etc/lsb-release ]; then
            DISTRIBUTION="ubuntu"
        else
            DISTRIBUTION="debian"
        fi

    elif [ -e /etc/fedora-release ]; then
        DISTRIBUTION="fedora"

    elif [ -e /etc/redhat-release ]; then
        if [ -e /etc/oracle-relase ]; then
            DISTRIBUTION="oracle"
        else
            DISTRIBUTION="redhat"
        fi
    else
        DISTRIBUTION="unknown"
    fi

    echo ${DISTRIBUTION}
}

# Returns true if running distribution is Ubuntu.
is_ubuntu(){
    detect_distribution
    if [[ $DISTRIBUTION == 'ubuntu' ]]; then
        return 0
    else
        return 1
    fi
}

# Returns true if running distribution is Debian.
is_debian(){
    detect_distribution
    if [[ $DISTRIBUTION == 'debian' ]]; then
        return 0
    else
        return 1
    fi
}

# Returns true if running distribution is Fedora.
is_fedora(){
    detect_distribution
    if [[ $DISTRIBUTION == 'fedora' ]]; then
        return 0
    else
        return 1
    fi
}

# Returns true if running distribution is Oracle.
is_oracle(){
    detect_distribution
    if [[ $DISTRIBUTION == 'oracle' ]]; then
        return 0
    else
        return 1
    fi
}

# Returns true if running distribution is Redhat.
is_redhat(){
    detect_distribution
    if [[ $DISTRIBUTION == 'redhat' ]]; then
        return 0
    else
        return 1
    fi
}

# Returns distribution name that is running.
get_distribution(){
    local distribution
    for distribution in ubuntu debian fedora oracle redhat; do
        if is_$distribution; then
            echo $distribution
        fi
    done
}
