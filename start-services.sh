#!/bin/bash

# Start the SSH server
service ssh start

# Start the XFCE desktop environment
export DISPLAY=:1
startxfce4 &

# Set up VNC server
vncserver :1 -geometry 1920x1080 -depth 24
vncpasswd -f <<< "changeme" > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd

# Start the VNC server
vncserver :1 -geometry 1920x1080 -depth 24 -rfbport 5901

# Keep the script running
while true; do
    sleep 3600
done
