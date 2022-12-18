#!/bin/bash

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."

brew upgrade --all

formulas=(
  git
  fzf
  bat
  curl
  jq
  neovim
  anyenv
  terraform
  zsh-syntax-highlighting
  tree
)

echo "start brew install"
for formula in "${formulas[@]}"; do
  brew install $formula || brew upgrade $formula
done

cat << EOF

**************************************************
HOMEBREW INSTALLED! bye.
**************************************************

EOF
