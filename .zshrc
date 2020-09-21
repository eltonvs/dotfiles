# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/eltonviana/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="obraun"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
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
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  npm
  colored-man
  colorize
  pip
  python
  brew
  osx
  zsh-syntax-highlighting
  docker
  django
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ZSH Async
if [[ ! -a ~/.zsh-async ]]; then
  git clone git@github.com:mafredri/zsh-async.git ~/.zsh-async
fi
source ~/.zsh-async/async.zsh

# NVM
export NVM_DIR="$HOME/.nvm"
function _load_nvm() {
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

# tabtab source for serverless package
function _load_tabtab_serverless() {
    local TABTAB_COMPLETIONS_PATH="$HOME/.nvm/versions/node/$(nvm current)/lib/node_modules/serverless/node_modules/tabtab/.completions"
    # uninstall by removing these lines or running `tabtab uninstall serverless`
    [[ -f "$TABTAB_COMPLETIONS_PATH/serverless.zsh" ]] && . "$TABTAB_COMPLETIONS_PATH/serverless.zsh"
    # tabtab source for sls package
    # uninstall by removing these lines or running `tabtab uninstall sls`
    [[ -f "$TABTAB_COMPLETIONS_PATH/sls.zsh" ]] && . "$TABTAB_COMPLETIONS_PATH/sls.zsh"
}

function _load_node_things() {
    _load_nvm && _load_tabtab_serverless
}

# Initialize async worker (for load_node_things)
async_start_worker nvm_worker -n
async_register_callback nvm_worker _load_node_things
async_job nvm_worker sleep 0.1

# Pipenv
eval "$(pipenv --completion)"

# Conda 2 snippets
conda2-activate() {
    source $HOME/miniconda2/bin/activate
}
alias c2activate='conda2-activate'

conda2-deactivate() {
    source $HOME/miniconda2/bin/deactivate
}
alias c2deactivate='conda2-deactivate'

# Conda 3 snippets
conda3-activate() {
    source $HOME/miniconda3/bin/activate
}
alias c3activate='conda3-activate'

conda3-deactivate() {
    source $HOME/miniconda3/bin/deactivate
}
alias c3deactivate='conda3-deactivate'

# Open vim with sudo using the current profile (.vimrc)
alias svim='sudo -E vim'

# Remove squashed branches
alias gbdaa='git checkout -q master && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base master $branch) && [[ $(git cherry master $(git commit-tree $(git rev-parse $branch^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'
alias gbddaa='git checkout -q develop && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base develop $branch) && [[ $(git cherry develop $(git commit-tree $(git rev-parse $branch^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'

# rbenv
# eval "$(rbenv init -)"

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
# [[ -f /Users/eltonviana/.nvm/versions/node/v8.13.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/eltonviana/.nvm/versions/node/v8.13.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh

# configure ghc
# source ~/.ghcup/env

# Add android to PATH
export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$HOME/Library/Python/3.7/bin
export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Set $EDITOR
export EDITOR=vim
