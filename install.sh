#!/bin/bash

set -u

THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR

echo "start setup..."

for f in .??*; do
  [ "$f" = ".git" ] && continue

  ln -snfv ~/dotfiles/"$f" ~/
done

cat << EOF
**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************
EOF
