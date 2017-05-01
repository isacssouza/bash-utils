function findaws() {
    pattern=$1

    command="aws ec2 describe-instances --filters 'Name=tag:Name,Values=*${pattern}*' | jq '.Reservations[].Instances[] | (.Tags[] | select(.Key == \"Name\") | {name: .Value}) + {dns: .PublicDnsName, state: .State.Name}'"
    echo ${command}

    eval ${command}
}
