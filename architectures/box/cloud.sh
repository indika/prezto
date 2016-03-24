




function revert_icaps()
{
    revert_vm cloud-icaps 8
    sleep 45s
    ss icaps 'yum update -y'
    ss icaps 'reboot'
}


function revert_ccs()
{
    revert_vm cloud-ccs 9
    sleep 45s
    ss ccs 'yum update -y'
    ss ccs 'reboot'
}

function revert_cte()
{
    revert_vm cloud-cte 5
    sleep 45s
    ss cte 'yum update -y'
    ss cte 'reboot'
}


function revert_cloud()
{
    revert_icaps
    revert_ccs
    revert_cte
}
