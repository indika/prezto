# BOX configuration


# Imports
source $ZSH/architectures/box/common.sh
source $ZSH/architectures/boxen/common.sh


alias ohmyzsh="st -n ~/.zshrc ~/.bashrc  ~/.oh-my-zsh ~/.oh-my-zsh/architectures/osx-cobalt.sh"

# Netbox Blue Specific

export BOX_DOCS=/Users/indika/dev/box/docs
export BOX_SAFECHAT=/Users/indika/dev/box/safechat



# Generic Stuff

export CONFIG_SUBLIME='/Users/indika/Library/Application Support/Sublime Text 3/Packages/User'
export CONFIG_PYCHARM='/Users/indika/Library/Preferences/PyCharm30'
export DROPBOX="/Users/indika/Dropbox"
export CODE_LIBRARY=${DROPBOX}/code_library



VIRTUALENV_ROOT=/Users/indika/.virtualenvs



alias pass='pwgen -y 16'



alias rmpyc='find . -name "*.pyc" -exec rm -rf {} \;'
alias rmlog='find . -name "*.log" -exec rm -rf {} \;'

alias haskell='st -n $CODE_LIBRARY/Haskell $CODE_LIBRARY/Blog ~/dev/functional;cd ~/dev/functional'


# This is where the messenger work is
# WORKON=current

# This is Lync, and this is archiving
# WORKON=archiving


# WORKON=lync_archiving
# WORKON=facebook


# LINKEDIN
# This is about scanning the groups
# WORKON=linkedin_all
# WORKON=linkedin_unit


# This is about multi-tenant support
# WORKON=tenant



# THIS IS DEFAULT
WORKON=default



CURRENT_PROJECT=/Users/indika/dev/box/safechat_$WORKON


alias st='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias getpath="pwd | tr -d '\n' | pbcopy"
alias hgbii='hg branches | grep ipiyasena'


alias safechat='$CURRENT_PROJECT/nbwebscan/src/nbwebscan'

alias yahoo='$CURRENT_PROJECT/nbwebscan/src/nbwebscan/yahoo/messenger'
alias linkedin='$CURRENT_PROJECT/nbwebscan/src/nbwebscan/linkedin'
alias twitter='$CURRENT_PROJECT/nbwebscan/src/nbwebscan/twitter'
alias aim='$CURRENT_PROJECT/nbwebscan/src/nbwebscan/aim'
alias evernote='/Users/indika/dev/box/srm/srm/src/srm/evernote'



alias pass='pwgen -y 16'


alias write='st -n /Users/indika/dev/config/sublime/projects/write.sublime-project'
# alias write='st -n $CURRENT_PROJECT $CODE_LIBRARY /Users/indika/dev/box/docs /Users/indika/dev/box/helper /Users/indika/dev/functional /Users/indika/dev/opensource/synergy/src/lib/platform/OSXScreen.cpp /opt/boxen/repo/modules /opt/boxen/repo/manifests /Users/indika/.oh-my-zsh/architectures/osx-cobalt.sh'
alias write_lync='st -n /Users/indika/dev/box/netbox/mslync /Users/indika/dev/deploy /Users/indika/dev/box/netbox/winripclient'

alias hgb="hg branches | sort | grep 'ipiyasena'"
alias icap_spector="/Users/indika/.virtualenvs/safechat/bin/python $CURRENT_PROJECT/nbwebscan/src/nbwebscan/helper/icap_spector/icap_spector.py"



# Generic stuff
alias movies='echo "http://thepiratebay.se/browse/201/0/7/0" | pbcopy'


function aupr()
{
    printf "-> Recursive AUP to Lego and Squid Restart\n"
    aup -r lego .
    ss lego '/etc/init.d/safechat_icap restart'
}





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



# Synergy stuff

function synergy_build()
{
    cd /Users/indika/dev/opensource/synergy
    ./hm.sh build -d
}

function synergy_cobalt_copper_server()
{
    cd /Users/indika/dev/opensource/synergy/bin/debug
    ./synergys --config $CODE_LIBRARY/Tools/Synergy/synergy.cobalt_copper.conf -f --crypto-pass d95026058966f0712d9a1a361ad23f92 2>&1 | tee  /Users/indika/logs/synergy/synergy.log
}

function synergy_cobalt_wings_server()
{
    cd /Users/indika/dev/opensource/synergy/bin/debug
    ./synergys --config $CODE_LIBRARY/Tools/Synergy/synergy.cobalt_wings.conf -f --crypto-pass d95026058966f0712d9a1a361ad23f92 2>&1 | tee  /Users/indika/logs/synergy/synergy.log
}


function synergy_cobalt_client()
{
    /Users/indika/dev/opensource/synergy/bin/debug/synergyc -f --crypto-pass d95026058966f0712d9a1a361ad23f92 192.168.1.54 2>&1 | tee  /Users/indika/logs/synergy/synergy.log
}


function synergy_teleport_copperhead()
{
    cd /Users/indika/dev/opensource/synergy/bin/debug
    scp synergyc indika@copperhead:
}



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


# finish up, wrap up, close, shutdown
function wrapup()
{
    cd $BOX_DOCS
    git status

    printf "-> Delete a snapshot\n"
    printf "-> Leftovers in refridgerator\n"
    printf "-> Shutdown Lego\n"
    printf "Remember to see what is for later in box.next\n"
}


function twisted()
{
    cd /Users/indika/dev/learn/twisted/twisted-intro
    st -n /Users/indika/dev/learn/twisted/twisted-intro
}

function connect_proxy()
{
    cd /Users/indika/dev/box/netbox/nbsquid/src/nbsquid
    aup -r oldrel-default .
    ss oldrel-default 'service connectproxy restart'
    ss oldrel-default 'tail -f /var/log/connect_proxy.log'

}


function external_packages()
{
    cd /Users/indika/dev/box/internal
    aup build7.nb nb-devtools/modules/nbdev/test_sync.py
    aup build7.nb nb-devtools/modules/nbdev/sync.py
    aup build7.nb nb-devtools/modules/nbdev/sync_presync.py
    aup build7.nb nb-devtools/modules/nbdev/build.py

    # ss ipiyasena@build7.nb 'cd /home/ipiyasena/build/netbox; /usr/bin/env python2.7 -m nbdev.test_sync'
    ss ipiyasena@build7.nb 'cd /home/ipiyasena/build/netbox; /usr/bin/env python2.7 -m nbdev.sync_presync'
}

function dns-nbdb()
{
    cd /Users/indika/dev/box/netbox

    aup -r motor nbdbmaint -v

    aup motor nbadmin/src/nbdb.d/creatednsdb.py -v
    ss motor '/usr/libexec/nbdb.d/creatednsdb.py'
}


