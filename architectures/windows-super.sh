# Super Windows configuration

printf "Sourcing Windows architecture configuration\n"

function st() {
"/cygdrive/c/dev/programs/Sublime/sublime_text.exe" `cygpath --windows $1`
}

function sao() {
"/cygdrive/c/dev/programs/Sublime/sublime_text.exe" `cygpath --windows .`
}



# Advice specific
export CYGWIN=1
export PYTHON_WIN32=1

export PROXY='http://proxyf5:8080'
export PROXY_S='https://proxyf5:8080'
export USE_PROXY=1

VIRTUALENV_ROOT=/cygdrive/c/dev/virtualenvs
PYTHON_POSTFIX=/Scripts/python.exe

export ADVICE_PROJECT_ROOT=/cygdrive/c/dev/projects
export ADVICE_FACTORY_ROOT=${ADVICE_PROJECT_ROOT}/advice-trunk-compfn
export ADVICE_INTROSPECTION_ROOT=${ADVICE_PROJECT_ROOT}/advice-introspection
export ADVICE_DOC_ROOT=${ADVICE_PROJECT_ROOT}/advice-docs
export ADVICE_META_ROOT=${ADVICE_PROJECT_ROOT}/advice-meta

export ADVICE_SDRIVE_BACKUP_ROOT=/cygdrive/s/QINVEST/XPlan/Deploy/XMerge
export ADVICE_ARTIFACTS=/cygdrive/u/advice

export COOKIE_JAR=/cygdrive/u/advice/data/cookies.txt


alias factory='cd $ADVICE_FACTORY_ROOT; pwd'
alias docs='source /cygdrive/c/dev/virtualenvs/advice-docs/Scripts/activate; cd /cygdrive/c/dev/projects/advice-docs'
alias introspection='source /cygdrive/c/dev/virtualenvs/advice-introspection/Scripts/activate; cd /cygdrive/c/dev/projects/advice-introspection'
alias meta='cd /cygdrive/c/dev/projects/advice-meta'

alias introspect='source ${VIRTUALENV_ROOT}/advice-introspection/Scripts/activate;cd ${ADVICE_PROJECT_ROOT}/advice-introspection'
alias introspect-cygwin='source ${VIRTUALENV_ROOT}/advice-introspection-cygwin/bin/activate;cd ${ADVICE_PROJECT_ROOT}/advice-introspection'

alias cookies='st $COOKIE_JAR'


alias wizardry='source /cygdrive/c/dev/virtualenvs/advice-introspection/Scripts/activate;cd /cygdrive/c/dev/projects/advice-introspection/wizardry;python shifter.py process ../data/specific_advice_2012/'
alias advice='${VIRTUALENV_ROOT}/advice-introspection${PYTHON_POSTFIX} $(cygpath --windows ${ADVICE_PROJECT_ROOT}/advice-introspection/advice.py)'
alias vdx_converter='${VIRTUALENV_ROOT}/advice-introspection${PYTHON_POSTFIX} $(cygpath --windows ${ADVICE_PROJECT_ROOT}/advice-introspection/components/converters/vdx_publisher.py)'




# Curl settinsg
USER_AGENT_CHROME="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36"
USER_AGENT_FIREFOX="Mozilla/5.0 (Windows NT 6.1; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0"
export USER_AGENT=${USER_AGENT_FIREFOX}



# Copy current path to clipboard
alias getpath='pwd > /dev/clipboard'



alias open='/cygdrive/c/Windows/explorer.exe /e,`cygpath -w "$1"`'

SUBLIME_HOME_USER='/cygdrive/c/dev/programs/Sublime/Data/Packages/User'
PYCHARM_CONFIG_HOME='/cygdrive/c/dev/cache/.PyCharm/config'

DEV_FOLDER='/cygdrive/c/dev'
CODE_LIBRARY='/cygdrive/c/dev/library/code-library'

DIAGRAMS_HOME='/cygdrive/c/dev/library/code-library/diagrams'








# Because the Python I'm using is windows based
# It is going to be a bitch
# I wonder which one is faster?

#cat /cygdrive/c/dev/projects/advice-introspection/advice.py
#python cygpath --windows '/cygdrive/c/dev/projects/advice-introspection/advice.py'

# This works
#python 'C:\dev\projects\advice-introspection\advice.py'


ohmyzsh()
{
    cd /home/inpiya/.oh-my-zsh
    st /home/inpiya/.oh-my-zsh
    st /home/inpiya/.zshrc
}

django ()
{
	source /cygdrive/c/dev/virtualenvs/django/bin/activate
    cd /cygdrive/c/dev/projects/django_instance
    st .
    python manage.py runserver
}


fp()
{
    TARGET_FILE=$CODE_LIBRARY/Projects/Euler/problem_one/sums.hs
    cat $TARGET_FILE
    st $TARGET_FILE
    runhaskell `cygpath --windows $TARGET_FILE`
}


js()
{

}
