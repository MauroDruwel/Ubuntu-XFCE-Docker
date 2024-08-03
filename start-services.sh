#!/bin/bash

# Start the SSH server
service ssh start

# Set the desired resolution with Xvfb
Xvfb :1 -screen 0 1920x1080x24 &

# Start XFCE desktop environment
export DISPLAY=:1
startxfce4 &

# Configure and start x11vnc with a password and on port 5900
# Create a password file for x11vnc
echo "changeme" | x11vnc -storepasswd -passwdfile /root/.vnc/passwd

# Start x11vnc with the specified password and port
x11vnc -display :1 -forever -rfbport 5900 -passwdfile /root/.vnc/passwd &

# Keep the script running
while true; do
    sleep 3600
done
