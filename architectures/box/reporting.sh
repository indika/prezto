

function react_doodat()
{
    hg branch
    cd /Users/indika/dev/box/netbox_reporting/nbreporting/src/web/js
    ./node_modules/watchify/bin/cmd.js index.jsx -o index.js -t babelify & watchaup ireport &

    # aup -rm ireport nbreporting
}


function react_tutorial()
{
    cd /Users/indika/dev/tutorials/react/src/app
    python serve.py &

    cd /Users/indika/dev/tutorials/react
    babel --presets react src --watch --out-dir build
}
