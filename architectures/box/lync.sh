

function msi_test()
{
    cd /Users/indika/dev/box/netbox/winripclient/src/winripclient/tests
    aup BloomDev@winsystest systest_msi_tmp.py -v
    aup BloomDev@winsystest fetch_rpms.py -v
    # ssh winsystest '/cygdrive/c/Python27/python.exe $(cygpath --windows "/usr/lib/python2.7/site-packages/winripclient/tests/systest_msi_tmp.py")'
    # ssh winsystest 'python /usr/lib/python2.7/site-packages/winripclient/tests/fetch_rpms.py --uninstall mslync'
    # ssh winsystest 'python /usr/lib/python2.7/site-packages/winripclient/tests/fetch_rpms.py -x'
    ssh winsystest 'python /usr/lib/python2.7/site-packages/winripclient/tests/fetch_rpms.py -i mslync'
}

function msi_test_remove()
{
    cd /Users/indika/dev/box/netbox/winripclient/src/winripclient/tests
    aup BloomDev@winsystest systest_msi_tmp.py -v
    aup BloomDev@winsystest fetch_rpms.py -v
    ssh winsystest 'python /usr/lib/python2.7/site-packages/winripclient/tests/fetch_rpms.py -x'
}


function full_test()
{
    revert_vm winsystest 3
    sleep 45s

    cd /Users/indika/dev/tower/sites/winsystest
    ap winsystest.yml
    msi_test
}


function lync_update_beast()
{
    cd /Users/indika/dev/box/netbox/mslync
    aup -r --no-restrict --platform winrip Administrator@beast . -v

    cd /Users/indika/dev/box/netbox/mslyncchat
    aup -r --no-restrict --platform winrip Administrator@beast . -v

    cd /Users/indika/dev/box/netbox/nblog/src/nblog
    aup -r --no-restrict Administrator@beast . -v

    cd /Users/indika/dev/box/netbox/nbshared/src/nbshared
    aup -r --no-restrict --platform netbox Administrator@beast . -v

    cd /Users/indika/dev/box/netbox/winrip/src/winrip
    aup -r --no-restrict --platform netbox Administrator@beast . -v

    cd /Users/indika/dev/box/netbox/winripclient/src/winripclient
    aup -r --no-restrict Administrator@beast . -v
}


function lync_update_lite()
{
    cd /Users/indika/dev/box/netbox/mslync
    aup -r --no-restrict --platform winrip Administrator@beast . -v

    cd /Users/indika/dev/box/netbox/mslyncchat
    aup -r --no-restrict --platform winrip Administrator@beast . -v
}

function lync_client_ui_update()
{
    cd /Users/indika/dev/box/netbox/mslync
    aup --no-restrict --platform winrip Administrator@winsvr /Users/indika/dev/box/netbox/mslync/src/mslync/entrypoint.py -v
}


function lync_test_model()
{
    aup --no-restrict --platform winrip Administrator@winsvr /Users/indika/dev/box/netbox/mslync/src/mslync/entrypoint.py /Users/indika/dev/box/netbox/mslync/src/mslync/models.py /Users/indika/dev/box/netbox/mslync/src/mslync/test/test_mslync.py -v
    ss Administrator@winsvr 'cd /usr/lib/python2.7/site-packages/mslync/test; /cygdrive/c/dev/python276-32/Scripts/py.test -xvs .' 2>&1 | tee mslync_test.log

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
