#!/usr/bin/env bash

#shellcheck disable=SC1091,SC2155,SC1090

export USR=${PREFIX:-/usr}

pathmunge() {
  local dir="$1"
  local position="$2"

  # Check if directory exists before adding to PATH
  if [[ -d "$dir" && ":$PATH:" != *":$dir:"* ]]; then
    case "$position" in
    before)
      PATH="$dir:$PATH"
      ;;
    after)
      PATH="$PATH:$dir"
      ;;
    *)
      echo "Invalid position. Use 'before' or 'after'."
      return 1
      ;;
    esac
  fi
}

is_WSL() {
  [[ -e /proc/version ]] && [[ -r /proc/version ]] && grep -qEi "(Microsoft|WSL)" /proc/version
}

is_termux() {
  [[ -d /data/data/com.termux/files/usr/ ]]
}

is_arch_linux() {
  [[ -f /etc/os-release ]] && grep -q '^ID=arch' /etc/os-release
}

is_ubuntu() {
  [[ -f /etc/os-release ]] && grep -q '^ID=ubuntu' /etc/os-release
}

is_ubuntu_based() {
  [[ -f /etc/os-release ]] && grep -qi 'ubuntu' /etc/os-release
}

## termux hacks for bash_profile
if is_termux; then
  export TERMUX=true
fi
if [ -f "$PREFIX/etc/os-release" ]; then
  export TERMUX=false
fi

# This is specific to Termux
if [[ "$TERMUX" ]]; then
  export ANDROID_DATA="/data"
  export ANDROID_ROOT="/system"
  export BOOTCLASSPATH="/system/framework/core-oj.jar:/system/framework/core-libart.jar:/system/framework/conscrypt.jar:/system/framework/okhttp.jar:/system/framework/core-junit.jar:/system/framework/bouncycastle.jar:/system/framework/ext.jar:/system/framework/framework.jar:/system/framework/telephony-common.jar:/system/framework/voip-common.jar:/system/framework/ims-common.jar:/system/framework/apache-xml.jar:/system/framework/org.apache.http.legacy.boot.jar:/system/framework/tcmiface.jar:/system/framework/WfdCommon.jar:/system/framework/oem-services.jar:/system/framework/qcom.fmradio.jar:/system/framework/qcmediaplayer.jar:/system/framework/telephony-ext.jar:/system/app/miui/miui.apk:/system/app/miuisystem/miuisystem.apk"
fi

# Termux does not support locales
if ! "$TERMUX"; then
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
export TZ="Asia/Kolkata"
export NODE_PATH="${USR:-/usr}/lib/node_modules"
export TZDIR="${USR:-/usr}/share/zoneinfo"
export PKG_CONFIG_PATH="${USR:-/usr}/lib/pkgconfig/libgit2.pc"

# set PATH so it includes user's private bin if it exists
pathmunge "$HOME/bin" before
pathmunge "$HOME/.local/bin" before

for file in "$HOME/.gitrc" "$HOME/.bashrc"; do
  [ -f "$file" ] && source "$file"
done

# Set Vim as my default editor
export EDITOR=vim
export PAGER=less

# Check for required commands, but don't fail if they don't exist
for cmd in tty cat rm grep awk fortune lolcat cowsay updatedb parallel pyenv gh neofetch hexdump; do
  command -v "$cmd" &>/dev/null || echo "Warning: $cmd not found"
done

neofetch --off

if ! "$TERMUX"; then
  # if os is arch linux
  if is_arch_linux && command -v archlinux-java &>/dev/null; then
    if ! (archlinux-java status | grep "(default)" >/dev/null 2>&1); then
      archlinux-java fix
    fi
    jvm="$(archlinux-java status | grep '(default)' | awk '{print $1}')"
    export JAVA_HOME="/usr/lib/jvm/${jvm}"
  fi

  export ANT_HOME="${USR}/share/ant"
  export ANT_OPTS="-Xmx1024m -Xms512m"
  export IVY_HOME="${HOME}/.ivy2"
  export WARP_ENABLE_WAYLAND=1
else
  export C_INCLUDE_PATH="${PREFIX}/opt/emscripten/cache/sysroot/include/"
  export BROWSER=w3m
fi

fortune | cowsay | lolcat

export TEMP_DIR="${PREFIX}/tmp"
if [ ! -e "$HOME"/.hushlogin ] && [ ! -e "$HOME"/.chushlogin ]; then
  [ -e "${PREFIX}/etc/mota" ] && source "${PREFIX}/etc/mota"
fi
if [ -e "$HOME"/.chushlogin ]; then
  rm -f "$HOME"/.chushlogin
fi

PS1="\[\e[38;5;148m\]\u\[\e[1;0m\]\A\[\e[1;38;5;112m\]\W\[\e[0m\]$ "

export NVIM_PYTHON_LOG_FILE="${HOME}/nvim-python.log"
export NVIM_PYTHON_LOG_LEVEL=DEBUG

