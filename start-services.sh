#!/bin/bash

# Start the SSH server
service ssh start

# Set the desired resolution with Xvfb
Xvfb :1 -screen 0 1920x1080x24 &

# Start XFCE desktop environment
export DISPLAY=:1
startxfce4 &

# Configure and start x11vnc with a password and on port 5900
mkdir -p /root/.vnc
x11vnc -storepasswd changeme /root/.vnc/passwd
chmod 600 /root/.vnc/passwd
x11vnc -display :1 -forever -passwdfile /root/.vnc/passwd -rfbport 5900 &

# Keep the script running
while true; do
    sleep 3600
done
