# Use the official Ubuntu base image
FROM ubuntu:22.04

# Set environment variable to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Set root password
RUN echo "root:changeme" | chpasswd

# Update and upgrade the system
RUN apt update && apt upgrade -y

# Install XFCE, XFCE Goodies, and XRDP
RUN apt install -y xfce4 xfce4-goodies xrdp

# Configure XRDP to use XFCE session
RUN echo "xfce4-session" > /root/.xsession

# Expose the XRDP port
EXPOSE 3389

# Start the services
CMD ["/bin/bash", "-c", "service xrdp restart && tail -f /dev/null"]
