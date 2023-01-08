source ~/.bashrc
declare -i istermux=1
if [ -f $PREFIX/etc/os-release ]
then 
  istermux=0
  export TERMUX=0
else
  export TERMUX=1
fi
alias loadbash='source ~/.bash_profile'
if [[ "$istermux" != 1 ]]
then
  export JAVA_HOME=/usr/lib/jvm/$(archlinux-java status | grep 'default' | awk '{print $1}')
  export PATH="$JAVA_HOME/bin:$PATH:~/jacorb-3.9/bin:~/LearnJava:$HOME/binaries:/usr/sbin:/sbin:/bin:/data/data/com.termux/files/usr/bin:/system/bin:/system/xbin"
  export PYTHON3_HOST_PROG="/usr/bin/python"
else
  export PATH="$HOME/binaries:$PATH:/usr/sbin:/sbin:/bin:/data/data/com.termux/files/usr/bin:/system/bin:/system/xbin"
  export PYTHON3_HOST_PROG="/data/data/com.termux/files/usr/bin/python"
fi

if [[ "$istermux" == 1 ]]
then
  updatedb
fi
[[ -f $HOME/.bashrc ]] && . $HOME/.bashrc
if [ ! -e "$HOME"/.hushlogin ] && [ ! -e "$HOME"/.chushlogin ]
then
	[ -e $PREFIX/etc/mota ] && . $PREFIX/etc/mota
fi
if [ -e "$HOME"/.chushlogin ]
then
	rm -f "$HOME"/.chushlogin
fi
PS1="\[\e[38;5;148m\]\u\[\e[1;0m\]\A\[\e[1;38;5;112m\]\W\[\e[0m\]$ "
export ANDROID_DATA="/data"
export ANDROID_ROOT="/system"
export BOOTCLASSPATH="/system/framework/core-oj.jar:/system/framework/core-libart.jar:/system/framework/conscrypt.jar:/system/framework/okhttp.jar:/system/framework/core-junit.jar:/system/framework/bouncycastle.jar:/system/framework/ext.jar:/system/framework/framework.jar:/system/framework/telephony-common.jar:/system/framework/voip-common.jar:/system/framework/ims-common.jar:/system/framework/apache-xml.jar:/system/framework/org.apache.http.legacy.boot.jar:/system/framework/tcmiface.jar:/system/framework/WfdCommon.jar:/system/framework/oem-services.jar:/system/framework/qcom.fmradio.jar:/system/framework/qcmediaplayer.jar:/system/framework/telephony-ext.jar:/system/app/miui/miui.apk:/system/app/miuisystem/miuisystem.apk"
NVIM_PYTHON_LOG_FILE=1
if [[ "$istermux" != 1 ]]
then
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
fi
export GPG_TTY="$(tty)"
export MOZ_FAKE_NO_SANDBOX=1
export PULSE_SERVER=127.0.0.1
export TZ="Asia/Calcutta"
# Put this in your .bash_profile file.
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
export NODE_PATH=/usr/lib/node_modules
export TZDIR=/usr/share/zoneinfo:/usr/share/mysql/mysql-test/std_data/zoneinfo
export PKG_CONFIG_PATH='/usr/lib/pkgconfig/libgit2.pc'
if [[ "$istermux" != 1 ]]
then
  export AWS_ACCESS_KEY_ID=$(cat .aws/aws_access_key_id) 
  export AWS_SECRET_ACCESS_KEY=$(cat .aws/aws_secret_access_key)
  export OMPI_ALLOW_RUN_AS_ROOT=1
  export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1
  export MAVEN_OPTS=" --add-exports jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED \
  --add-exports jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED \
  --add-exports jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED \
  --add-exports jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED \
  --add-exports jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED "
fi
set -o vi
# .bash_profile EOF
