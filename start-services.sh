#!/bin/bash

# Start SSH service
service ssh start

# Start XRDP service
service xrdp start

# Start the XFCE session
startxfce4 &

# Wait for a few seconds to ensure XFCE has started
sleep 5

# Start Thunar file manager
thunar &

# Keep the container running
tail -f /dev/null