#
# ~/.bash_profile
#
[[ -f ~/.bashrc ]] && . ~/.bashrc


# CUSTOM PS1

# GIT STUFF, use_color is defined in ~/.bashrc
source /usr/share/git/completion/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_DESCRIBE_STYLE=1

# COPYED FROM ENDEAVOUROS ~/.bashrc
if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	if [[ ${EUID} == 0 ]] ; then
		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\][%(__git_ps1 "%s")][\D{%H:%M:%S]\$\[\033[00m\] '
	else
		PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]$(__git_ps1 "[%s\[\033[01;32m\]]")[\[\033[01;37m\]\D{%H:%M:%S}\[\033[01;32m\]]\$\[\033[00m\] '
	fi

	alias ls='ls --color=auto'
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W\[\033[01;32m\]][\[\033[01;37m\]\D{%H:%M:%S}\[\033[01;32m\]] \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

# RUST
. "$HOME/.cargo/env"
# aggiungo cargo al path per i pacchetti installati tramite cargo install
export PATH=$HOME/.cargo/bin:$PATH

# JAVA
export JAVA_HOME=/usr/lib/jvm/default
export PATH=$PATH:$JAVA_HOME/bin

# ANDROID SDK
export ANDROID_HOME='/opt/android-sdk'
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools

# FLUTTER
export CHROME_EXECUTABLE=/usr/bin/chromium
export PATH=$PATH:/opt/flutter/bin

# VIM ALIAS
alias vim="nvim"
source /usr/share/nvm/init-nvm.sh

# Added by Toolbox App
export PATH="$PATH:/home/chris/.local/share/JetBrains/Toolbox/scripts"

