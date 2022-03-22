# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' menu select=5
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
autoload -U zmv
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
autoload -U colors && colors
setopt prompt_subst

# Load the cool git prompt thing from https://gist.github.com/joshdick/4415470
. ~/.zsh/git_prompt.zsh

JOBS_PR="%(1j.%{$reset_color%}[%{$fg_no_bold[magenta]%}%j%{$reset_color%}].)"
HOST_PR="%{$fg_no_bold[green]%}%m"
PRIV_PR="%{$fg_no_bold[blue]%}%#"
DIR_PR="%{$fg_no_bold[yellow]%}%3~"
GIT_PR="\$(git_prompt_string)"
ERR_PR="%(?..%{$fg_no_bold[red]%}👻  %?spoopy4me 💀
)"
PROMPT="$ERR_PR$HOST_PR$JOBS_PR$GIT_PR$PRIV_PR%{$reset_color%} "
RPROMPT="$DIR_PR%{$reset_color%}"
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
EDITOR="vim"
export EDITOR
export CLICOLOR=1
bindkey -v
# End of lines configured by zsh-newuser-install

#Add users's bin folder to path if it exists and is not already in path.
if [[ -d "${HOME}/bin" && ! ( $PATH =~ "$HOME/bin" || $PATH =~ "~/bin" ) ]] then
    export PATH="$HOME/bin:$PATH"
fi

if [[ -d "${HOME}/repos" ]] then
    export CDPATH="${CDPATH}:${HOME}/repos"
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
cdl () { cd $*; ll }
# cols - 30 allows for line number and truncation message
alias rg='rg --max-columns-preview -M "$(expr "$(tput cols)" - 30)"'

if [[ `uname -s` == "Darwin" ]]; then
    # Make Mac more Linuxy
    alias ls='ls -G'
    alias grep='grep --color=auto'
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'
else
    # Make Linux more Maccy
    alias pbpaste='xsel --clipboard --output'
    alias pbcopy='xsel --clipboard --input'
    alias open="xdg-open"
fi

alias kube='kubectl'

alias yolo='sudo $(fc -ln -1)'
alias xclip='xclip -selection c'
hash bat && alias cat='bat'
hash nix-shell && function ns() { nix-shell -p "$1" --run "$*"; }

Invoke-ScriptAnalyzer () {
    pwsh -command "\"$*\" -split \" \" | ForEach-Object {Invoke-ScriptAnalyzer -Path \$_}"
}

LOCAL_ZSHRC="$HOME/.zsh/zshrc.$(hostname)"
[[ ! -f $LOCAL_ZSHRC ]] || source $LOCAL_ZSHRC
