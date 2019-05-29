# Put this in your .bash_profile file.
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
export PATH=$PATH:~/bin/
alias gformat='java -jar ~/lib/google-java-format-1.7-all-deps.jar'
