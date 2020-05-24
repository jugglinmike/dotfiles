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
  if [ -n "$TMUX" ]; then
    export TERM=screen
  else
    export TERM='xterm-256color'
  fi
else
  export TERM='xterm-color'
fi

if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && \
		eval "$(dircolors -b ~/.dircolors)" || \
		eval "$(dircolors -b)"

	alias ls='ls --color=auto'

	# Modify the color of matching file names ("fn") from purple (35) to cyan
	# (36). this improves legibility in Ubuntu's default terminal
	# configuration.
	export GREP_COLORS='ms=01;31:mc=01;31:sl=:cx=:fn=36:ln=32:bn=32:se=36'
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
source ~/.local/bin/virtualenvwrapper.sh

# For Node.js
export PATH=$PATH:/opt/node/node/bin

# For Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
