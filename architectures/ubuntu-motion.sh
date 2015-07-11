# Ubuntu Motion


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

