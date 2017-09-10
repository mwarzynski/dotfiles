# Copyright 2006-2016 Joseph Block <jpb@apesseekingknowledge.net>
#
# BSD licensed, see LICENSE.txt

# Set this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
export COMPLETION_WAITING_DOTS="true"

# Correct spelling for commands
setopt correct

# turn off the infernal correctall for filenames
unsetopt correctall

# Base PATH
PATH=/usr/local/bin:/usr/local/sbin:/sbin:/usr/sbin:/bin:/usr/bin

# Conditional PATH additions
for path_candidate in /opt/local/sbin \
  /Applications/Xcode.app/Contents/Developer/usr/bin \
  /opt/local/bin \
  /usr/local/share/npm/bin \
  ~/.cabal/bin \
  ~/.rbenv/bin \
  ~/bin \
  ~/src/gocode/bin
do
  if [ -d ${path_candidate} ]; then
    export PATH=${PATH}:${path_candidate}
  fi
done

# Yes, these are a pain to customize. Fortunately, Geoff Greer made an online
# tool that makes it easy to customize your color scheme and keep them in sync
# across Linux and OS X/*BSD at http://geoff.greer.fm/lscolors/

export LSCOLORS='Exfxcxdxbxegedabagacad'
export LS_COLORS='di=1;34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'

if [ -f ~/.ssh/id_rsa ]; then
  if [ $(ssh-add -l | grep -c ".ssh/id_rsa" ) -eq 0 ]; then
    ssh-add ~/.ssh/id_rsa
  fi
fi

# Now that we have $PATH set up and ssh keys loaded, configure zgen.

# start zgen
if [ -f ~/.zgen-setup ]; then
  source ~/.zgen-setup
fi
# end zgen

# Set dircolors
eval `dircolors ~/.dircolors/dircolors.ansi-dark`

# set some history options
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify

# Share your history across all your terminal windows
setopt share_history
#setopt noclobber

# set some more options
setopt pushd_ignore_dups
#setopt pushd_silent

# Keep a ton of history.
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Expand aliases inline - see http://blog.patshead.com/2012/11/automatically-expaning-zsh-global-aliases---simplified.html
globalias() {
   if [[ $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
     zle _expand_alias
     zle expand-word
   fi
   zle self-insert
}

zle -N globalias

bindkey " " globalias
bindkey "^ " magic-space           # control-space to bypass completion
bindkey -M isearch " " magic-space # normal space during searches

# Customize to your needs...
# Stuff that works on bash or zsh
if [ -r ~/.sh_aliases ]; then
  source ~/.sh_aliases
fi

# Stuff only tested on zsh, or explicitly zsh-specific
if [ -r ~/.zsh_aliases ]; then
  source ~/.zsh_aliases
fi

if [ -r ~/.zsh_functions ]; then
  source ~/.zsh_functions
fi

export LOCATE_PATH=/var/db/locate.database

# Speed up autocomplete, force prefix mapping
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)*==34=34}:${(s.:.)LS_COLORS}")';

# Honor old .zshrc.local customizations, but print depecation warning.
if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
  echo ".zshrc.local is deprecated - use files in ~/.zshrc.d instead"
fi

# Make it easy to append your own customizations that override the above by
# loading all files from .zshrc.d directory
mkdir -p ~/.zshrc.d
if [ -n "$(ls ~/.zshrc.d)" ]; then
  for dotfile in ~/.zshrc.d/*
  do
    if [ -r "${dotfile}" ]; then
      source "${dotfile}"
    fi
  done
fi

# In case a plugin adds a redundant path entry, remove duplicate entries
# from PATH
#
# This snippet is from Mislav Marohnić <mislav.marohnic@gmail.com>'s
# dotfiles repo at https://github.com/mislav/dotfiles

dedupe_path() {
  typeset -a paths result
  paths=($path)

  while [[ ${#paths} -gt 0 ]]; do
    p="${paths[1]}"
    shift paths
    [[ -z ${paths[(r)$p]} ]] && result+="$p"
  done

  export PATH=${(j+:+)result}
}

dedupe_path

# Usage: extract <file>
# Description: extracts archived files / mounts disk images
extract () {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)  tar -jxvf $1        ;;
            *.tar.gz)   tar -zxvf $1        ;;
            *.bz2)      bunzip2 $1          ;;
            *.gz)       gunzip $1           ;;
            *.tar)      tar -xvf $1         ;;
            *.tbz2)     tar -jxvf $1        ;;
            *.tgz)      tar -zxvf $1        ;;
            *.zip)      unzip $1            ;;
            *.Z)        uncompress $1       ;;
            *)          echo "'$1' cannot be extracted/mounted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

