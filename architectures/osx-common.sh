# VI Mode timeout
export KEYTIMEOUT=1


function findr()
{
    find . | grep -i $1
}


alias m_shan='mosh -p 60001 shan'

alias st='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias getpath="pwd | tr -d '\n' | pbcopy"


# Emacs stuff

alias vi='emacsclient -nw'
function em()
{
    emacsclient -n $1
}


# Generic Stuff

export CONFIG_SUBLIME='/Users/indika/Library/Application Support/Sublime Text 3/Packages'
export CONFIG_PYCHARM='/Users/indika/Library/Preferences/PyCharm2016.1'
export DROPBOX="/Users/indika/Dropbox"
export CODE_LIBRARY=${DROPBOX}/code_library

alias resource="source ~/.zshrc"

alias rmpyc='find . -name "*.pyc" -exec rm -rf {} \;'
alias rmlog='find . -name "*.log" -exec rm -rf {} \;'

alias timestamp="python -c 'import time; now = time.time(); print int(now); print int(now * 1000)'"


# Remind Stuff
alias sremind='/Users/indika/.virtualenvs/meta/bin/python /Users/indika/Dropbox/Projects/meta/language/remind.py'

# Search Spanish library
function spag()
{
    ag --ignore-case -A5 $1 $CODE_LIBRARY/Languages/spanish
}



