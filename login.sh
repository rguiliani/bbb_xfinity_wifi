#!/bin/bash

function do_xf_login() {

    echo "Download start page..."
    CURL_CMD="curl -vs -c wificook -L stuntedrunt.com"
    HTML=$(curl -vs -c wificook -L stuntedrunt.com)
    echo "Done"
    
    HASH=$(echo $HTML | hxnormalize -x | hxselect 'input[name="hash"]' | sed -n -e "s/^.*value=['\"]\(.*\)['\"].*/\1/p")
    echo "Hash: $HASH"
    
    source login.creds
    
    set -x
    curl -v -b wificook -L -X POST -H "application/x-www-form-urlencoded; charset=UTF-8" -F method=authenticate -F username="$USERNAME" -F password="$PASSWORD" -F friendlyname="$DEVICE_NAME" -F hash="$HASH" -F javascript=true https://wifilogin.xfinity.com/user_login.php 
    set +x

}

echo -n "Checking for login..."
CHECK_HTML=$(curl -sv stuntedrunt.com 2>&1)

if [ "$(echo "$CHECK_HTML" | grep -i 'wifilogin' | wc -l)" -ne 0 ]; then
    echo "Failed. Logging in..."
    do_xf_login "$CHECK_HTML"
else
    echo "Success"
fi

