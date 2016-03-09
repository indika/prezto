function react_doodat()
{
    hg branch
    cd /Users/indika/dev/box/netbox_reporting/nbreporting/src/web/js
    ./node_modules/watchify/bin/cmd.js index.jsx -o index.js -t babelify & watchaup ireport &

    # aup -rm ireport nbreporting
}


function react_tutorial()
{
    cd /Users/indika/dev/tutorials/react-learn/src/app
    python serve.py &

    cd /Users/indika/dev/tutorials/react-learn
    # babel --presets react src --watch --out-dir build
    # /usr/local/lib/node_modules/browserify/bin/cmd.js -t babelify  src/js/nugget.jsx -o build/js/nugget.js
    ./node_modules/watchify/bin/cmd.js -t babelify  src/js/nugget.jsx -o build/js/nugget.js
}


function react_build()
{
    /Users/indika/dev/tutorials/react-learn
    /usr/local/lib/node_modules/browserify/bin/cmd.js -t babelify  src/js/nugget.jsx -o build/js/nugget.js
}
