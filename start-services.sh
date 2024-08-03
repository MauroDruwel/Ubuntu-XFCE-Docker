#!/bin/bash

# Start SSH service
service ssh start

# Start XRDP service
service xrdp start

# Keep the container running
tail -f /dev/null
