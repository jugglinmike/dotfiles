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

source ~/.git-completion.sh
