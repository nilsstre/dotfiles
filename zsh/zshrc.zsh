export LANG=en_US.UTF-8

export XDG_CONFIG_HOME="$HOME/.config"

export ZSH_CUSTOM="$XDG_CONFIG_HOME/zsh"

# Supported prompts:
#   - oh-my-zsh
#   - starship
PROMPT_TYPE="oh-my-zsh"

if [[ "$PROMPT_TYPE" == "oh-my-zsh" ]]; then
  export ZSH="$XDG_CONFIG_HOME/oh-my-zsh"
  export ZSH_THEME="powerlevel10k/powerlevel10k"

  # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
  # Initialization code that may require console input (password prompts, [y/n]
  # confirmations, etc.) must go above this block; everything else may go below.
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi

  zstyle ':omz:plugins:nvm' lazy yes

  plugins=(
    zsh-syntax-highlighting
    nvm
  )

  source $ZSH/oh-my-zsh.sh
elif [[ "$PROMPT_TYPE" == "starship" ]]; then
  if ! [ -x "$(command -v starship)" ]; then
    brew install starship
  fi

  export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/config.toml"

  eval "$(starship init zsh)"
else
  printf "WARNING! No prompt matching: %s\n" $PROMPT_TYPE
fi
  
eval "$('/opt/homebrew/bin/brew' shellenv)"

#autoload -Uz +X compinit && compinit
#autoload -Uz +X bashcompinit && bashcompinit

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export TMS_CONFIG_FILE="$XDG_CONFIG_HOME/tms/config.toml"

export MANPAGER='nvim +Man!'

ENABLE_CORRECTION="false"

COMPLETION_WAITING_DOTS="true"

typeset -U fpath
CUSTOM_FUNCTIONS_DIR="$ZSH_CUSTOM/functions"

fpath=($CUSTOM_FUNCTIONS_DIR $fpath)
autoload -Uz ${CUSTOM_FUNCTIONS_DIR}/*

if [ -x "$(command -v fzf)" ]; then
  source <(fzf --zsh)
else
  echo "fzf is not installed!"
fi

bindkey "ç" fzf-cd-widget

source ~/.keprc

if [[ "$PROMPT_TYPE" == "oh-my-zsh" ]]; then
  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi

source $ZSH_CUSTOM/aliases.zsh

export NVM_DIR="$XDG_CONFIG_HOME/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ~/.environment_variables
