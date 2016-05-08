# Boxen stuff


alias boxen_edit='st -n /Users/indika/dev/config/sublime/projects/boxen.sublime-project'
alias ap='ansible-playbook'
alias lap='ansible-playbook -i "localhost," -c local mesa.yml'


function pre_boxen()
{
    cd /Users/indika/dev/config
    git status

    cd /Users/indika/.zprezto
    git status

    echo 'Keep sudo alive\n'
    echo 'while true; do sudo echo "Keeping sudo alive..."; sleep 60; done'
}


function run_boxen()
{
    cd /opt/boxen/repo/script
    ./boxen
}

function graph_boxen()
{
    cd /opt/boxen/repo/script
    ./boxen --graph
}

