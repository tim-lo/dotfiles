zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' file-sort name
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit

# zsh options
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
bindkey -e
## changing directories
setopt AUTO_CD AUTO_PUSHD CDABLE_VARS PUSHD_IGNORE_DUPS PUSHD_MINUS PUSHD_SILENT PUSHD_TO_HOME
## expansion & globbing
setopt EXTENDED_GLOB NOMATCH
## hisotry
setopt APPEND_HISTORY EXTENDED_HISTORY HIST_EXPIRE_DUPS_FIRST HIST_FIND_NO_DUPS HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE HIST_REDUCE_BLANKS HIST_SAVE_NO_DUPS HIST_VERIFY INC_APPEND_HISTORY_TIME
## zle
setopt BEEP

# aliases
## common utils
if [[ -f $(which gls) ]]; then
  alias ls='gls -F --color --hyperlink'
fi
alias ll='ls -lA --group-directories-first'
alias lh='ll -h'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias less='less -JNw'
alias ic='ibmcloud'
alias k='kubectl'
## screen
alias sls='screen -ls'
alias srs='screen -xS'
## misc.
alias zshconf="vim $HOME/.zshrc"
alias sshconf="vim $HOME/.ssh/config"
alias kubeconf="vim $HOME/.kube/config"

# antigen
if [ ! -f $HOME/antigen.zsh ]; then
  curl -L git.io/antigen > $HOME/antigen.zsh
fi
source $HOME/antigen.zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle z-shell/H-S-MW@main
export NVM_LAZY_LOAD=true
antigen bundle lukechilds/zsh-nvm
antigen theme romkatv/powerlevel10k
antigen apply

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $HOME/.p10k.zsh ]] || source $HOME/.p10k.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
