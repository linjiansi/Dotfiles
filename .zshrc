autoload -Uz compinit && compinit
setopt prompt_subst

function rprompt-git-current-branch {
  local branch_name

  if [ ! -e  ".git" ]; then
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  echo "%F{046}%B[$branch_name]%b"
}

RPROMPT='`rprompt-git-current-branch`'

SEGMENT_SEPARATOR="\uE0B0"

local promot_mark="%B%(?,%F{magenta},%F{red})%(!,#,❯)%b"

PROMPT='%K{039}%F{000} %B%n@%m%b %f%k%K{046}%F{039}$(printf ${SEGMENT_SEPARATOR})%f%F{000}%B%~%b %f%k%F{046}%B$(printf ${SEGMENT_SEPARATOR})%b%f
${promot_mark} '

function precmd() {
    # Print a newline before the prompt, unless it's the
    # first prompt in the process.
    if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
        NEW_LINE_BEFORE_PROMPT=1
    elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
        echo ""
    fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(anyenv init -)"

export HISTSIZE=1000
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

export PATH="$PATH:$HOME/development/flutter/bin"

export PATH="/usr/local/opt/openssl/bin:$PATH"

export PATH="/Users/linjiansi/Library/Android/sdk/platform-tools:$PATH"

export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:"${PATH}"

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

alias vim='nvim'
