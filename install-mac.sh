#!/bin/bash

set -eufo pipefail


echo ""
echo "🤚  This script will install some necessary plugins for you."
read -n 1 -r -s -p $'    Press any key to continue or Ctrl+C to abort...\n\n'


# Install Homebrew
command -v brew >/dev/null 2>&1 || \
    (echo '🍺  Installing Homebrew' && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)")


# Install Oh My Zsh
if [ ! -f ~/.oh-my-zsh/oh-my-zsh.sh ]; then
    (echo '💰  Installing oh-my-zsh' && yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)")
fi


# Install antidote
if [[ ! -d ~/.antidote ]]; then
    (echo '🧪 Installing antidote' && git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.antidote)
fi


# Install fzf
command -v fzf >/dev/null 2>&1 || \
    (echo '🌸 Installing fzf' && brew install fzf)


# ------------

echo ""
echo "Done."
