#!/bin/bash

# Start the SSH server
service ssh start

# Configure and start tigervnc with a password and on port 5900
echo changeme | vncpasswd -f > /root/.vnc/passwd
chmod 600 /root/.vnc/passwd

vncserver -fg -depth 24 -geometry 1920x1080 -localhost no :0

# Keep the script running
while true; do
    sleep 3600
done