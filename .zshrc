export PATH=$HOME/bin:/usr/local/bin:$PATH

ZSH_THEME="obraun"

COMPLETION_WAITING_DOTS="true"

# Antidote
source ~/.antidote/antidote.zsh
antidote load

# fzf
source <(fzf --zsh)

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi


# Open vim with sudo using the current profile (.vimrc)
alias svim='sudo -E vim'

# Remove squashed branches
alias gbdaa='git checkout -q $(git_main_branch) && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base $(git_main_branch) $branch) && [[ $(git cherry $(git_main_branch) $(git commit-tree $(git rev-parse $branch^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'
alias gbddaa='git checkout -q $(git_develop_branch) && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base $(git_develop_branch) $branch) && [[ $(git cherry $(git_develop_branch) $(git commit-tree $(git rev-parse $branch^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'

# export PATH=$PATH:$HOME/Library/Python/3.7/bin

# Add android to PATH
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Setup Java Home to use Android Studio version
export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
export PATH=$PATH:$JAVA_HOME/bin

# Local SAM alias
alias lsam='DOCKER_HOST=unix://$HOME/.docker/run/docker.sock sam'