function space-chunks()
{
    cd /Users/indika/dev/box/netbox/space

    aup -r motor . -v
    ss motor 'sh /files/chunks/contents.sh'
}


function last_command()
{
    var=`tail -2 ~/.zsh_history | head -1`
    echo $var | grep -oE ';(.*)' | cut -c 2- | pbcopy
}



function ad()
{
    ag -C5 --ignore-case $1 $CODE_LIBRARY $BOX_DOCS
}

function hashchat()
{
    curl http://misc-c7.nb:8007/messages\?channels\=%23chat\&limit\=1000 | grep something
}


function clear_flush()
{
    flush_redis
    clear_bundles
}

function flush_redis()
{
    printf "Resetting Cache\n"
    ss lego 'redis-cli -n 1 flushdb'
    # ss motor 'redis-cli -n 1 flushdb'
}

function clear_bundles()
{
    printf "Clearing all bundles\n"
    ss lego 'rm -rf /var/nbwebscan/bundles/*'
    # ss motor 'rm -rf /var/nbwebscan/bundles/*'
}


function lxml_sandbox()
{
    cd /Users/indika/dev/box/lxml_sandbox
    st -n /Users/indika/dev/box/lxml_sandbox

}


function srm_update()
{
    # cd /Users/indika/dev/box/srm/srm/src/srm/twitter
    # cd /Users/indika/dev/box/srm/srm/src/srm/evernote
    cd /Users/indika/dev/box/srm/srm/src
    aup -r srm

    # hg baup 10.107.11.246 /Users/indika/dev/box/srm/srm/src/srm/facebook
    # aup 10.107.11.246 web.py
    ss srm 'systemctl restart srmtwitter-poller srmtwitter-web'
    # ss srm 'systemctl restart srmtwitter-web'

    # ss srm 'systemctl restart srmfacebook-poller.service srmfacebook-recorder.service srmfacebook-web.service'
}

function motor_netcon_test()
{
    SITEKEY=motor
    sc /Users/indika/dev/box/docs/box.lego.bash_rc.txt $SITEKEY:.bashrc
    aup -r $SITEKEY /Users/indika/dev/box/netbox/netcon
    aup -r $SITEKEY /Users/indika/dev/box/netbox/hive
    aup -r $SITEKEY /Users/indika/dev/box/netbox/nbshared
    aup -r $SITEKEY /Users/indika/dev/box/netbox/py-nb
    aup -r $SITEKEY /Users/indika/dev/box/netbox/nbwebobj
    ss $SITEKEY 'systemctl enable hived.service; systemctl start hived.service'
    ss $SITEKEY 'journalctl -u hived.service'

    ss $SITEKEY 'cd /usr/lib/python2.7/site-packages/netcon/migration; python migrationtool.py'
    ss $SITEKEY 'cd /usr/libexec/netcon; python connectd_test.py'

    ss $SITEKEY 'systemctl restart connectd'
}

function netcon_init()
{
    SITEKEY=lego
    sc /Users/indika/dev/box/docs/box.lego.bash_rc.txt $SITEKEY:.bashrc
    aup -r $SITEKEY /Users/indika/dev/box/netbox/netcon
    aup -r $SITEKEY /Users/indika/dev/box/netbox/hive
    aup -r $SITEKEY /Users/indika/dev/box/netbox/nbshared
    aup -r $SITEKEY /Users/indika/dev/box/netbox/py-nb
    aup -r $SITEKEY /Users/indika/dev/box/netbox/nbwebobj
    ss $SITEKEY 'systemctl enable hived.service; systemctl start hived.service'
    ss $SITEKEY 'journalctl -u hived.service'


    # sc /Users/indika/dev/box/netcon_dbs/netcon.db.date $SITEKEY:/etc/netcon
    # sc /Users/indika/dev/box/netcon_dbs/netcon.db.jsracs $SITEKEY:/etc/netcon
    # sc /Users/indika/dev/box/netcon_dbs/netcon.db.nbb-dev $SITEKEY:/etc/netcon
    # sc /Users/indika/dev/box/netcon_dbs/netcon.db.oxcoda $SITEKEY:/etc/netcon
    # sc /Users/indika/dev/box/netcon_dbs/netcon.db.thud $SITEKEY:/etc/netcon

}

function netcon_update()
{
    SITEKEY=lego
    cd ~/dev/box/netbox

    #baup needs Twisted
    hg baup $SITEKEY ~/dev/box/netbox -v
    # aup -r $SITEKEY /Users/indika/dev/box/netbox/netcon

    netcon_curl
}

function netcon_db_switch()
{
    SITEKEY=lego
    ss $SITEKEY 'rm -f /etc/netcon/netcon.db; cp /etc/netcon/netcon.db.nbb-dev /etc/netcon/netcon.db'
}


function netcon_migrate()
{
    SITEKEY=lego
    hg baup $SITEKEY ~/dev/box/netbox
    ss $SITEKEY 'cd /usr/lib/python2.7/site-packages/netcon/migration; python migrationtool.py'
    ss lego 'curl localhost:60002/config/netcon' | pbcopy
    ss lego 'curl localhost:60002/config/netcon' | grep dhcp_global_options

    # ss $SITEKEY 'curl localhost:60002/config/netcon' | pbcopy
    # ss lego 'curl localhost:60002/config/struss' | pbcopy
}

