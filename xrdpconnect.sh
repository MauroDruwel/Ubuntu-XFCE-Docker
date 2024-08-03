#!/bin/bash

# Replace with your xrdp server IP, username, password, and domain if necessary
SERVER="localhost"
USERNAME="root"
PASSWORD="changeme"

# Connect to the xrdp session with 1920x1080 resolution
xfreerdp /v:$SERVER /u:$USERNAME /p:$PASSWORD /size:1920x1080 /cert-ignore &

# Get the process ID of the xfreerdp session
FREERDP_PID=$!

# Wait for 5 seconds
sleep 5

# Disconnect the xrdp session
kill $FREERDP_PID
