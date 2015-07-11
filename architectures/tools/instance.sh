# Instance stuff

function instance_build()
{
    cd /Users/indika/dev/functional/explore/libraries/Instance
    cabal build
}

function instance_run()
{
    /Users/indika/dev/functional/explore/libraries/Instance/dist/build/Instance/Instance
}

function instance_log()
{
    tail -f /Users/indika/logs/instance/instance.log
}

function instance_proc()
{
    runhaskell /Users/indika/dev/functional/explore/libraries/Proc.hs
}



