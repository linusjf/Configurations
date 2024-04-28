#!/usr/bin/env bash
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
export HISTSIZE=10000
export HISTFILESIZE=120000
if [ -f "${HOME}/.bash_aliases" ]; then
  source "${HOME}/.bash_aliases"
fi
source "${HOME}/binaries/ssh-find-agent.sh"
set_ssh_agent_socket
unset GREP_OPTIONS
shopt -s autocd
shopt -s cdspell
shopt -s cmdhist
shopt -s direxpand
shopt -s dirspell
shopt -s dotglob
shopt -s globstar
#set -euo pipefail
set -o noclobber
export DOWNLOAD_STATIC_LIBV8=1
export DISPLAY=":0"
export BROWSER=w3m
export GITGUARDIAN_API_KEY="$(cat "$HOME/.gitguardiantoken")"
fac() { (
  echo 1
  seq "$1"
) | paste -s -d\* - | bc; }
source "$(which env_parallel.bash)"
source "${HOME}/PMD/shell/pmd-completion.sh"
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/root/.sdkman"
[[ -s "/root/.sdkman/bin/sdkman-init.sh" ]] && source "/root/.sdkman/bin/sdkman-init.sh"
# The next line updates PATH for the Google Cloud SDK.
if [ -f "${PREFIX}/usr/google-cloud-sdk/path.bash.inc" ]; then source "${PREFIX}/usr/google-cloud-sdk/path.bash.inc"; fi
# The next line enables shell command completion for gcloud.
if [ -f "${PREFIX}/usr/google-cloud-sdk/completion.bash.inc" ]; then source "${PREFIX}/usr/google-cloud-sdk/completion.bash.inc"; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# pnpm
export PNPM_HOME="${HOME}/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export GIT_EXCLUDE_FILES="${HOME}/.git/ignore"
export GIT_HOOKS_PATH="${HOME}/.git/hooks"
