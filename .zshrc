# Path to your oh-my-zsh installation.
  export ZSH=/home/Neil/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="rkj-repos"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(dircycle dirhistory themes tmux urltools virtualenv web-search wd)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin"
# includes for go:
export PATH="/mingw64/bin:mingw64/include:$PATH"
export PATH="/c/Python34:$PATH"
export PATH="/c/Python34/Scripts:$PATH"
export PATH="/c/Python27:$PATH"
export PATH="/c/Python27/Scripts:$PATH"
export PATH="/c/Users/Neil/AppData/Local/Programs/Python/Python35:$PATH"
export PATH="/c/Users/Neil/AppData/Local/Programs/Python/Python35/Scripts:$PATH"
export PATH="/c/ProgramData/Chocolatey/bin:$PATH"
export PATH="/c/ProgramData/Oracle/Java/javapath:$PATH"
export PATH="/c/Program Files (x86)/Common Files/Intel/Shared Files/cpp/bin/Intel64:$PATH"
# windows commands:
export PATH="/c/WINDOWS:$PATH"
export PATH="/c/WINDOWS/system32:$PATH"
export PATH="/c/WINDOWS/System32/Wbem:$PATH"
export PATH="/c/WINDOWS/System32/WindowsPowerShell/v1.0:$PATH"
# utils (msysgit here is important!):
export PATH="/c/OpenSSL-Win64/bin:$PATH"
export PATH="/c/Program Files/bin:$PATH"
export PATH="/c/Program Files/Git/cmd:$PATH"
export PATH="/c/Program Files/Bandizip/7z:$PATH"
export PATH="/c/Program Files (x86)/Livestreamer:$PATH"
export PATH="/c/Program Files (x86)/FDK/Tools/win:$PATH"
# for gvim:
export PATH="/c/Program Files/Vim/vim74:$PATH"
# dev tools:
export PATH="/c/Go/bin:$PATH"
export PATH="/d/envos/gowork/bin:$PATH"
export PATH="/C/Program Files/php-5.6.22-nts-Win32-VC11-x86:$PATH"
export PATH="/c/ProgramData/ComposerSetup/bin:$PATH"
export PATH="/c/Users/Neil/AppData/Roaming/Composer/vendor/bin:$PATH"
export PATH="/c/Program Files/nodejs/:$PATH"
export PATH="/c/Users/Neil/AppData/Roaming/npm:$PATH"
export PATH="/c/2lz/Neovim/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias e.="explorer ."
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
# alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias ll='ls -la --color'
alias tmux='tmux attach || tmux new'

# Cut git status from the prompt for performance reasons
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

autoload -U url-quote-magic
zle -N self-insert url-quote-magic

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
