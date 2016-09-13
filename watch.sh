#!/bin/bash

cd "`dirname "$0"`"

function check_wifi_is_up() {
    IFACE=wlan0

    echo "Checking if WIFI is up"
    #wlan0     IEEE 802.11bgn  ESSID:"xfinitywifi"  Nickname:"<WIFI@REALTEK>"
    if [ "$(iwconfig | grep $IFACE | grep "xfinitywifi" | wc -l)" -eq 0 ]; then
        echo "WIFI is disconneced... attempting to bring up"
        echo $(bash ./setup.sh 2>&1)
    else
        echo "WIFI is connected. No action taken"
    fi

}

echo "Starting watch loop..."
while :; do 
    date
    check_wifi_is_up
    echo $(bash login.sh 2>&1)
    echo $(bash tunnel.sh 2>&1)
    sleep 60
done
