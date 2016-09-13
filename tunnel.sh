#!/bin/bash

if [ "$(ss -trp | grep ESTAB | grep 'buildbox.bau5net.com:ssh' | wc -l)" -eq 0 ]; then
    echo "ssh tunnel disconnected, attempting to reconnect"
    ssh -f -N -T -R2222:localhost:22 rguiliani@buildbox.bau5net.com
else
    echo "SSH tunnel is connected. No action taken"
fi
