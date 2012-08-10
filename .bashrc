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

source ~/.git-completion.sh

# For Python
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# For Node.js
export PATH=/usr/local/bin:$PATH
export PATH=./node_modules/.bin:$PATH

# For Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
