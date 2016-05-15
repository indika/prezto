ZSH_HOME='/Users/indika/.zprezto'
source $ZSH_HOME/architectures/osx-pre.sh

# BOX configuration

# Customize to your needs...

PATH="/opt/boxen/homebrew/Cellar/coreutils/8.23_1/libexec/gnubin:$PATH"
MANPATH="/opt/boxen/homebrew/Cellar/coreutils/8.23_1/libexec/gnuman:$MANPATH"

#export NIX_PATH=nixpkgs=/Users/indika/dev/tools/nixpkgs
#source /Users/indika/.nix-profile/etc/profile.d/nix.sh




# Imports
source $ZSH_HOME/architectures/all-common.sh
source $ZSH_HOME/architectures/osx-common.sh

source $ZSH_HOME/architectures/box/rdp.sh
source $ZSH_HOME/architectures/box/dev.sh

source $ZSH_HOME/architectures/tools/boxen.sh

# source $ZSH_HOME/architectures/tools/hd.sh
# source $ZSH_HOME/architectures/tools/synergy.sh




# Tower stuff

alias tower='/Users/indika/dev/tower/sites'


# Sanity Stuff

alias sanity_start='/Users/indika/dev/sanity/responder/dist/build/sanity/sanity'
alias sanity_ui_start='open /Users/indika/dev/sanity/SanityInterface/build/Release/SanityInterface.app'
alias hitme='/Users/indika/dev/reinforcement/dist/build/reinforcement/reinforcement'

# Delta stuff

function delta_build()
{
    cd /Users/indika/dev/box/delta
    stack build
}

function delta()
{
    /Users/indika/dev/box/delta/.stack-work/install/x86_64-osx/lts-3.15/7.10.2/bin/delta
}

function delta_test()
{
    fswatch --batch-marker -e ".hg" -e ".git" -e ".idea" /Users/indika/dev/box/netbox | delta
}

# Postgres stuff
export PGDATA="/opt/boxen/data/postgresql-9.4"
alias psql='/opt/boxen/homebrew/bin/psql -d postgres'




alias haskell='st -n $CODE_LIBRARY/Haskell $CODE_LIBRARY/Blog ~/dev/functional;cd ~/dev/functional'


alias st='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias getpath="pwd | tr -d '\n' | pbcopy"
alias sshpbcopy="cat ~/.ssh/id_rsa_cobalt.pub|pbcopy"
alias hgbii='hg branches | grep ipiyasena'


alias write='st -n /Users/indika/dev/config/sublime/projects/write.sublime-project'




# Generic stuff
alias movies='echo "https://thepiratebay.vg//browse/201/0/7/0" | pbcopy'



# This has to come after the aliases
function ad()
{
    ag -C5 --ignore-case $1 $CODE_LIBRARY $BOX_DOCS
}




# activate
# source ~/.virtualenvs/netbox/bin/activate


# PYENV Stuff
#TODO: Where is the best place I should be setting this
pyenv shell 2.7.8

# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
# pyenv shell netbox

