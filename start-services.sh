#!/bin/bash

# Start the SSH server
service ssh start

# Set the desired resolution with Xvfb
Xvfb :1 -screen 0 1920x1080x24 &

# Start XFCE desktop environment
export DISPLAY=:1
startxfce4 &

# Start x11vnc to allow VNC access (optional, adjust as needed)
x11vnc -display :1 -N -forever &

# Keep the script running
while true; do
    sleep 3600
done
