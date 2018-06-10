#!/bin/sh
# Stop script if errors occur.
trap 'echo Error: $0:$LINENO stopped; exit 1' HUP INT QUIT TERM
set -eu

# Get utilities
. "$DOTPATH"/etc/init/assets/vital.sh

# Install Zsh'
if ! has "zsh"; then
    case "$(get_os)" in
        osx)
            if has "brew"; then
                log_echo "Install Zsh with Homebrew."
                brew install zsh
            else
                log_fail "Error: Homebrew is required."
                exit 1
            fi
            ;;

        linux)
            case "$(get_distribution)" in
                redhat)
                    if has "yum"; then
                        log_echo "Install Zsh with Yellowdog Updater Modified (YUM)."
                        sudo yum -y install zsh
                    else
                        log_fail "Error: YUM is required."
                        exit 1
                    fi
                    ;;

                ubuntu)
                    if has "apt"; then
                        log_echo "Install Zsh with Advanced Packagint Tool (APT)."
                        sudo apt -y install zsh
                    else
                        log_fail "Error: APT is required."
                        exit 1
                    fi
                    ;;

                *)
                    log_fail "Error: YUM or APT is required."
                    exit 1
                    ;;
            esac
            ;;
        *)
            log_fail "Error: This script is only supported OSX and Linux."
            exit 1
            ;;
    esac
fi

log_pass "Zsh: Installed successfully."


# Install zplug
if ! has "zplug" && [ ! -d $HOME/.zplug ]; then
    if has "git"; then
        log_echo "Install zplug with Git."
        git clone https://github.com/zplug/zplug $HOME/.zplug
    else
        log_fail "Error: Git is required."
        exit 1
    fi
fi

log_pass "zplug: Installed successfully."


# Run the forced termination with a last exit code.
exit $?

# Assign zsh as a login shell.
if ! contains "${SHELL:-}" "zsh"; then
    zsh_path="$(which zsh)"

    # Check /etc/shells
    if ! grep -xq "${zsh_path:=/bin/zsh}" /etc/shells; then
        log_fail "Oh, you should append '$zsh_path' to '/etc/shells'."
        exit 1
    fi

    if [ -x "$zsh_path" ]; then
        # Changing for a general user.
        if chsh -s "$zsh_path" "${USER:-root}"; then
            log_pass "Change shell to $zsh_path for ${USER:-root} successfully."
        else
            log_fail "Cannot set '$path' as \$SHELL."
            log_fail "Is '$path' described in '/etc/shells'?"
            log_fail "You should run 'chsh -l' now."
            exit 1
        fi

        # For root user.
        if [ ${EUID:-${UID}} == 0 ]; then
            if chsh -s "$zsh_path" && :; then
                log_pass "[root] Change shell to $zsh_path successfully."
            fi
        fi
    else
        log_fail "$zsh_path: Invalid path."
        exit 1
    fi
fi

log_pass "Zsh: Setted successfully."
