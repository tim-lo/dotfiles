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

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd beep extendedglob nomatch
bindkey -e

SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  ember         # Ember.js section
  kubecontext   # Kubectl context section
  terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  char          # Prompt character
)
SPACESHIP_RPROMPT_ORDER=(exit_code)
SPACESHIP_DIR_TRUNC_PREFIX=".../"
SPACESHIP_PACKAGE_SYMBOL=""
SPACESHIP_NODE_SYMBOL="⏣ "
SPACESHIP_EXIT_CODE_SHOW=true

if [ ! -f $HOME/antigen.zsh ]; then
  curl -L git.io/antigen > $HOME/antigen.zsh
fi
source $HOME/antigen.zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting
export NVM_LAZY_LOAD=true
antigen bundle lukechilds/zsh-nvm
antigen theme denysdovhan/spaceship-prompt
antigen apply

# aliases
## common utils
alias ls='ls -F --color --hyperlink'
alias ll='ls -lA --group-directories-first'
alias lh='ll -h'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias less='less -JNw'
## screen
alias sls='screen -ls'
alias srs='screen -xS'
## misc.
alias zshconf="vim $HOME/.zshrc"
alias sshconf="vim $HOME/.ssh/config"
