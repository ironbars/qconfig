#
# ~/.bashrc
#

# If not running interactively, dont do anything
[[ $- != *i* ]] && return

# Shell behavior variables
# -------------
shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob

# Environment variables
# -------------
export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth
export EDITOR=vim
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# Prompt
# -------------
PS1='\[\e[0;36m\][\u@\h \W]\$\[\e[0m\] '

