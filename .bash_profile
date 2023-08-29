#!/usr/bin/env bash
#shellcheck disable=SC1091,SC2155,SC1090
source ~/.bashrc
declare -i istermux=1
if [ -f "$PREFIX/etc/os-release" ]; then
  istermux=0
  export TERMUX=0
else
  export TERMUX=1
fi
require() {
  hash "$@"
}
alias loadbash='source ~/.bash_profile'
if [[ "$istermux" != 1 ]]; then
  require archlinux-java tty cat rm grep awk fortune lolcat cowsay
  if ! (archlinux-java status | grep "(default)" >/dev/null); then
    archlinux-java fix
  fi
  jvm="$(archlinux-java status | grep '(default)' | awk '{print $1}')"
  export JAVA_HOME="/usr/lib/jvm/${jvm}"
  export PATH="${JAVA_HOME}/bin:${PATH}:~/jacorb-3.9/bin:${HOME}/binaries:/usr/sbin:/sbin:/bin:${PREFIX}/bin:${PREFIX}/local/bin:/system/bin:/system/xbin:${HOME}/PMD/bin:${HOME}/wabt/bin:${HOME}/LearnJava:${HOME}/LearnBnd"
  export PYTHON3_HOST_PROG="/usr/bin/python"
  export ANT_HOME="/usr/share/ant"
  export ANT_OPTS="-Xmx1024m -Xms512m"
  export IVY_HOME="${HOME}/.ivy2"
  export TEMP_DIR="/tmp"
  fortune | cowsay | lolcat
else
  require updatedb tty cat rm cowsay fortune lolcat
  export PATH="${HOME}/binaries:${HOME}/.cargo/bin:${HOME}/bin:${PATH}:/usr/sbin:/sbin:/bin:${PREFIX}/bin:${PREFIX}/local/bin:/system/bin:/system/xbin:${HOME}/wabt/bin"
  export PYTHON3_HOST_PROG="${PREFIX}/bin/python"
  export C_INCLUDE_PATH="${PREFIX}/opt/emscripten/cache/sysroot/include/"
  export TEMP_DIR="${PREFIX}/tmp"
  fortune | cowsay -r | lolcat
fi

if [[ "$istermux" == 1 ]]; then
  updatedb
fi
[[ -f "$HOME/.bashrc" ]] && source "$HOME/.bashrc"
if [ ! -e "$HOME"/.hushlogin ] && [ ! -e "$HOME"/.chushlogin ]; then
  [ -e "{$PREFIX}/etc/mota" ] && source "${PREFIX}/etc/mota"
fi
if [ -e "$HOME"/.chushlogin ]; then
  rm -f "$HOME"/.chushlogin
fi
PS1="\[\e[38;5;148m\]\u\[\e[1;0m\]\A\[\e[1;38;5;112m\]\W\[\e[0m\]$ "
export ANDROID_DATA="/data"
export ANDROID_ROOT="/system"
export BOOTCLASSPATH="/system/framework/core-oj.jar:/system/framework/core-libart.jar:/system/framework/conscrypt.jar:/system/framework/okhttp.jar:/system/framework/core-junit.jar:/system/framework/bouncycastle.jar:/system/framework/ext.jar:/system/framework/framework.jar:/system/framework/telephony-common.jar:/system/framework/voip-common.jar:/system/framework/ims-common.jar:/system/framework/apache-xml.jar:/system/framework/org.apache.http.legacy.boot.jar:/system/framework/tcmiface.jar:/system/framework/WfdCommon.jar:/system/framework/oem-services.jar:/system/framework/qcom.fmradio.jar:/system/framework/qcmediaplayer.jar:/system/framework/telephony-ext.jar:/system/app/miui/miui.apk:/system/app/miuisystem/miuisystem.apk"
export NVIM_PYTHON_LOG_FILE=1
if [[ "$istermux" != 1 ]]; then
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
if [[ "$istermux" != 1 ]]; then
  export AWS_ACCESS_KEY_ID="$(cat .aws/aws_access_key_id)"
  export AWS_SECRET_ACCESS_KEY="$(cat .aws/aws_secret_access_key)"
  export OMPI_ALLOW_RUN_AS_ROOT=1
  export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1
  export MAVEN_OPTS=" --add-exports jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED \
  --add-exports jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED \
  --add-exports jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED \
  --add-exports jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED \
  --add-exports jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED "
fi
set -o vi
#set -o nounset
# .bash_profile EOF
