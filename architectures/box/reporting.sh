
function react_api()
{
    cd /Users/indika/dev/box/netbox_reporting/nbreporting/src3
    # aup -r lego . -v;
    hg baup lego .
    ss lego 'systemctl restart httpd'

}

function react_curl_columns()
{
    curl 'http://lego.safenetbox.biz/reporting/query/columns/?datasource=netlog' -H 'Accept-Encoding: gzip, deflate, sdch' -H 'Accept-Language: en-US,en;q=0.8' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36' -H 'Accept: */*' -H 'Referer: http://lego.safenetbox.biz/reporting/query' -H 'Cookie: session=SvgkdL4dS9Ggga1ErFcx5pzneTeQtWrX5cPTj7M7rCowCDoQbyf47n36El1nBVtvG2kfaDWJkwzVj5DcEx+nuDUIgx+0vLj0k/h5N3gq2qoqwkoV8mTNzv+QBnr69tWnJdFNfihznWASEqQQoP3OVQ==' -H 'Connection: keep-alive' --compressed
}


function react_somthing()
{
    ./node_modules/browserify/bin/cmd.js index.jsx -o build/reporting-development.js -t babelify & watchaup lego
}

function react_init()
{
    #TODO: Fix this version
    revert_vm lego 61
    sleep 5s
    site-update lego netbox_31.0
    sleep 60s

    python /Users/indika/dev/box/sandbox/contact_site.py waitup lego 31.0
    ss lego 'touch /nbdebug; reboot'
    sleep 5s
    python /Users/indika/dev/box/sandbox/contact_site.py waitup lego 31.0

    cd /Users/indika/dev/tower/sites/lego
    ansible-playbook lego.yml
    site-update lego devtools
    ss lego 'touch /tmp/q'

    cd /Users/indika/dev/box/netbox_reporting/nbreporting

}


function react_columns()
{
    # npm set strict-ssl false

    cd /Users/indika/dev/box/netbox_reporting/nbreporting/src/web/js

    #Or should it look like this
    # ./node_modules/browserify/bin/cmd.js index.jsx -o index.js -t [babelify --presets es2015 --presets react --presets stage-2 --plugins transform-class-properties]

    # fswatch .
    ./node_modules/watchify/bin/cmd.js index.jsx -o build/reporting-development.js -t babelify & watchaup lego &
}


function react_sandbox()
{
    cd /Users/indika/dev/tutorials/react-sandbox
    # babel --presets react src --watch --out-dir build

    # Try these transforms
    # -t [babelify --presets es2015 --presets react --presets stage-2 --plugins transform-class-properties]

    # /usr/local/lib/node_modules/browserify/bin/cmd.js -t babelify  src/js/query.jsx -o build/js/query.js

    # ./node_modules/browserify/bin/cmd.js -t babelify --presets es2015 --presets react --presets stage-2 --plugins transform-class-properties  src/js/query.jsx -o build/js/query.js

    fswatch . &
    ./node_modules/watchify/bin/cmd.js -t babelify --presets es2015 --presets react --presets stage-2 --plugins transform-class-properties  src/js/query.jsx -o build/js/query.js

    # watchify -t babelify --presets es2015 --presets react --presets stage-2 --plugins transform-class-properties  src/js/query.jsx -o build/js/query.js
}


