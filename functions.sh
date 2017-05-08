function color() {
	grep -E "^|$1";
}

function findaws() {
    pattern=$1

    command="aws ec2 describe-instances --filters 'Name=tag:Name,Values=*${pattern}*' | jq '.Reservations[].Instances[] | (.Tags[] | select(.Key == \"Name\") | {name: .Value}) + {id: .InstanceId, dns: .PublicDnsName, publicIp: .PublicIpAddress, privateIp: .PrivateIpAddress, state: .State.Name}'"
    echo ${command}

    eval ${command}
}
