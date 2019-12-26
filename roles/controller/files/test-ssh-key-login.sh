#!/bin/sh

host=$1
keyfile=$2

ssh -i "$keyfile" -o "IdentitiesOnly yes" -o "PreferredAuthentications publickey" -o "ControlMaster no" "$host" exit 2>/dev/null
if [ "$?" = "0" ]; then
    echo "yes"
else
    echo "no"
fi

exit 0