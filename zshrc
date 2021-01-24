# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# set macOS(brew) specific paths
if type brew &>/dev/null; then
  ZSH_PLUGIN_PATH=$(brew --prefix)/share
  FD_BIN=fd

  # use `brew` zsh-completions path
  FPATH=${ZSH_PLUGIN_PATH}/zsh-completions:$FPATH

  # use GNU utilities by default
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

  # use `brew` installed utilities over normal Apple ones
  export PATH="/usr/local/bin:$PATH"
  export PATH="/usr/local/opt/llvm/bin:$PATH"
else
  ZSH_PLUGIN_PATH=~/.zsh
  FD_BIN=fdfind

  # `fd` is used by another package on ubuntu
  alias fd='fdfind'
fi

# Set up the prompt
#

#autoload -Uz promptinit
#promptinit
#prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

alias ls='ls --color=auto -F'
alias ll='ls -al'
alias la='ls -A'
alias l='ls -C'

alias less='less -R'

export EDITOR=vim
set -o vi

# use local bin path
export PATH=$PATH:~/bin

# rust
export PATH="$HOME/.cargo/bin:$PATH"

# >>> conda initialize >>>
__conda_setup="$("${HOME}/miniconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"

  if conda config --get auto_activate_base | grep -q "False" ; then
      starship config conda.ignore_base true
  fi
fi
unset __conda_setup
# <<< conda initialize <<<

if [ ! "$TMUX" = "" ]; then export TERM=xterm-256color; fi

eval "$(starship init zsh)"

export FZF_DEFAULT_COMMAND="${FD_BIN} --type f --hidden --no-ignore-vcs"
export FZF_DEFAULT_OPTS="
--height 40%
--info inline
--layout reverse
--multi
"

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  ${FD_BIN} --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  ${FD_BIN} --type d --hidden --follow --exclude ".git" . "$1"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey '' autosuggest-accept

source ${ZSH_PLUGIN_PATH}/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${ZSH_PLUGIN_PATH}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Use modern completion system
autoload -Uz compinit
compinit
