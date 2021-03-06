#stop/start EC2 instances based on "Owner" tag

#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <Owner> <stop|start>"
    exit 1
fi

OWNER=$1

#retrieve instances based on "Owner" tag
INSTANCES=$(aws ec2 describe-tags --filters "Name=key,Values=Owner" "Name=value,Values=$OWNER" "Name=resource-type,Values=instance" --output text | awk '{print $3}')

#stop or start instances
case "$2" in
    stop)
        aws ec2 stop-instances --instance-ids $INSTANCES
        ;;
    start)
        aws ec2 start-instances --instance-ids $INSTANCES
        ;;
esac
