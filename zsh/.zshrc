# -----------------------------
# rbenv setup for Ruby
# -----------------------------
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init - zsh)"
rbenv global 3.3.5
rbenv rehash

# -----------------------------
# Powerlevel10k instant prompt
# -----------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -----------------------------
# Oh My Zsh
# -----------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="spaceship"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# -----------------------------
# Starship prompt
# -----------------------------
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(starship init zsh)"

# -----------------------------
# Conda
# -----------------------------
__conda_setup="$('/home/ramjan/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    [ -f "/home/ramjan/miniconda3/etc/profile.d/conda.sh" ] && source "/home/ramjan/miniconda3/etc/profile.d/conda.sh"
    export PATH="/home/ramjan/miniconda3/bin:$PATH"
fi
unset __conda_setup

# -----------------------------
# Cargo
# -----------------------------
. /home/ramjan/.cargo/env

# -----------------------------
# GEM / Ruby paths
# -----------------------------
export GEM_HOME="$HOME/.gem"
export PATH="$HOME/.gem/ruby/3.4.0/bin:$PATH"

# -----------------------------
# Local binaries
# -----------------------------
export PATH="$HOME/.local/bin:$PATH"

# -----------------------------
# Libtorch library path
# -----------------------------
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/home/ramjan/libtorch"

# -----------------------------
# Aliases
# -----------------------------
alias st='speedtest-cli --secure'
