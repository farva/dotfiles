#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# env
if [ -f ~/.env ]; then
	. ~/.env
fi

# aliases
if [ -f ~/.aliases ]; then
	. ~/.aliases
fi

# complition
complete -cf sudo

