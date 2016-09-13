#!/bin/bash

INTERFACE=wlan0
WIFI_SSID="xfinitywifi"
set -x

echo -n "Setting $INTERFACE down..."
ip link set $INTERFACE down
sleep 2
echo "Done"

echo -n "Setting essid to xfinitywifi..."
while [ $(iwconfig $INTERFACE | grep $INTERFACE | grep "unassociated" | wc -l) -eq 1 ]; do
    iwconfig $INTERFACE essid $WIFI_SSID
    iwconfig wlan0
    sleep 3
done
echo "Done"

echo -n "Getting DHCP address for $INTERFACE..."
dhclient -i $INTERFACE
echo "Done"

set +x
