#!/bin/bash
source login.creds

if [ "$(ss -trp | grep ESTAB | grep "$JUMP_BOX:ssh" | wc -l)" -eq 0 ]; then
    echo "ssh tunnel disconnected, attempting to reconnect"
    ssh -f -N -T -R2222:localhost:22 $JUMP_BOX_USER@$JUMP_BOX
else
    echo "SSH tunnel is connected. No action taken"
fi
