#!/usr/bin/env zsh

###############################################################################
#                               History Settings                              #
###############################################################################
# Enable additional glob operators
setopt EXTENDED_GLOB

# Keep the recent copy of each duplicate
setopt HIST_IGNORE_ALL_DUPS

# Use the system"s fcntl call
setopt HIST_FCNTL_LOCK

# Sync history between sessions
setopt SHARE_HISTORY

# Configure history file
HISTFILE=${XDG_DATA_HOME:=~/.local/share}/zsh/history

[[ -d $HISTFILE:h ]] ||
	mkdir -p $HISTFILE:h

SAVEHIST=$(( 100 * 100 ))
HISTSIZE=$(( 1.2 * SAVEHIST ))

###############################################################################
#                            Environment Variables                            #
###############################################################################
# -U ensures each entry in these is unique (that is, discards duplicates).
typeset -U PATH path FPATH fpath MANPATH manpath
typeset -UT INFOPATH infopath

export EDITOR="nvim"
export VISUAL="nvim"

path=(
	$path
	$HOME/.local/bin
	/usr/local/texlive/2023/bin/x86_64-linux/
)

manpath=(
	$manpath
	/usr/local/texlive/2023/texmf-dist/doc/man
)

infopath=(
	$infopath
	/usr/local/texlive/2023/texmf-dist/doc/info
)

###############################################################################
#                                   OhMyZsh                                   #
###############################################################################
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$ZDOTDIR/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
	# zsh-autocomplete
)

# Load plugins
source $ZSH/oh-my-zsh.sh
source $ZDOTDIR/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

###############################################################################
#                                   Aliases                                   #
###############################################################################
# Alias eza better ls
eza_params=("--git" "--icons" "--classify" "--group-directories-first" "--time-style=long-iso" "--group" "--color-scale=all")

alias ls="eza ${eza_params}"
alias l="eza --git-ignore ${eza_params}"
alias ll="eza --all --header --long ${eza_params}"
alias llm="eza --all --header --long --sort=modified ${eza_params}"
alias la="eza -lbhHigUmuSa"
alias lx="eza -lbhHigUmuSa@"
alias lt="eza --tree"
alias tree="eza --tree"

# Alias nvim for vi && vim
alias vi="nvim"
alias vim="nvim"

# Alias kitty"s image display command
alias icat="kitten icat"
