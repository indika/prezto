# Wings configuration



# Imports
source $ZSH/architectures/box/common.sh
source $ZSH/architectures/boxen/common.sh


alias ohmyzsh="st -n ~/.zshrc ~/.bashrc  ~/.oh-my-zsh ~/.oh-my-zsh/architectures/osx-wings.sh"


# Motion specific

export MOTION_PORT=59397
export ENGINE_PORT=22


# Advice specific
export CYGWIN=0
export PYTHON_WIN32=0

export PROXY='127.0.0.1:80'
export PROXY_S='127.0.0.1:80'
export USE_PROXY=0

VIRTUALENV_ROOT=/Users/indika/.virtualenvs
PYTHON_POSTFIX=/bin/python

export DRIVE="/Users/indika/Plasma/Google Drive"
export DROPBOX="/Users/indika/Dropbox"
export CODE_LIBRARY=${DROPBOX}/code_library
export CONFIG_PYCHARM='/Users/indika/Library/Preferences/PyCharm30'
export CONFIG_SUBLIME='/Users/indika/Library/Application Support/Sublime Text 3/Packages/User'


alias system_test='sh /Users/indika/dev/hydra/system_tests/test_all.sh'
alias rhythm='/Users/indika/.virtualenvs/rhythms/bin/python /Users/indika/dev/rhythms/explore/create.py'
alias cookies='st $COOKIE_JAR'

alias box_docs='st /Users/indika/Dropbox/code_library/Projects/Box/docs /Users/indika/dev/box/docs'



# Curl settings
USER_AGENT_CHROME="User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36"
USER_AGENT_FIREFOX="User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0"
export USER_AGENT=${USER_AGENT_CHROME}


# Searches using ag
function ad()
{
    ag -A3 -B1 $1 $CODE_LIBRARY /Volumes/MacFuse /Users/indika/dev/box/docs $DRIVE/store
}

function hd()
{
    /Users/indika/.virtualenvs/fibres/bin/python /Users/indika/dev/sandbox/sandbox/command_line/screen.py
    # clear
}

function hdserver()
{
    cd /Users/indika/dev/functional/explore/json
    python respawn.py
}

function hd_redis()
{
    redis-server /opt/boxen/homebrew/etc/redis.conf
}

function synergy_wings_server()
{
    cd /Users/indika/dev/opensource/synergy/synergy-Source/bin
    ./synergys --config /Users/indika/Dropbox/code_library/Tools/Synergy/synergy.wings.conf -f --crypto-pass d95026058966f0712d9a1a361ad23f92 2>&1 | tee  /Users/indika/logs/synergy/synergy.log
}

function synergy_wings_client()
{
    cd /Users/indika/dev/opensource/synergy/synergy-1.5.1-Source/bin/debug
    ./synergyc -f --crypto-pass d95026058966f0712d9a1a361ad23f92 cobalt 2>&1 | tee  /Users/indika/logs/synergy/synergy.log
}

function synergy_build()
{
    cd /Users/indika/dev/opensource/synergy/synergy-Source
    ./hm.sh build -d
}

function sync_cobalt()
{
    printf "Pulling repositories from Cobalt\n"

    cd /Users/indika/dev/box/docs
    git commit -a -m 'autocommit'
    git pull cobalt master
    git push cobalt master

    cd /Users/indika/dev/box/helper
    git commit -a -m 'autocommit'
    git pull cobalt master
    git push cobalt master

    cd /Users/indika/dev/box/templates
    git commit -a -m 'autocommit'
    git pull cobalt master
    git push cobalt master

    cd /Users/indika/dev/box/templates
    git commit -a -m 'autocommit'
    git pull cobalt master
    git push cobalt master

    cd /Users/indika/dev/box/icap_test
    git commit -a -m 'autocommit'
    git pull cobalt master
    git push cobalt master
}


