#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PATH=$PATH:$HOME/.local/bin

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias startx='xinit -keeptty -- vt1'
