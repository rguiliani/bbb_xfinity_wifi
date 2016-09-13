#!/bin/bash

cd "`dirname "$0"`"

LOCATION_DATA=$(curl freegeoip.net/json/`curl -s ifcfg.me`) 

echo "$LOCATION_DATA" >> logs/location.log