if ! "$TERMUX"; then
  if test -f "${HOME}/.aws/aws_access_key_id"; then
    export AWS_ACCESS_KEY_ID="$(cat "${HOME}/.aws/aws_access_key_id")"
  fi
  if test -f "${HOME}/.aws/aws_secret_access_key"; then
    export AWS_SECRET_ACCESS_KEY="$(cat "${HOME}/.aws/aws_secret_access_key")"
  fi
  export OMPI_ALLOW_RUN_AS_ROOT=1
  export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1
  export MAVEN_OPTS=" --add-exports jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED \
  --add-exports jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED \
  --add-exports jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED \
  --add-exports jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED \
  --add-exports jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED "
  export CLASSPATH=".:/usr/local/lib/antlr-4.13.2-complete.jar:$CLASSPATH"
fi

set -o vi
export PYTHONASYNCIODEBUG=0

# Load API keys from files if they exist
for key_file in "${HOME}/.groq/groq_secret_access_key" \
  "${HOME}/.openai/.secretkey" \
  "${HOME}/.openroutertoken" \
  "${HOME}/.deepseektoken" \
  "${HOME}/.youtubeapikey" \
  "${HOME}/.geminiapikey" \
  "${HOME}/.deepinfratoken" \
  "${HOME}/.falaikey" \
  "${HOME}/.lmstudioapikey" \
  "${HOME}/.harvardartmuseumstoken" \
  "${HOME}/.rtdtoken"; do
  if [[ -f "$key_file" ]]; then
    key_name=$(basename "$key_file" | tr '[:lower:]' '[:upper:]' | sed 's/\.//g')
    if [[ "$key_name" == "GROQ_SECRET_ACCESS_KEY" ]]; then
      export GROQ_SECRET_ACCESS_KEY="$(cat "$key_file")"
      export GROQ_API_KEY="$(cat "$key_file")"
    elif [[ "$key_name" == "SECRETKEY" ]]; then
      export OPENAI_API_KEY="$(cat "$key_file")"
    elif [[ "$key_name" == "OPENROUTERTOKEN" ]]; then
      export OPENROUTER_API_KEY="$(cat "$key_file")"
    elif [[ "$key_name" == "DEEPSEEKTOKEN" ]]; then
      export DEEPSEEK_API_KEY="$(cat "$key_file")"
    elif [[ "$key_name" == "YOUTUBEAPIKEY" ]]; then
      export YOUTUBE_API_KEY="$(cat "$key_file")"
    elif [[ "$key_name" == "GEMINIAPIKEY" ]]; then
      export GEMINI_API_KEY="$(cat "$key_file")"
    elif [[ "$key_name" == "DEEPINFRATOKEN" ]]; then
      export DEEPINFRA_TOKEN="$(cat "$key_file")"
    elif [[ "$key_name" == "RTDTOKEN" ]]; then
      export RTD_TOKEN="$(cat "$key_file")"
    elif [[ "$key_name" == "FALAIKEY" ]]; then
      export FALAI_KEY="$(cat "$key_file")"
    elif [[ "$key_name" == "LMSTUDIOAPIKEY" ]]; then
      export LMSTUDIO_API_KEY="$(cat "$key_file")"
    elif [[ "$key_name" == "HARVARDARTMUSEUMSTOKEN" ]]; then
      export HARVARD_ART_MUSEUMS_API_KEY="$(cat "$key_file")"
    fi
  fi
done

# Load cargo environment if it exists
if [[ -f "$HOME/.cargo/env" ]]; then
  source "$HOME/.cargo/env"
fi

export GITHUB_USERNAME="linusjf"
export PYTHON3_HOST_PROG="${USR}/bin/python"

# Update $PATH variable
pathmunge "${HOME}/.cargo/bin" after
pathmunge "/usr/sbin" after
pathmunge "/sbin" after
pathmunge "/bin" after
pathmunge "${USR}/bin" after
pathmunge "${USR}/local/bin" after
pathmunge "/system/bin" after
pathmunge "/system/xbin" after
pathmunge "${HOME}/wabt/bin" after
pathmunge "${HOME}/go/bin" after
pathmunge "${HOME}/bld" after

pathmunge "${HOME}/userpythonenv/bin" before
[ -n "${JAVA_HOME}" ] && pathmunge "${JAVA_HOME}/bin" before
pathmunge "${USR}/local/go/bin" after
pathmunge "${HOME}/.local/share/gem/ruby/3.3.0/bin" after
pathmunge "${HOME}/Duckdb" after

# add cuda bin
pathmunge /usr/local/cuda-12.9/bin after
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/local/cuda-12.9/lib64"

# add our scripts
pathmunge "${HOME}/binaries" after
pathmunge "${HOME}/PMD/bin" after
pathmunge "${HOME}/LearnJava" after
pathmunge "${HOME}/LearnBnd" after
pathmunge "${HOME}/deepctl/target/release" after
pathmunge "${HOME}/ffmpeg-master-latest-linux64-gpl/bin" after

is_WSL && echo "WSL detected."
is_termux && echo "Termux detected."
is_arch_linux && echo "Arch Linux detected."
if is_ubuntu || is_ubuntu_based; then
  echo "Ubuntu or Ubuntu variant detected."
fi
