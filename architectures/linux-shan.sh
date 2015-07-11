# SHAN


# C7 Specific stuff
alias c='systemctl'

export GREP_OPTIONS='--color=always'

function resource {
    source ~/.bashrc
}


function pc {
    cd /puppet
    git reset --hard HEAD
    librarian-puppet install
    librarian-puppet update
    puppet apply --modulepath /puppet/modules /puppet/manifests/site.pp
}

function debug_pc {
    cd /puppet

    # because i don't want to loose my locate changes
    # git reset --hard HEAD
    librarian-puppet install
    librarian-puppet update
    puppet apply --modulepath /puppet/modules /puppet/manifests/site.pp
}

function movies {
    mount -t vboxsf Movies /mnt/Movies/
    mount -t ntfs-3g /dev/sdb1 /mnt/Will
    cd /mnt/Will/Indika
}



function scrape_gumtree() {
    cd /home/deploy/applications/python_gumtree_scraper
    /home/deploy/.virtualenvs/python_gumtree_scraper/bin/python /home/deploy/applications/python_gumtree_scraper/gumtree_scraper.py --output /home/deploy/static/gumtree.html
}

alias nginx_logs='tail -f /var/data/www/apps/tomatoes/logs/nginx_access.log /var/data/www/apps/tomatoes/logs/nginx_error.log /var/log/nginx/access.log /var/log/nginx/error.log'

function postgres_status() {
    su postgres -c 'echo "\l" | psql'
    su postgres -c 'echo "\du" | psql'
}

function upgrade_requirements() {
    sh /home/deploy/applications/upgrade_requirements.txt
}




