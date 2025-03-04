# ~/.bash_logout: executed by bash(1) when login shell exits.

# When leaving the console, clear the screen to increase privacy.

if [ "$SHLVL" = 1 ]; then
    if command -v clear_console >/dev/null 2>&1; then
        clear_console -q
    else
        clear
    fi
fi
