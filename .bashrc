alias vim='nvim'
alias loadbash='source ~/.bash_profile'
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
export DISPLAY=":1"
