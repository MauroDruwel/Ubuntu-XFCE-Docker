#!/bin/bash

# Start SSH service
service ssh start

# Start XRDP service
service xrdp start

sleep 5
# Start the XFCE session
/usr/local/bin/xrdpconnect.sh

# Wait for a few seconds to ensure XFCE has started
sleep 5

# Start Thunar file manager
thunar &

# Keep the container running
tail -f /dev/null