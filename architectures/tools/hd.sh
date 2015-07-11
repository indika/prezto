# HD stuff

export HD_LIBRARY='/Users/indika/dev/opensource/hist/library'

function hd()
{
    /Users/indika/dev/hd/dist/build/hd/hd

    # Another old one
    # /Users/indika/dev/learn/explore/haskell-ncurses/dist/build/explore/explore

    # This is the old one
    # python /Users/indika/dev/sandbox/command_line/screen.py
}

function hdserver()
{

}

function hd_edit()
{
    st -n /Users/indika/dev/hd /Users/indika/dev/learn/explore/haskell-ncurses
}

function hd_build()
{
    cd /Users/indika/dev/hd
    cabal build
}