function sync_cobalt()
{
    printf "Pulling repositories from Cobalt\n"

    cd /Users/indika/dev/box/docs
    git commit -a -m 'autocommit'
    git pull cobalt master
    git push cobalt master

    cd /Users/indika/dev/box/helper
    git commit -a -m 'autocommit'
    git pull cobalt master
    git push cobalt master

    cd /Users/indika/dev/box/templates
    git commit -a -m 'autocommit'
    git pull cobalt master
    git push cobalt master

    cd /Users/indika/dev/box/templates
    git commit -a -m 'autocommit'
    git pull cobalt master
    git push cobalt master
}






function instance ()
{
    printf "Creating a new instance of python"

    if
        [[ -e $1 ]]
    then
        rm $1
    fi

    touch $1
    cat $CODE_LIBRARY/Python/python.template.class.commandline.txt >> $1
    s -n $1 $CODE_LIBRARY/Python/python.template.class.commandline.txt
}


function search_anki()
{
    /Users/indika/scripts/wings/search_anki.sh $1
}


function django_instance() {
    source ~/.virtualenvs/django_instance/bin/activate
    cd /Users/indika/dev/instance/django_instance
    st .
}

function feedme() {
    source ~/.virtualenvs/instance/bin/activate
    cd /Users/indika/links/dev/fibres/collector/phantomjs
    st .
    phantomjs start.js
}

function pygme() {
    TARGET=/Users/indika/Plasma/Google\ Drive/store/sync/print
    print ${TARGET}/${1}.html
    pygmentize -f html -O full -o ${TARGET}/${1}.html ${1}
}

function fibres_edit() {
    source ~/.virtualenvs/fibres/bin/activate
    cd /Users/indika/links/dev/fibres/collector
    st . /Volumes/MacFuse/Creations/System/Apps/Fibres
    pip freeze
}


function fibres() {
    export PYTHONPATH="/Users/indika/dev/scraper"
    source ~/.virtualenvs/fibres/bin/activate
    python /Users/indika/dev/scraper/scraper/scrape_gumtree.py

    cp -f $CODE_LIBRARY/Languages/Spanish/spanish.nugget.txt /Users/indika/Dropbox/Public/jBl3liuvOXDpvhYB/fibres
    cp -f $CODE_LIBRARY/Haskell/haskell.nugget.txt /Users/indika/Dropbox/Public/jBl3liuvOXDpvhYB/fibres
    cp -f $CODE_LIBRARY/Python/python.nugget.txt /Users/indika/Dropbox/Public/jBl3liuvOXDpvhYB/fibres
}


function gumtree_old() {
    source ~/.virtualenvs/fibres/bin/activate
    cd /Users/indika/links/dev/fibres/collector/gumtree
    st /Users/indika/Dropbox/Public/jBl3liuvOXDpvhYB/gt/exclusion_list.txt
    st /Users/indika/Dropbox/Public/jBl3liuvOXDpvhYB/gt/create_tarball.py
    #python gumtree_scraper.py > output.html
    #/home/deploy/venvs/python_gumtree_scraper/bin/python /home/deploy/python_gumtree_scraper/gumtree_scraper.py > /home/deploy/static/gumtree.html
    #st output.html
    #open output.html
}

function bus() {
    source ~/.virtualenvs/busroutes/bin/activate
    cd /Users/indika/links/dev/android/busroutes
    st .
    git pull
    git log --graph -5 --all --color \
            --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"
}

