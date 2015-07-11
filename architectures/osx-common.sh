# VI Mode timeout
export KEYTIMEOUT=1


function boxen_edit()
{
    st -n /opt/boxen
    cd /opt/boxen/my-boxen
}

function findr()
{
    find . | grep -i $1
}
