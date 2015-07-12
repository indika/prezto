# Boxen stuff


alias boxen_edit='st -n /Users/indika/dev/config/sublime/projects/boxen.sublime-project'


function pre_boxen()
{
    cd /Users/indika/dev/config
    git status

    cd /Users/indika/.zprezto
    git status
}


function run_boxen()
{
    cd /opt/boxen/repo/script
    ./boxen
}

