# Put this in your .bash_profile file.
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
export PATH=/data/data/com.termux/files/home/.cargo/bin:~/bin/:/data/data/com.termux/files/home/pear/bin:$PATH
export NODE_PATH=/data/data/com.termux/files/usr/lib/node_modules
export TZDIR=/data/data/com.termux/files/usr/share/zoneinfo:/data/data/com.termux/files/usr/share/mysql/mysql-test/std_data/zoneinfo
