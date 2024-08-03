#!/bin/bash

# Start the SSH server
service ssh start

# Configure and start x11vnc with a password and on port 5900
echo changeme | vncpasswd -f > /root/.vnc/passwd
chmod 600 /root/.vnc/passwd

vncserver -fg -depth 24 -geometry 1920x1080 -localhost no :1
# Start x11vnc with the configured display and password
#x11vnc -display :1 -forever -passwdfile /root/.vnc/passwd -rfbport 5900 &

# Keep the script running
while true; do
    sleep 3600
done