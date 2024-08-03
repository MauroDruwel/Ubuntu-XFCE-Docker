# Use the official Ubuntu base image
FROM ubuntu:22.04

# Set environment variable to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Set root password
RUN echo "root:changeme" | chpasswd

# Update and upgrade the system
RUN apt update && apt upgrade -y

# Install XFCE, XFCE Goodies, XRDP, and OpenSSH server
RUN apt install -y xfce4 xfce4-goodies xrdp openssh-server

# Configure XRDP to use XFCE session
RUN echo "xfce4-session" > /root/.xsession

# Configure XRDP to use a fixed screen resolution
RUN echo "geometry=1920x1080" >> /etc/xrdp/xrdp.ini

# Expose the XRDP and SSH ports
EXPOSE 3389 22

# Start the services
CMD ["/bin/bash", "-c", "service ssh start && /etc/xrdp/startwm.sh && service xrdp restart && tail -f /dev/null"]
