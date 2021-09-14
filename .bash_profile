alias loadbash='source ~/.bash_profile'
export JAVA_HOME=/usr/lib/jvm/$(archlinux-java status | grep 'default' | awk '{print $1}')
export PATH="$JAVA_HOME/bin:$PATH:~/jacorb-3.9/bin:~/LearnJava:$HOME/bin:/usr/sbin:/sbin:/bin:/data/data/com.termux/files/usr/bin:/system/bin:/system/xbin"
[[ -f $HOME/.bashrc ]] && . $HOME/.bashrc
if [ ! -e "$HOME"/.hushlogin ] && [ ! -e "$HOME"/.chushlogin ]
then
[ -e /etc/mota ] && . /etc/mota
fi
if [ -e "$HOME"/.chushlogin ]
then
rm -f "$HOME"/.chushlogin
fi
PS1="\[\e[38;5;148m\]\u\[\e[1;0m\]\A\[\e[1;38;5;112m\]\W\[\e[0m\]$ "
export ANDROID_DATA="/data"
export ANDROID_ROOT="/system"
export BOOTCLASSPATH="/system/framework/core-oj.jar:/system/framework/core-libart.jar:/system/framework/conscrypt.jar:/system/framework/okhttp.jar:/system/framework/core-junit.jar:/system/framework/bouncycastle.jar:/system/framework/ext.jar:/system/framework/framework.jar:/system/framework/telephony-common.jar:/system/framework/voip-common.jar:/system/framework/ims-common.jar:/system/framework/apache-xml.jar:/system/framework/org.apache.http.legacy.boot.jar:/system/framework/tcmiface.jar:/system/framework/WfdCommon.jar:/system/framework/oem-services.jar:/system/framework/qcom.fmradio.jar:/system/framework/qcmediaplayer.jar:/system/framework/telephony-ext.jar:/system/app/miui/miui.apk:/system/app/miuisystem/miuisystem.apk"
export LANG="en_GB.UTF-8"
export LANGUAGE="en_GB.UTF-8"
export LC_ADDRESS="en_GB.UTF-8"
export LC_COLLATE="en_GB.UTF-8"
export LC_CTYPE="en_GB.UTF-8"
export LC_IDENTIFICATION="en_GB.UTF-8"
export LC_MEASUREMENT="en_GB.UTF-8"
export LC_MESSAGES="en_GB.UTF-8"
export LC_MONETARY="en_GB.UTF-8"
export LC_NAME="en_GB.UTF-8"
export LC_NUMERIC="en_GB.UTF-8"
export LC_PAPER="en_GB.UTF-8"
export LC_TELEPHONE="en_GB.UTF-8"
export LC_TIME="en_GB.UTF-8"
export GPG_TTY="$(tty)"
export MOZ_FAKE_NO_SANDBOX=1
export PULSE_SERVER=127.0.0.1
export TZ="Asia/Calcutta"
# Put this in your .bash_profile file.
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
# export PATH=/data/data/com.termux/files/home/.cargo/bin:~/bin/:/data/data/com.termux/files/home/pear/bin:/data/data/com.termux/files/home/.dub/packages/dfmt-0.13.4/dfmt/bin/:$PATH
export NODE_PATH=/usr/lib/node_modules
#export TZDIR=/data/data/com.termux/files/usr/share/zoneinfo:/data/data/com.termux/files/usr/share/mysql/mysql-test/std_data/zoneinfo
export TZDIR=/usr/share/zoneinfo:/usr/share/mysql/mysql-test/std_data/zoneinfo
export PKG_CONFIG_PATH='/usr/lib/pkgconfig/libgit2.pc'
## .bash_profile EOF