function netcon_curl()
{
    curl 'http://lego.safenetbox.biz/net/dhcpoptions?oid=links/0' -H 'Accept-Encoding: gzip, deflate, sdch' -H 'Accept-Language: en-US,en;q=0.8' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Referer: http://lego.safenetbox.biz/net/local?oid=links%2F0;flav=local' -H 'Cookie: session=AIAQgF2gQ/2KJkyQgpnWW82oyz6bYLHLOADJvjpv1AtLMs/ERAgfOvs47viQEShz+nr7XTejbiaB6kLIybPyL/upa4oVJDJ4Pa4fcN7VuYqkkg36bjS9MP/FXSO86X+vKBmi8+73Ob0daeBKfSkBoQ==' -H 'Connection: keep-alive' --compressed

    # A delete
    #curl 'http://lego.safenetbox.biz/net/local?oid=links%2F0;flav=local' -H 'Pragma: no-cache' -H 'Origin: http://lego.safenetbox.biz' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en,en-US;q=0.8' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: no-cache' -H 'Referer: http://lego.safenetbox.biz/net/local?oid=links%2F0;flav=local' -H 'Cookie: session=Z575hMH9Q+OYE0bLnCReIEnVJsfOO4mEawaQlqVJQvtV2Z0Quvoy1MdAR1g8XIlg2ug7u8P1ykokAS8llMGfGAmWjmYoevm22FmYbI0vQFQNy/CbgV90Av/HxKbkh4hTC2tA9Gz5sjGQVz+is+nHmA==' -H 'Connection: keep-alive' --data '__formname__=link&oid=links%2F0&flav=local&dhcp_start=192.168.0.100&dhcp_end=192.168.0.200&%3D%3Dnetworks4%3Dip%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F1%5D=10.233.255.253&%3D%3Dnetworks4%3Dprefix%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F1%5D=255.255.0.0&%3D%3Dnetworks4%3Dcomment%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F1%5D=Old+NBB&%3D%3Dnetworks4%3Dip%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F0%5D=10.12.255.253&%3D%3Dnetworks4%3Dprefix%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F0%5D=255.255.0.0&%3D%3Dnetworks4%3Dcomment%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F0%5D=Current+NBB&%3D%3Dnetworks4%3Ddel%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F3%5D=on&%3D%3Dnetworks4%3Dip%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F3%5D=10.201.255.253&%3D%3Dnetworks4%3Dprefix%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F3%5D=255.255.0.0&%3D%3Dnetworks4%3Dcomment%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F3%5D=New+NEW+YO+YO+NBB&%3D%3Dnetworks4%3Dip%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F2%5D=10.202.255.253&%3D%3Dnetworks4%3Dprefix%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F2%5D=255.255.0.0&%3D%3Dnetworks4%3Dcomment%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_networks%2F2%5D=New+YOYOMAMA+NBB&%3D%3Dnetworks4%3Dip%5B___new___%5D=&%3D%3Dnetworks4%3Dprefix%5B___new___%5D=&%3D%3Dnetworks4%3Dcomment%5B___new___%5D=&networks_update=Update&%3D%3Droutes4%3Dnetwork%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_routes%2F0%5D=10.201.0.0&%3D%3Droutes4%3Dprefix%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_routes%2F0%5D=255.255.0.0&%3D%3Droutes4%3Dvia%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_routes%2F0%5D=10.201.255.253&%3D%3Droutes4%3Dmtu%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_routes%2F0%5D=1500&%3D%3Droutes4%3Dcomment%5B%2Fnetcon%2Fall_links%2F0%2Fipv4_routes%2F0%5D=ROUTING+ROUTING&%3D%3Droutes4%3Dnetwork%5B___new___%5D=&%3D%3Droutes4%3Dprefix%5B___new___%5D=&%3D%3Droutes4%3Dvia%5B___new___%5D=&%3D%3Droutes4%3Dmtu%5B___new___%5D=1500&%3D%3Droutes4%3Dcomment%5B___new___%5D=' --compressed
}

function netcon_test_lite()
{
    SITEKEY=lego
    hg baup $SITEKEY ~/dev/box/netbox
    cd /Users/indika/dev/box/netbox/netcon/src/netcon/test
    python test_migration.py
}


function srm_test()
{
    # cd /Users/indika/dev/box/srm/srm/src/srm

    cd /Users/indika/dev/box/srm/srm/src/srm/
    aup -r srm .
    # /usr/lib/python2.7/site-packages/srm/facebook/test
    # ss srm 'cd /usr/lib/python2.7/site-packages/srm/evernote/test; py.test -xvs .' 2>&1 | tee test_read_evernote.py.log
    # ss srm 'cd /usr/lib/python2.7/site-packages/srm/twitter/test; py.test -xvs .' 2>&1 | tee test_twitter.log
    ss srm 'cd /usr/lib/python2.7/site-packages/srm/twitter/test; py.test -xvs test_read.py > out.log 2>&1 ; cat out.log' 2>&1 | tee test_twitter.log
}


function srm_fetch_cache()
{
    printf "Re-Fetching SRM cache from srm\n"
    cd ~
    rm -rf /Users/indika/temp/srm_cache
    sc -r 10.107.11.246:/tmp/realtime /Users/indika/temp/srm_cache
    cd ~/temp/srm_cache
    fdupes -dN ~/temp/srm_cache
}


function cert_update()
{
    cd /Users/indika/dev/box/agent/certinstaller-osx
    sc build-updater-pkg ipiyasena@build7.nb:/home/ipiyasena/build/agent/certinstaller-osx/build-updater-pkg
    sc /Users/indika/dev/box/agent/certinstaller-osx/installroot/Applications/BYODUpdater.app/Contents/MacOS/certinstall ipiyasena@build7.nb:/home/ipiyasena/build/agent/certinstaller-osx/installroot/Applications/BYODUpdater.app/Contents/MacOS
    sc /Users/indika/dev/box/agent/osxurlfetch/macbuild ipiyasena@build7.nb:/home/ipiyasena/build/agent/osxurlfetch/macbuild

    sc /Users/indika/dev/box/agent/osxurlfetch/src/OSXURLFetch/OSXURLFetch/main.m admin@macbuild27.nb:/Users/admin/build/agent/osxurlfetch/src/OSXURLFetch/OSXURLFetch
    sc /Users/indika/dev/box/agent/osxurlfetch/macbuild admin@macbuild27.nb:/Users/admin/build/agent/osxurlfetch/macbuild
}

function cert_build()
{
    ss ipiyasena@build7.nb 'cd /var/spool/build/user/ipiyasena/RPMS/x86_64/; rm -f certinstaller_osx*'

    cd /Users/indika/dev/box/agent/certinstaller-osx
    ss ipiyasena@build7.nb 'cd /home/ipiyasena/build/agent/certinstaller-osx; hg build --notag --force'

    ss ipiyasena@build7.nb 'cd /tmp/cert; rm /tmp/cert/certinstaller_osx.rpm; rm -rf home'
    ss ipiyasena@build7.nb 'cp /var/spool/build/user/ipiyasena/RPMS/x86_64/certinstaller_osx-5.5-1.x86_64.rpm /tmp/cert/certinstaller_osx.rpm'
    ss ipiyasena@build7.nb 'cd /tmp/cert; rpm2cpio certinstaller_osx.rpm | cpio -idmv'
    sc ipiyasena@build7.nb:/tmp/cert/home/httpd/netbox/certcheck/install/byodupdater.pkg .
}

function cert_install()
{
    cd /Users/indika/dev/box/agent/certinstaller-osx
    sudo installer -pkg byodupdater.pkg -target /
    cd /Applications/BYODUpdater.app/Contents/MacOS
}


function lync_msi()
{

    ss ipiyasena@oink-new.nb 'ls -lht /packages/netbox-29.5.2/mslync*'
    scp ipiyasena@oink-new.nb:/packages/netbox-29.5.2/mslync-29.5.2-2.i686.rpm .
    sc mslync-29.5.2-2.i686.rpm lego:

    # Join commands using monoids
    ss lego 'rpm -U mslync-29.5.1-24.i686.rpm; rpm -qa | grep mslync'
}

