# VI Mode timeout
export KEYTIMEOUT=1


function findr()
{
    find . | grep -i $1
}


alias m_shan='mosh -p 60001 shan'


alias st='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias getpath="pwd | tr -d '\n' | pbcopy"
