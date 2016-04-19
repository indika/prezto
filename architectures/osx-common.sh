# VI Mode timeout
export KEYTIMEOUT=1


function findr()
{
    find . | grep -i $1
}


alias m_shan='mosh -p 60001 shan'

alias st='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias getpath="pwd | tr -d '\n' | pbcopy"


# Generic Stuff

export CONFIG_SUBLIME='/Users/indika/Library/Application Support/Sublime Text 3/Packages'
export CONFIG_PYCHARM='/Users/indika/Library/Preferences/PyCharm40'
export DROPBOX="/Users/indika/Dropbox"
export CODE_LIBRARY=${DROPBOX}/code_library

alias resource="source ~/.zshrc"