function update_lync()
{
    update_tools;
    cd ~/dev/box/netbox
    aup -r lego mslync;
    aup -r lego winrip;
    aup -r lego winripclient;
    update_lego
    ss lego 'service winrip restart'
    clear_bundles
    flush_redis
}

function lync_server()
{

    cd /Users/indika/dev/box/netbox
    hg baup lego .

    cd /Users/indika/dev/box/netbox/winrip
    aup -r lego .

    cd $CURRENT_PROJECT
    hg baup lego $CURRENT_PROJECT

    # ss lego 'service winrip restart'
    ss lego 'systemctl restart winrip.service'
}

function lync_client_lyncadmin()
{
    cd /Users/indika/dev/box/netbox/mslync
    aup -r --no-restrict --platform winrip Administrator@lyncadmin . -v

    cd /Users/indika/dev/box/netbox/mslyncchat
    aup -r --no-restrict --platform winrip Administrator@lyncadmin . -v

    cd /Users/indika/dev/box/netbox/nblog/src/nblog
    aup -r --no-restrict Administrator@lyncadmin . -v

    cd /Users/indika/dev/box/netbox/nbshared/src/nbshared
    aup -r --no-restrict --platform netbox Administrator@lyncadmin . -v

    cd /Users/indika/dev/box/netbox/winrip/src/winrip
    aup -r --no-restrict --platform netbox Administrator@lyncadmin . -v

    cd /Users/indika/dev/box/netbox/winripclient/src/winripclient
    aup -r --no-restrict Administrator@lyncadmin . -v
}

function lync_client_winsvr()
{
    cd /Users/indika/dev/box/netbox/mslync
    aup -r --no-restrict --platform winrip Administrator@winsvr . -v

    cd /Users/indika/dev/box/netbox/mslyncchat
    aup -r --no-restrict --platform winrip Administrator@winsvr . -v

    cd /Users/indika/dev/box/netbox/nblog/src/nblog
    aup -r --no-restrict Administrator@winsvr . -v

    cd /Users/indika/dev/box/netbox/nbshared/src/nbshared
    aup -r --no-restrict --platform netbox Administrator@winsvr . -v

    cd /Users/indika/dev/box/netbox/winrip/src/winrip
    aup -r --no-restrict --platform netbox Administrator@winsvr . -v

    cd /Users/indika/dev/box/netbox/winripclient/src/winripclient
    aup -r --no-restrict Administrator@winsvr . -v
}


function lync_test_lyncadmin()
{
    cd /Users/indika/dev/box/netbox/mslync
    aup -r --no-restrict --platform winrip Administrator@lyncadmin . -v

    cd /Users/indika/dev/box/netbox/mslyncchat
    aup -r --no-restrict --platform winrip Administrator@lyncadmin . -v

    ss Administrator@lyncadmin 'cd /usr/lib/python2.7/site-packages/mslync/test; /cygdrive/c/dev/python276-32/Scripts/py.test -xvs .' 2>&1 | tee mslync_test.log
    ss Administrator@lyncadmin 'cd /usr/lib/python2.7/site-packages/mslyncchat/test; /cygdrive/c/dev/python276-32/Scripts/py.test -xvs .' 2>&1 | tee mslyncchat_test.log

    ag -B 1 -A 3 'indika' *test.log
    ag -B 1 -A 3 'FAIL' *test.log
    ag -B 1 -A 3 'traceback' *test.log
}

function lync_test_winsvr()
{
    cd /Users/indika/dev/box/netbox/mslync
    aup -r --no-restrict --platform winrip Administrator@winsvr . -v

    cd /Users/indika/dev/box/netbox/mslyncchat
    aup -r --no-restrict --platform winrip Administrator@winsvr . -v

    ss Administrator@winsvr 'cd /usr/lib/python2.7/site-packages/mslync/test; /cygdrive/c/dev/python276-32/Scripts/py.test -xvs .' 2>&1 | tee mslync_test.log
    ss Administrator@winsvr 'cd /usr/lib/python2.7/site-packages/mslyncchat/test; /cygdrive/c/dev/python276-32/Scripts/py.test -xvs .' 2>&1 | tee mslyncchat_test.log

    ag -B 1 -A 3 'indika' *test.log
    ag -B 1 -A 3 'FAIL' *test.log
    ag -B 1 -A 3 'traceback' *test.log
}


