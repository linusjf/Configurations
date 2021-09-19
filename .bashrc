alias ..='cd ../.. && pwd'
alias ...='cd ../../.. && pwd'
alias ....='cd ../../../.. && pwd'
alias .....='cd ../../../../.. && pwd'
alias aiabrowser='am start -a android.intent.action.VIEW -d "content://com.android.externalstorage.documents/root/primary"'	## Reference [Android 11 (with Termux storage permission denied) question; What's the source for the shortcut to the file manager of the settings app?](https://www.reddit.com/r/termux/comments/msq7lm/android_11_with_termux_storage_permission_denied/) Contributors u/DutchOfBurdock u/xeffyr
alias aiachrome='am start --user 0 -n com.android.chrome/com.google.android.apps.chrome.Main'	## Reference [Can I start an app from Termux's command line? How?](https://www.reddit.com/r/termux/comments/62zi71/can_i_start_an_app_from_termuxs_command_line_how/) Contributors u/u/fornwall u/Kramshet
alias aiadial='am start -a android.intent.action.DIAL'
alias aiafilemanager='am start -a android.intent.action.VIEW -d "content://com.android.externalstorage.documents/root/primary"'
alias aiasearch='am start -a android.intent.action.SEARCH'
alias aiaview='am start -a android.intent.action.VIEW'
alias aiaviewd='am start -a android.intent.action.VIEW -d '
alias aiawebsearch='am start -a android.intent.action.WEB_SEARCH'
alias C='cd .. && pwd'
alias c='cd .. && pwd'
alias CW='cat $(which' # use a ) to complete this alias
alias Cw='cat $(which' # use a ) to complete this alias
alias cw='cat $(which' # use a ) to complete this alias
alias Cr='cp -r'
alias cr='cp -r'
alias CUO='curl -C - --fail --retry 4 -O'
alias CuO='curl -C - --fail --retry 4 -O'
alias cuo='curl -C - --fail --retry 4 -O'
alias CUOL='curl -C - --fail --retry 4 -JOL'
alias Cuol='curl -C - --fail --retry 4 -JOL'
alias cuol='curl -C - --fail --retry 4 -JOL'
alias D='nice -n 20 du -hs'
alias d='nice -n 20 du -hs'
alias E='exit'
alias e='exit'
alias F='grep -n --color=always'
alias f='grep -n --color=always'
alias Fr='grep -nr --color=always'
alias fr='grep -nr --color=always'
alias G='ga ; gcm ; gp'
alias g='ga ; gcm ; gp'
alias GITS='git show'
alias gits='git show'
alias GCA='git commit -a -S'
alias gca='git commit -a -S'
alias GCAM='git commit -a -S -m'
alias gcam='git commit -a -S -m'
alias H='history >> $HOME/.historyfile'
alias h='history >> $HOME/.historyfile'
alias HW='head $(which' # use a ) to complete this alias
alias Hw='head $(which' # use a ) to complete this alias
alias hw='head $(which' # use a ) to complete this alias
alias J='jobs'
alias j='jobs'
alias I='whoami'
alias i='whoami'
alias setclip='termux-set-clipboard'
alias getclip='termux-get-clipboard'
#alias vim='nvim'
alias node='node --unhandled-rejections=strict'
alias loadbash='source ~/.bash_profile'
alias arch='startarch'
# Let there be color in grep!
#export GREP_OPTIONS=' — color=auto'
# Set Vim as my default editor
export EDITOR=vim
export HISTSIZE=10000
export HISTFILESIZE=120000
source ~/bin/ssh-find-agent.sh
set_ssh_agent_socket
unset GREP_OPTIONS
shopt -s autocd
shopt -s cdspell
shopt -s cmdhist
shopt -s direxpand
shopt -s dirspell
shopt -s dotglob
shopt -s globstar
export DISPLAY=":0"
fac() { (echo 1; seq $1) | paste -s -d\* - | bc; }
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/root/.sdkman"
[[ -s "/root/.sdkman/bin/sdkman-init.sh" ]] && source "/root/.sdkman/bin/sdkman-init.sh"
. `which env_parallel.bash`
