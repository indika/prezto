# Boxen stuff


alias boxen_edit='st -n /Users/indika/dev/config/sublime/projects/boxen.sublime-project'


function boxen_pre()
{
    cd /Users/indika/dev/config
    git status

    cd /Users/indika/.zprezto
    git status
}


function boxen_run()
{
    cd /opt/boxen/repo/script
    ./boxen
}

