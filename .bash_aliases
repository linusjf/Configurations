# reload bash
alias loadbash='source ~/.bash_profile'

# Ensure termux notification works
alias alert='termux-notification --title "Task Complete" --content "$(history | tail -n1 | sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Fix for PostgreSQL aliases
alias pgstart='pg_ctl -D "$PREFIX/var/lib/postgresql" start'
alias pgstop='pg_ctl -D "$PREFIX/var/lib/postgresql" stop'

# Fix for package cleaning
alias pkgclean='pkg clean && pkg autoclean || echo "Error: Failed to clean packages"'

# Alternative ls with exa
alias ls='command -v exa >/dev/null && exa --icons --color=always || ls --color=auto'

# Function to replace incomplete aliases
function cw() { cat "$(which "$1")"; }
function hw() { head "$(which "$1")"; }

# Fix for Git aliases to avoid issues when missing commit message
alias G='ga && gcm && gp'
alias g='ga && gcm && gp'
alias GCA='git commit -a -S || echo "Error: Commit failed"'
alias gca='git commit -a -S || echo "Error: Commit failed"'
alias GCAM='git commit -a -S -m || echo "Error: Commit failed"'
alias gcam='git commit -a -S -m || echo "Error: Commit failed"'

# Additional ls shortcuts
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Termux clipboard
alias setclip='termux-set-clipboard'
alias getclip='termux-get-clipboard'

# Common navigational aliases
alias ..='cd ../.. && pwd'
alias ...='cd ../../.. && pwd'
alias ....='cd ../../../.. && pwd'
alias .....='cd ../../../../.. && pwd'
alias C='cd .. && pwd'
alias c='cd .. && pwd'

# App launch shortcuts
alias aiachrome='am start --user 0 -n com.android.chrome/com.google.android.apps.chrome.Main'
alias aiadial='am start -a android.intent.action.DIAL'
alias aiafilemanager='am start -a android.intent.action.VIEW -d "content://com.android.externalstorage.documents/root/primary"'
alias aiasearch='am start -a android.intent.action.SEARCH'
alias aiaview='am start -a android.intent.action.VIEW'
alias aiaviewd='am start -a android.intent.action.VIEW -d '
alias aiawebsearch='am start -a android.intent.action.WEB_SEARCH'

# Use Neovim instead of Vim
alias vim='nvim'
alias view='nvim -R'

# Python and Node
alias python='python3'
alias node='node --unhandled-rejections=strict'
alias pipinstall='pip install --break-system-packages'
alias piptermux='python -m pip install --extra-index-url https://termux-user-repository.github.io/pypi/'

# Linux Distro aliases
alias ubuntu='proot-distro login --termux-home ubuntu-lts'
alias arch='proot-distro login --termux-home archlinux'
alias kali='startkali'
alias archlinus='proot-distro login --user linusjf --termux-home archlinux'
alias pacman='pacman --disable-sandbox'
alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.13.2-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
alias grun='java -Xmx500M -cp "/usr/local/lib/antlr-4.13.2-complete.jar:$CLASSPATH" org.antlr.v4.gui.TestRig'