function blog() {
    printf "Updating the blog"
    # 2014-01-11
    st $CODE_LIBRARY/Blog/_posts/*.md
    cd /Users/indika/links/dev/ninjacircles/ninjacircles/_posts
    rm *.md
    cp $CODE_LIBRARY/Blog/_posts/*.md .
    git commit -a -m 'updating the blog'
    git push stable scribble
    git push hub scribble
}

function hydra_flux()
{
    cd /Users/indika/dev/hydra/ui/hydra_flux
    source ~/.virtualenvs/hydra_admin/bin/activate
    sh serve.sh
}

function pod_push()
{
    echo ${PWD}
    CURRENT_PATH=${PWD}

    cd /Users/indika/Library/Caches/CocoaPods/Git
    rm -rf *

    cd ${CURRENT_PATH}
    pod spec lint --verbose
    pod push cafe --allow-warnings --verbose
}


function haskell()
{
    # printf "Open a new browser window"
    # pause
    cd /Users/indika/dev/functional
    st $CODE_LIBRARY/Haskell $CODE_LIBRARY/Projects/Euler .
    # open http://learnyouahaskell.com/higher-order-functions#higher-orderism http://www.haskell.org/haskellwiki/Typeclassopedia http://www.seas.upenn.edu/~cis194/lectures.html http://www.haskell.org/ghc/docs/latest/html/libraries/base/Data-Monoid.html http://book.realworldhaskell.org/read/writing-a-library-working-with-json-data.html
    # https://hackage.haskell.org/package/base
    # https://projecteuler.net/problems
    # http://www.haskell.org/haskellwiki/Typeclassopedia
    #
    # http://www.haskell.org/hoogle/ http://holumbus.fh-wedel.de/hayoo/hayoo.html
}

function play_fp()
{
    # runhaskell /Users/indika/dev/library/code-library/Projects/Euler/problem_3/prime.hs
    runhaskell /Users/indika/Plasma/Dev/functional/explore/play.hs
}

function yorgey()
{
    # runhaskell /Users/indika/dev/library/code-library/Projects/Euler/problem_3/prime.hs
    runhaskell /Users/indika/Plasma/Dev/functional/yorgey/week_one/cards.hs
}

function machine_learning()
{
    cd /Users/indika/Plasma/Dev/library/code-library/MachineLearning/course/code
    source ~/.virtualenvs/analytics/bin/activate
    s -n  ~/Plasma/Dev/MachineLearning/tufte /Users/indika/Plasma/Dev/library/code-library/MachineLearning /Users/indika/Plasma/Dev/library/code-library/Octave /Users/indika/Plasma/Dev/library/code-library/Python/analytics
}

function convert_flac_to_mp3()
{
    FILES=*.flac

    for f in $FILES
    do
        echo $f
        flac2mp3 "$f"

    if [[ "$f" != *\.* ]]
    then
        echo "not a file"
    fi

    done
}

function run_last_command()
{
    echo !!
}


# Postgres
# alias postgres_start='postgres -D /usr/local/var/postgres'
alias postgres_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias postgres_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'


SUBLIME_HOME_USER='/Users/indika/Library/Application Support/Sublime Text 3/Packages/User'
PYCHARM_CONFIG_HOME='/Users/indika/Library/Preferences/PyCharm30'
DIAGRAMS_HOME='/Users/indika/dev/meta/diagrams'



alias resume='cd /Users/indika/links/dev/writings/cv;st . /Volumes/MacFuse/Creations/Self/self.resume.txt /Users/indika/Plasma/Google Drive/store/tasks/Resume/task.resume.txt;ant two_page;open Indika\ Piyasena\ -\ Resume.pdf'

alias motion_mosh='mosh root@motion --ssh="ssh -p ${MOTION_PORT}"'
alias motion_ssh='ssh root@motion -p ${MOTION_PORT}'


alias engine_mosh='mosh ubuntu@engine_stable --ssh="ssh -p ${ENGINE_PORT}"'
alias engine_ssh='ssh ubuntu@engine_stable -p ${ENGINE_PORT}'

alias proxy_mosh='mosh ubuntu@engine_proxy --ssh="ssh -p ${ENGINE_PORT}"'
alias proxy_ssh='ssh ubuntu@engine_proxy -p ${ENGINE_PORT}'

alias movies='echo http://thepiratebay.se/browse/201/0/7/0 | pbcopy'
alias south_park='echo http://thepiratebay.se/search/south%20park/0/7/0 | pbcopy'