function cloud_test_framework()
{
    ss isix 'redis-cli -n 1 flushdb'
    ss isix 'rm -f /tmp/messages/*'
    aup -r isix /Users/indika/dev/box/netbox/cloudcte
    ss isix '/opt/rh/python27/root/usr/bin/supervisorctl restart cloudcte'

    # ss isix '/opt/rh/python27/root/usr/bin/supervisorctl restart safechat:safechat-icap'
    ss isix '/opt/rh/python27/root/usr/bin/python -m icapstestframework.client localhost 1344 --data-path /root/requests/ --nossl --tenant testing'
    ss isix '/opt/rh/python27/root/usr/bin/python /opt/rh/python27/root/usr/lib/python2.7/site-packages/cloudcte/cte_content_dispatcher.py' 2>&1 | tee test_cte.log

    # sc isix:/tmp/messages/email* /Users/indika/temp/email_messages
    rm -f /Users/indika/temp/email_messages/messages/*
    sc -rp 10.107.11.221:/tmp/messages /Users/indika/temp/email_messages
}


function test_cte()
{
    cd /Users/indika/dev/box/netbox/cloudcte
    # update_isix

    aup -r 10.4.10.194 .

    ss root@10.4.10.194 'restore_archive'
    ss root@10.4.10.194 '/opt/rh/python27/root/usr/bin/python /opt/rh/python27/root/usr/lib/python2.7/site-packages/cloudcte/cte_content_dispatcher.py' 2>&1 | tee test_cte.log

    ag -B 1 -A 3 'indika' test_cte.log
}

function test_cloud_nbwebscan()
{
    aup -r 10.4.10.194 $CURRENT_PROJECT/nbwebscan --restrict=cloud
    aup -r 10.4.10.194 $CURRENT_PROJECT/nbarchive --restrict=cloud
    aup -r 10.4.10.194 /Users/indika/dev/box/netbox/cloudcte --restrict=cloud

    ss root@10.4.10.194 '/opt/rh/python27/root/usr/bin/python /opt/rh/python27/root/usr/bin/supervisorctl restart safechat:safechat-icap'
    ss root@10.4.10.194 '/opt/rh/python27/root/usr/bin/python /opt/rh/python27/root/usr/bin/supervisorctl restart cloudcte'

    ss root@10.4.10.194 'recreate_archive'


    printf '\nSleeping for 12s\n'
    sleep 12s
    ss root@10.4.10.194 '/usr/bin/send-icap-data localhost 1344 --data-path /root/requests/ --nossl --tenant testing'
}


function test_multi_tenant_isix()
{
    printf "Uploading the latest JSON schema\n"
    sc ~/dev/box/netbox/cloudconfig/schemas/multitenant-schema.json root@10.4.10.194:/usr/share/nbb/schemas/multitenant-schema.json

    printf "All files (src/nbwebscan/) are being AUPed to LEGO\n"
    aup -r 10.4.10.194 $CURRENT_PROJECT/nbwebscan/src/nbwebscan/
    cd $CURRENT_PROJECT/nbwebscan/src/nbwebscan/test

    # rununittest 10.4.10.194 -c -t '-xsk test_nbbdev_tenant' test_multitenant.py
    # rununittest 10.4.10.194 -c  test_multitenant.py
    # rununittest 10.4.10.194 -n -t '-xvs --report=skipped' test_multitenant.py
    rununittest 10.4.10.194 -n -t '-xvs' test_multitenant.py 2>&1 | tee test_multitenant.py.log

    ag -B 1 -A 3 'indika' test_multitenant.py.log
    ag -B 1 -A 3 'FAIL' test_multitenant.py.log
    ag -B 1 -A 3 'passed' test_multitenant.py.log
}

function test_bb_transcripts()
{
    printf "Uploading the latest JSON schema\n"

    SAMPLE_NAME=vault-transcripts-groupConversation-attach.xml
    SCHEMA=/Users/indika/dev/box/netbox/cloudcte/schemas/vault-transcripts.xsd
    SAMPLE=/Users/indika/dev/box/netbox/cloudcte/src/cloudcte/test/samples/$SAMPLE_NAME
    # SAMPLE=/Users/indika/dev/box/netbox/cloudcte/src/cloudcte/test/samples/vault-transcripts-groupConversation.xml
    print $SAMPLE

    # samples/vault-transcripts-chatConversation.xml

    printf "Locally linting\n"
    xmllint --noout --schema $SCHEMA $SAMPLE
    printf "Done locally linting\n\n\n\n"




    sc $SCHEMA root@10.4.10.194:/usr/share/nbb/schemas/vault-transcripts.xsd
    # sc $SAMPLE root@10.4.10.194:/usr/share/nbb/schemas/samples/$SAMPLE_NAME

    printf "CTE is being AUPed to LEGO\n"
    aup -r 10.4.10.194 --restrict=cloud /Users/indika/dev/box/netbox/cloudcte/src/cloudcte
    cd /Users/indika/dev/box/netbox/cloudcte/src/cloudcte/test

    rununittest 10.4.10.194 -n -t '-xvs --report=skipped' test_transcripts.py 2>&1 | tee test_transcripts.py.log
    ag -B 1 -A 3 'indika' test_transcripts.py.log
    ag -B 1 -A 3 'FAIL' test_transcripts.py.log
    ag -B 1 -A 3 'passed' test_transcripts.py.log
}


function test_on_lego()
{
    printf "HG differential (src/nbwebscan/)  AUPed to LEGO\n"


    hg baup lego $CURRENT_PROJECT
    # hg baup 10.3.115.254 $CURRENT_PROJECT
    rununittest lego -n -t '-xvs --report=skipped' $1 2>&1 | tee $1.log
    # rununittest 10.3.115.254 -n -t '-xvs --report=skipped' $1 2>&1 | tee $1.log

    ag -B 1 -A 3 'indika' $1.log
    ag -B 1 -A 3 'FAIL' $1.log
    ag -B 1 -A 3 'passed' $1.log

    printf "TESTING: %s" % $1
}

function test_on_srm()
{

    hg baup srm /Users/indika/dev/box/srm
    # hg baup 10.3.115.254 $CURRENT_PROJECT
    rununittest srm -n -t '-xvs --report=skipped' $1 2>&1 | tee $1.log

    # rununittest 10.3.115.254 -n -t '-xvs --report=skipped' $1 2>&1 | tee $1.log

    ag -B 1 -A 3 'indika' $1.log
    ag -B 1 -A 3 'FAIL' $1.log
    ag -B 1 -A 3 'passed' $1.log

    printf "TESTING: %s" % $1
}

function test_on_lego_clean()
{
    printf "HG differential (src/nbwebscan/)  AUPed to LEGO\n"


    hg baup lego /Users/indika/dev/box/safechat_clean
    # hg baup 10.3.115.254 $CURRENT_PROJECT
    rununittest lego -n -t '-xvs --report=skipped' $1 2>&1 | tee $1.log
    # rununittest 10.3.115.254 -n -t '-xvs --report=skipped' $1 2>&1 | tee $1.log

    ag -B 1 -A 3 'indika' $1.log
    ag -B 1 -A 3 'FAIL' $1.log
    ag -B 1 -A 3 'passed' $1.log

    printf "TESTING: %s" % $1
}


function test_on_motor()
{
    printf "All files (src/nbwebscan/) are being AUPed to MOTOR\n"
    # aup -r motor $CURRENT_PROJECT/nbwebscan/src/nbwebscan/
    hg baup motor $CURRENT_PROJECT
    rununittest motor -n -t '-xvs --report=skipped' $1 2>&1 | tee $1.log

    ag -B 1 -A 3 'indika' $1.log
    ag -B 1 -A 3 'FAIL' $1.log
    ag -B 1 -A 3 'passed' $1.log

    printf "TESTING: %s" % $1
}


function test_on_isix()
{
    printf "All files (src/nbwebscan/) are being AUPed to ISIX\n"
    aup -r 10.4.10.194 $CURRENT_PROJECT/nbwebscan/src/nbwebscan/
    rununittest 10.4.10.194 -n -t '-xvs --report=skipped' $1 2>&1 | tee $1.log

    ag -B 1 -A 3 'indika' $1.log
    ag -B 1 -A 3 'FAIL' $1.log
    ag -B 1 -A 3 'passed' $1.log

    printf "TESTING: %s" % $1

}




function facebook()
{
    printf "Facebook\n"
    cd $CURRENT_PROJECT/nbwebscan/src/nbwebscan/facebook/test
}


function facebook_protocol_handlers()
{
    ag "r\'\^http.*?\'" $CURRENT_PROJECT -G py
}



function test_all_in_directory()
{
    printf "HG differential (src/nbwebscan/)  AUPed to LEGO\n"
    hg baup lego $CURRENT_PROJECT

    for f in test_*.py
    do
        # echo $f
        filename="${filename%.*}"
        echo filename
        rununittest lego -n -t '-xvs --report=skipped' $f 2>&1 | tee $f.log

    if [[ "$f" != *\.* ]]
    then
        echo "not a file"
    fi

    done

    ag -B 1 -A 3 'indika' *.log
    ag -B 1 -A 3 'FAIL' *.log
    ag -B 1 -A 3 'failed' *.log
    ag -B 1 -A 3 'passed' *.log
}

function test_all_facebook()
{
    printf "HG differential (src/nbwebscan/)  AUPed to LEGO\n"
    hg baup lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/


    for f in $CURRENT_PROJECT/nbwebscan/src/nbwebscan/facebook/test/test_*.py
    do
        # echo $f
        filename="${filename%.*}"
        echo filename
        rununittest lego -n -t '-xvs --report=skipped' $f 2>&1 | tee $f.log

    if [[ "$f" != *\.* ]]
    then
        echo "not a file"
    fi

    done

    ag -B 1 -A 3 'indika' *.log
    ag -B 1 -A 3 'FAIL' *.log
    ag -B 1 -A 3 'failed' *.log
    ag -B 1 -A 3 'passed' *.log
}

function test_all_broken_facebook()
{
    printf "All files are being AUPed\n"
    aup -r lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/

    printf "Running all on Lego\n"
    cd $CURRENT_PROJECT/nbwebscan/src/nbwebscan/facebook/test

    rununittest lego -n -t '-xvs --report=skipped' test_chat_bigpipe_load.py
    rununittest lego -n -t '-xvs --report=skipped' test_chat_with_attachments.py
    rununittest lego -n -t '-xvs --report=skipped' test_json_comments.py
    rununittest lego -n -t '-xvs --report=skipped' test_messages_with_images.py
    rununittest lego -n -t '-xvs --report=skipped' test_news_dynamic_load.py
    rununittest lego -n -t '-xvs --report=skipped' test_news_initial_load.py
    rununittest lego -n -t '-xvs --report=skipped' test_post_image_album.py
    rununittest lego -n -t '-xvs --report=skipped' test_pull.py
}

function test_facebook_comments()
{
    printf "Facebook is being AUPed\n"
    aup -r lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/facebook

    rmlog

    for TARGET_FILE in test_comment_decoding.py test_comment_send.py test_comment_send_nested.py test_comment_xhr.py test_json_comments.py test_spam_comment.py test_view_comment_decoding.py test_view_html_comments.py
    do
        printf "TESTING: %s" % $TARGET_FILE
        rununittest lego -n -t '-vs' $TARGET_FILE 2>&1 | tee $TARGET_FILE.log
    done

    for TARGET_FILE in *.log
    do
        ag -B 1 -A 3 'indika' $TARGET_FILE
        ag -B 1 -A 3 'FAIL' $TARGET_FILE
        ag -B 1 -A 3 'passed' $TARGET_FILE

        printf "TESTING: %s" % $TARGET_FILE
    done
}

function test_facebook_chat()
{
    test_on_lego test_chat_bigpipe_load.py
    test_on_lego test_chat_dynamic_load.py
    test_on_lego test_chat_history.py
    test_on_lego test_chat_receive.py
    test_on_lego test_chat_send.py
    test_on_lego test_chat_with_attachments.py
}

function test_facebook()
{
    printf "Selective NBWebscan is being AUPed\n"
    baup -r lego $CURRENT_PROJECT

    # TARGET_FILE=test_chunks.py
    # TARGET_FILE=test_comments.py
    # TARGET_FILE=test_json_comments.py

    printf "TESTING: %s" % $TARGET_FILE

    rununittest lego -n -t '-xvs' $TARGET_FILE 2>&1 | tee $TARGET_FILE.log
    ag -B 1 -A 3 'indika' $TARGET_FILE.log
    ag -B 1 -A 3 'FAIL' $TARGET_FILE.log
    ag -B 1 -A 3 'passed' $TARGET_FILE.log

    printf "TESTING: %s" % $TARGET_FILE
}

function test_facebook_failing()
{
    printf "Facebook is being AUPed\n"
    aup -r lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/facebook

    TARGET_FILE=test_chunks.py
    TARGET_FILE=test_comment_send.py

    printf "TESTING: %s" % $TARGET_FILE

    rununittest lego -n -t '-xvs' $TARGET_FILE 2>&1 | tee $TARGET_FILE.log
    ag -B 1 -A 3 'indika' $TARGET_FILE.log
    ag -B 1 -A 3 'FAIL' $TARGET_FILE.log
    ag -B 1 -A 3 'passed' $TARGET_FILE.log

    printf "TESTING: %s" % $TARGET_FILE
}




function twitter()
{
    printf "Twitter\n"
    cd $CURRENT_PROJECT/nbwebscan/src/nbwebscan/twitter/test
}


function test_flux()
{
    printf "All files are being AUPed\n"
    aup -r lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan

    TARGET_FILE=test_create_group.py

    printf "TESTING: %s" % $TARGET_FILE

    rununittest lego -n -t '-xvs' $TARGET_FILE 2>&1 | tee $TARGET_FILE.log
    # cat $TARGET_FILE.log | ag 'indika'
    ag -B 1 -A 3 'indika' $TARGET_FILE.log
    ag -B 1 -A 3 'FAIL' $TARGET_FILE.log
    ag -B 1 -A 3 'passed' $TARGET_FILE.log
}


function test_yahoo()
{
    printf "All files are being AUPed\n"
    aup -r lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan
    # TARGET_FILE=test_group_read_all_discussions.py
    # TARGET_FILE=test_group_read_discussion.py

    # Having trouble testing the spoofed case
    # TARGET_FILE=test_read_message.py
    TARGET_FILE=test_send_message.py

    # This test has always failed
    # TARGET_FILE=test_messages_read_message.py


    printf "TESTING: %s" % $TARGET_FILE

    rununittest lego -n -t '-xvs' $TARGET_FILE 2>&1 | tee $TARGET_FILE.log
    # cat $TARGET_FILE.log | ag 'indika'
    ag -B 1 -A 3 'indika' $TARGET_FILE.log
    ag -B 1 -A 3 'FAIL' $TARGET_FILE.log
    ag -B 1 -A 3 'passed' $TARGET_FILE.log
    # cat test_create_group.py.log | ag 'indika'

    printf "TESTING: %s" % $TARGET_FILE
}


function test_all_linkedin()
{
    $CURRENT_PROJECT/nbwebscan/src/nbwebscan/linkedin/test
    rmlog

    printf "HG differential (src/nbwebscan/)  AUPed to LEGO\n"
    hg baup lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/


    for f in $CURRENT_PROJECT/nbwebscan/src/nbwebscan/linkedin/test/test_*.py
    do
        filename="${filename%.*}"
        echo $filename
        rununittest lego -n -t '-xvs --report=skipped' $f 2>&1 | tee $f.log

    if [[ "$f" != *\.* ]]
    then
        echo "not a file"
    fi

    done

    ag -B 1 -A 3 'indika' *.log
    ag -B 1 -A 3 'FAIL' *.log
    ag -B 1 -A 3 'failed' *.log
    ag -B 1 -A 3 'passed' *.log
}

function query_all_linkedin()
{

    for f in $CURRENT_PROJECT/nbwebscan/src/nbwebscan/linkedin/test/data/icap/icap*respmod*.request
    do
        # filename="${filename%.*}"
        # echo $filename
        echo $f
        showicap --bare $f | htmlselect - "li.feed-item.linkedin-comment"

    if [[ "$f" != *\.* ]]
    then
        echo "not a file"
    fi

    done

}


function test_linkedin_messages()
{
    printf "HG differential (src/nbwebscan/)  AUPed to LEGO\n"
    hg baup lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/


    for f in $CURRENT_PROJECT/nbwebscan/src/nbwebscan/linkedin/test/test_messages*.py
    do
        filename="${filename%.*}"
        echo $filename
        rununittest lego -n -t '-xvs --report=skipped' $f 2>&1 | tee $f.log

    if [[ "$f" != *\.* ]]
    then
        echo "not a file"
    fi

    done

    ag -B 1 -A 3 'indika' *.log
    ag -B 1 -A 3 'FAIL' *.log
    ag -B 1 -A 3 'failed' *.log
    ag -B 1 -A 3 'passed' *.log
}


function test_linkedin_groups()
{
    printf "HG differential (src/nbwebscan/)  AUPed to LEGO\n"
    hg baup lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/


    for f in $CURRENT_PROJECT/nbwebscan/src/nbwebscan/linkedin/test/test_group*.py
    do
        filename="${filename%.*}"
        echo $filename
        rununittest lego -n -t '-xvs --report=skipped' $f 2>&1 | tee $f.log

    if [[ "$f" != *\.* ]]
    then
        echo "not a file"
    fi

    done

    ag -B 1 -A 3 'indika' *.log
    ag -B 1 -A 3 'FAIL' *.log
    ag -B 1 -A 3 'failed' *.log
    ag -B 1 -A 3 'passed' *.log
}


function test_all_twitter()
{
    printf "HG differential (src/nbwebscan/)  AUPed to LEGO\n"
    hg baup lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/


    for f in $CURRENT_PROJECT/nbwebscan/src/nbwebscan/twitter/test/test_*.py
    do
        filename="${filename%.*}"
        echo $filename
        rununittest lego -n -t '-xvs --report=skipped' $f 2>&1 | tee $f.log

    if [[ "$f" != *\.* ]]
    then
        echo "not a file"
    fi

    done

    ag -B 1 -A 3 'indika' *.log
    ag -B 1 -A 3 'FAIL' *.log
    ag -B 1 -A 3 'failed' *.log
    ag -B 1 -A 3 'passed' *.log
}

function test_twitter_messages()
{
    test_on_lego test_direct_messages_json.py
    test_on_lego test_sent_direct_message.py

    #TODO: The session viewer needs to be set
    #test_on_lego test_toasts.py
    test_on_lego test_groups.py
}


function update_tools_lego()
{
    # Need dev tools

    # Lego Dev
    sc /Users/indika/dev/box/docs/box.lego.bash_rc.txt lego:.bashrc
    ss lego 'mkdir /tmp/debug_cache'

    aup -r lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/helper

    aup -r lego $CURRENT_PROJECT/nbarchive/src/nbarchive/test

    aup -r lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/test
    aup lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/conftest.py
    aup -r lego /Users/indika/dev/box/netbox/nb-test/py.test  -v
}


function update_tools()
{
    update_tools_lego

    scp /Users/indika/dev/box/docs/box.lyncwinsvr.bash_rc.txt Administrator@winsvr:.bashrc
    scp /Users/indika/dev/box/docs/box.lyncadmin.bash_rc.txt Administrator@lyncadmin:.bashrc


    sc /Users/indika/dev/box/docs/box.blue.bash_rc.txt ipiyasena@blue.nb:.bashrc

    # cd /Users/indika/dev/
    # ss lego 'rm /home/httpd/netbox/noauth/deploy.tar'
    # sc /Users/indika/dev/box/docs/box.win.bash_rc.txt lego:/home/httpd/netbox/noauth


    # rm -rf /Users/indika/dev/deploy/mslync
    # cp -R /Users/indika/dev/box/netbox/mslync/src/mslync /Users/indika/dev/deploy/

    # cp -R /Users/indika/dev/box/netbox/winripclient/src/winripclient /Users/indika/dev/deploy
    # cp -R /Users/indika/dev/box/netbox/winrip/src/winrip /Users/indika/dev/deploy

    # tar cfz - "deploy" | ss lego 'cat > /home/httpd/netbox/noauth/deploy.tar'

    # cd ~/dev/box/netbox
}

function motor_post_init()
{
    sc /Users/indika/dev/box/docs/box.motor.bash_rc.txt motor:.bashrc
}

function shan_post_init()
{
    scp /Users/indika/dev/box/docs/box.shan.bash_rc.txt root@shan:.bashrc
}

function lyncadmin_post_init()
{
    scp /Users/indika/dev/box/docs/box.lyncadmin.bash_rc.txt Administrator@10.12.101.11:.bashrc
    scp /Users/indika/dev/box/docs/box.win.bash_rc.txt Administrator@10.12.101.11:/cygdrive/c/Users/administrator.NBBDEV2008/.bashrc
}


function lync_winsvr_post_init()
{
    scp /Users/indika/dev/box/docs/box.lyncwinsvr.bash_rc.txt Administrator@winsvr:.bashrc
    # scp /Users/indika/dev/box/docs/box.win.bash_rc.txt Administrator@winsvr:/cygdrive/c/Users/administrator.NBBDEV2008/.bashrc
}


function update_lego()
{
    printf "A differential update of Lego with Current Project $CURRENT_PROJECT\n"
    hg baup lego $CURRENT_PROJECT

    # printf "-> Flushing Redis Cache\n"
    # ss lego 'redis-cli -n 1 flushdb'

    # ss lego 'supervisorctl restart safechat:safechat-icap'
    ss lego 'systemctl restart safechat_icap.service'
}

function update_motor()
{
    printf "A differential update of Motor with Current Project $CURRENT_PROJECT\n"
    hg baup motor $CURRENT_PROJECT

    # printf "-> Flushing Redis Cache\n"
    # ss motor 'redis-cli -n 1 flushdb'

    ss motor 'systemctl daemon-reload'
    ss motor 'systemctl restart safechat_icap.service'
}

function update_netbox_lego()
{
    printf "A differential update of Lego with the Netbox\n"
    hg baup lego /Users/indika/dev/box/netbox
}


function update_reports()
{
    # printf "A differential update of Lego with Reports \n"
    # # hg baup lego /Users/indika/dev/box/netbox/nbreports

    # aup lego /Users/indika/dev/box/netbox/nbreports/src/core/feed -v
    # aup lego /Users/indika/dev/box/netbox/nbreports/src/core/db_test.py -v
    # # aup lego /Users/indika/dev/box/netbox/nbreports/src/core/progress.py -v

    # # ss lego 'cat /usr/libexec/nbreports/feed | grep indika'
    # # ss lego 'python /usr/libexec/nbreports/feed'
    # ss lego 'python /usr/libexec/nbreports/db_test.py'

    # print "\n\n\n\n"


    # UPDATE THE PSYCO MODULE
    # cd /Users/indika/temp
    # sc ipiyasena@build7.nb:/var/spool/build/user/ipiyasena/RPMS/x86_64/python-psycopg2-2.4.5-8nb.el7.centos.x86_64.rpm .
    # sc python-psycopg2-2.4.5-8nb.el7.centos.x86_64.rpm motor:
    # ss motor 'rpm -Uvh --force python-psycopg2-2.4.5-8nb.el7.centos.x86_64.rpm'
    # ss motor 'ls -l /usr/lib64/python2.7/site-packages/psycopg2/_psycopg.so'


    aup motor /Users/indika/dev/box/netbox/nbreports/src/core/feed -v
    aup motor /Users/indika/dev/box/netbox/nbreports/src/core/db_test.py -v
    aup motor /Users/indika/dev/box/netbox/nbreports/src/core/progress.py -v
    # ss motor 'cat /usr/libexec/nbreports/feed | grep indika'
    ss motor 'python /usr/libexec/nbreports/feed'
    # ss motor 'python /usr/libexec/nbreports/db_test.py'

    ss motor 'systemctl restart nbreports.service'
    ss motor 'systemctl | grep failed'
    # ss motor 'journalctl -u nbreports.service'
}



fuction test_postgrey()
{
    aup motor /Users/indika/dev/box/netbox/nbpostfix/src/nbpostfix/postgrey.py -v
    ss motor 'systemctl restart postgreyd.service'
}





function update_ytcache()
{
    printf "A differential update of Lego with YTCACHE \n"
    hg baup lego /Users/indika/dev/box/netbox/ytcache

    # printf "-> Flushing Redis Cache\n"
    # ss lego 'redis-cli -n 1 flushdb'

    ss lego 'supervisorctl restart ytcache'
    ss lego 'supervisorctl restart ytcache-icap'
    # ss lego 'less /var/log/ytcache/access'
}


function social_update_lego()
{
    printf "A differential update of Lego with Current Project $CURRENT_PROJECT\n"
    hg baup lego $CURRENT_PROJECT

    # ss lego 'supervisorctl restart socialmediaapp'

    ss lego '/usr/libexec/socialmediaapp/fbdiagnostic'
}



function update_isix()
{
    printf "Updating ISIX Recursively from here\n"

    # aup cool-cloud-vm --restrict=cloud
    aup -r 10.4.10.194 --restrict=cloud --verbose
}

function fetch()
{
    sc lego:$1 /Users/indika/temp/lego_cache
    st /Users/indika/temp/lego_cache/$1
}

function fetch_icaps()
{
    #cat /var/log/safechat/icap | grep 'XI ICAP.*for URL.*https://twitter.com/i/discover'

    printf "Fetching ICAPs from Lego\n"
    rm -rf /Users/indika/temp/icaps
    mkdir /Users/indika/temp/icaps

    sc lego:/var/tmp/safechat/icap/\*.request   /Users/indika/temp/icaps/

    # Now parse them
    # /Users/indika/.virtualenvs/safechat/bin/python /Users/indika/dev/box/helper/icap_inspector/data/icaps/icap_plain_text.py --dir /Users/indika/temp/icaps

    for f in /Users/indika/temp/icaps/*.request
    do
        filename="${f}.txt"
        echo $filename
        # rununittest lego -n -t '-xvs --report=skipped' $f 2>&1 | tee $f.log
        showicap --pretty $f > $filename

    if [[ "$f" != *\.* ]]
    then
        echo "not a file"
    fi

    done
}

function fetch_bundles()
{
    printf "Re-Fetching Bundles from ISIX\n"
    sc -r 10.107.11.228:/var/nbwebscan/bundles /Users/indika/temp/bundles
}

function fetch_cache()
{
    printf "Re-Fetching Debug cache from Lego\n"
    cd ~
    rm -rf /Users/indika/temp/debug_cache
    sc -r lego:/tmp/debug_cache /Users/indika/temp/debug_cache
    cd ~/temp/debug_cache
    fdupes -dN ~/temp/debug_cache
}

function clear_cache()
{
    printf "Clearing Debug cache on Lego\n"
    ss lego 'rm -rf /tmp/debug_cache/*'
    ss lego 'mkdir -p /tmp/debug_cache'

}

function sync_cobalt()
{
    printf "Syncing repositories in Cobalt\n"

    printf "Syncing OH MY ZSH\n"
    cd /Users/indika/.oh-my-zsh
    git commit -m 'autocommit'
    git pull origin master
    git push origin master

    printf "Syncing Box Notes\n"
    cd /Users/indika/dev/box/docs
    git add *
    git commit -a -m 'autocommit'
    git pull cobalt master
    git push cobalt master

    printf "Syncing OH MY ZSH\n"
    cd /Users/indika/.oh-my-zsh
    git commit -a -m 'autocommit'
    git pull hub master
    git push hub master

    printf "Syncing Boxen\n"
    cd /opt/boxen/my-boxen
    git commit -a -m 'autocommit'
    git pull origin master
    git push origin master

    printf "Syncing Sublime\n"
    cd $CONFIG_SUBLIME
    git commit -a -m 'autocommit'
    git pull origin master
    git push origin master

    printf "tweaking\n"
    cd '/Users/indika/Library/Application Support/Sublime Text 3/Packages/SublimePushBullet'
    git commit -a -m 'autocommit'
    git pull origin master
    git push origin master
}



# activate
# source $VIRTUALENV_ROOT/dev/bin/activate

# PYENV Stuff
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv shell netbox

