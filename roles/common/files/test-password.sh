#!/bin/sh

# Test if the username and password are correct by comparing
# with the value stored in /etc/shadow.

user=$1
pass=$2

pattern_prefix="s/^${user}"
salt_pattern_suffix='\:\$[^$]+\$([^$]+).+$/\1/p'
hash_pattern_suffix='\:(\$[^$]+\$[^:]+).+$/\1/p'

salt_pattern="${pattern_prefix}${salt_pattern_suffix}"
hash_pattern="${pattern_prefix}${hash_pattern_suffix}"

salt=$(sed -E -n $salt_pattern /etc/shadow)
current_hash=$(sed -E -n $hash_pattern /etc/shadow)

if [ -z "$salt" ]
then
    >&2 echo "User $1 does not exist"
    exit 1
fi

new_hash=$(openssl passwd -salt $salt -1 $pass)

if [ "$current_hash" = "$new_hash" ]
then
    echo "match"
else
    echo "no match"
fi

exit 0