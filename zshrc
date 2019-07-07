# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' substitute 1
zstyle :compinstall filename '/home/stefan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# autoload -Uz promptinit
# promptinit
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000
setopt appendhistory
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias pacman='pacman --color=auto'

. /usr/share/git/completion/git-prompt.sh
setopt prompt_subst
# zle_highlight=(default:bold)
autoload -U colors && colors # Enable colors in prompt
export PROMPT=$'%B%{$fg[green]%}%2~ %b%{$fg[green]%}$(__git_ps1 "[%s] ")%{$reset_color%}'

[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

