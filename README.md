Written for beaglebone black w/ Debian Jessie to autologin to xfinitywifi

Dependencies:
  - supervisord
  - iwconfig
  - html-xml-utils
  - curl

1. Copy login.creds.dist to login.creds and fill with your infos

1. Install wifi_watch.conf in supervisor conf.d dir

Intent:
    This script is meant to autoconnect to xfinitywifi. It runs every 2 minutes,
    and ensures WIFI interface is connected, and address is recieved, and that
    we have access through the gateway.

WARNING: THIS IS SUSCEPTIBLE TO MITM ATTACKS AGAINST THE MAIN SSID

TODO: add VPN/Tor for SSH access

R. -- @guilianirossi
