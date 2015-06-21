#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# env
if [ -f ~/.env ]; then
	. ~/.env
fi

# aliases
if [ -f ~/.aliases ]; then
	. ~/.aliases
fi