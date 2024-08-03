# Use the official Ubuntu base image
FROM ubuntu:22.04

# Set environment variable to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Set root password
RUN echo "root:changeme" | chpasswd

# Update and upgrade the system
RUN apt update && apt upgrade -y

# Install XFCE, XFCE Goodies, OpenSSH server, and additional packages
RUN apt install -y xfce4 xfce4-goodies openssh-server xvfb x11vnc x11-utils

# Configure the SSH server to allow root login
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Expose the SSH port
EXPOSE 22

# Copy and set the entrypoint script
COPY start-services.sh /usr/local/bin/start-services.sh
RUN chmod +x /usr/local/bin/start-services.sh

# Set the entrypoint
ENTRYPOINT ["/usr/local/bin/start-services.sh"]
