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

# Detect support for 256 color mode
# https://unix.stackexchange.com/questions/43945/whats-the-difference-between-various-term-variables
if [ -e /lib/terminfo/x/xterm-256color ]; then
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

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# prompt
function proml {
TITLEBAR=""
PS1="${TITLEBAR}[\u@\h \W]$WHITE\$(parse_git_branch)$ "
PS2='> '
PS4='+ '
}
proml

PATH=$PATH:/sbin:/usr/sbin:$HOME/.dotfiles/bin

# For Python
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# For Node.js
export PATH=$PATH:/opt/joyent/node/bin

# For Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
