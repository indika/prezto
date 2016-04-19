# It is important to source boxen before Prezto so that it can find binaries
echo 'Sourcing boxen'
SHELL='/bin/zsh'
source /opt/boxen/env.sh


# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

