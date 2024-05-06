#!/usr/bin/env bash
# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac
:
#shellcheck disable=SC1091,SC2155,SC1090
function _AM_() {
  command -v am 1>/dev/null || cp "${PREFIX}/usr/bin/am" "/usr/local/termuxarch/bin"
}
function _PWD_() {
  printf '%s\n' "$PWD"
}
function git-branch() {
  if [ -d .git ]; then
    printf "%s" "($(git branch | awk '/\*/{print $2}'))"
  fi
}
function em() {
  [ -x /usr/bin/make ] || { pc base base-devel || pci base base-devel; }
  { [ -x /usr/local/termuxarch/bin/uemacs ] && /usr/local/termuxarch/bin/uemacs "$@"; } || { { { cd || exit 69; } && [ -d uemacs ] || gcl https://github.com/torvalds/uemacs; } && { [ -d uemacs ] && { cd uemacs || exit 69; }; } && printf '%s\n' "making uemacs" && make && cp -f em /usr/local/termuxarch/bin/uemacs && make clean && /usr/local/termuxarch/bin/uemacs emacs.hlp; }
}
# Let there be color in grep!
#export GREP_OPTIONS=' — color=auto'
# Set Vim as my default editor
export EDITOR=vim
export PAGER=less
:
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=10000
export HISTFILESIZE=120000

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
  PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
  ;;
*) ;;
esac

# enable color support of ls and also add handy aliases
if [ -x "${PREFIX}/usr/bin/dircolors" ]; then
  # shellcheck disable=SC2015
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f "${PREFIX}/usr/share/bash-completion/bash_completion" ]; then
    # shellcheck source=/dev/null
    source "${PREFIX}/usr/share/bash-completion/bash_completion"
  elif [ -f "${PREFIX}/etc/bash_completion" ]; then
    # shellcheck source=/dev/null
    source "${PREFIX}/etc/bash_completion"
  fi
fi

if test -f "${HOME}/.bash_aliases"; then
  # shellcheck source=/dev/null
  source "${HOME}/.bash_aliases"
fi
if test -f "${HOME}/binaries/ssh-find-agent.sh"; then
  # shellcheck source=/dev/null
  source "${HOME}/binaries/ssh-find-agent.sh"
  set_ssh_agent_socket
fi
if test -f "${HOME}/bin/ssh-find-agent.sh"; then
  # shellcheck source=/dev/null
  source "${HOME}/bin/ssh-find-agent.sh"
  set_ssh_agent_socket
fi

unset GREP_OPTIONS
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

shopt -s autocd
shopt -s cdspell
shopt -s cmdhist
shopt -s direxpand
shopt -s dirspell
shopt -s dotglob

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

#set -euo pipefail
set -o noclobber
export DOWNLOAD_STATIC_LIBV8=1
if test -f "$HOME/.gitguardiantoken"; then
  GITGUARDIAN_API_KEY="$(cat "$HOME/.gitguardiantoken")"
  export GITGUARDIAN_API_KEY
fi
fac() { (
  echo 1
  seq "$1"
) | paste -s -d\* - | bc; }
# shellcheck source=/dev/null
source "$(which env_parallel.bash)"
if test -f "${HOME}/PMD/shell/pmd-completion.sh"; then
  # shellcheck source=/dev/null
  source "${HOME}/PMD/shell/pmd-completion.sh"
fi
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
if test -f "/root/.sdkman"; then
  export SDKMAN_DIR="/root/.sdkman"
  # shellcheck source=/dev/null
  [[ -s "/root/.sdkman/bin/sdkman-init.sh" ]] && source "/root/.sdkman/bin/sdkman-init.sh"
fi
# The next line updates PATH for the Google Cloud SDK.
# shellcheck source=/dev/null
if [ -f "${PREFIX}/usr/google-cloud-sdk/path.bash.inc" ]; then source "${PREFIX}/usr/google-cloud-sdk/path.bash.inc"; fi
# The next line enables shell command completion for gcloud.
# shellcheck source=/dev/null
if [ -f "${PREFIX}/usr/google-cloud-sdk/completion.bash.inc" ]; then source "${PREFIX}/usr/google-cloud-sdk/completion.bash.inc"; fi

# pnpm
if test -d "${HOME}/.local/share/pnpm"; then
  export PNPM_HOME="${HOME}/.local/share/pnpm"
  case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
  esac
fi
# pnpm end
if test -f "${HOME}/.gitrc"; then
  # shellcheck source=/dev/null
  source "${HOME}/.gitrc"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
