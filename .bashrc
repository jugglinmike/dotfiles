#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

if [ -n "$DISPLAY" ]; then
     BROWSER=chromium-browser
fi

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi

if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && \
		eval "$(dircolors -b ~/.dircolors)" || \
		eval "$(dircolors -b)"

	alias ls='ls --color=auto'
	alias grep='grep --color=auto'
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
PATH="${PATH}:/home/mike/.gem/ruby/1.9.1/bin"

export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

# Shopximity
M2_HOME="/usr/local/apache-maven/apache-maven-3.0.3"
M2="${M2_HOME}/bin"
JAVA_HOME="/usr/lib/jvm/java-6-openjdk"
export SPX_DEV_ROOT="/home/mike/projects/shopximity/spx-web"
PATH="${PATH}:${JAVA_HOME}:${M2}"
