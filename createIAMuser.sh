# 1. Creates an IAM user account in AWS
# 2. Randomly generates a password for the account using apg
# 3. Adds the user to the Administrators group
# 4. Creates a login profile for the user (set password and set flag to force user to reset password upon initial logon)

#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <username>"
    exit 1
fi

USERNAME=$1

#Generate random password
PASSWD=$(apg -n 1 -m 12 -x 12 -M SNCL -c cl_seed -a 1)

aws iam create-user --user-name $USERNAME
aws iam add-user-to-group --group-name Administrators --user-name $USERNAME
aws iam create-login-profile --user-name $USERNAME --password $PASSWD --password-reset-required

echo Password: $PASSWD
