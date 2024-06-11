# Use the latest version of Ubuntu
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y openssh-server sudo systemd systemd-sysv nano nmap iputils-ping

# Check if user 'ubuntu' exists, if not create it and add it to 'sudo' group
RUN id -u ubuntu &>/dev/null || useradd -m ubuntu && echo "ubuntu:ubuntu" | chpasswd && adduser ubuntu sudo

# Set up SSH
RUN mkdir -p /var/run/sshd
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
RUN echo 'AllowTcpForwarding yes' >> /etc/ssh/sshd_config
RUN echo 'X11Forwarding yes' >> /etc/ssh/sshd_config
RUN echo 'ubuntu ALL=NOPASSWD: ALL' >> /etc/sudoers

# Add aliases to ~/.bashrc
RUN echo 'alias ..="cd .."' >> /home/ubuntu/.bashrc
RUN echo 'alias ...="cd ../.."' >> /home/ubuntu/.bashrc
RUN echo 'alias c="clear"' >> /home/ubuntu/.bashrc
RUN echo 'alias lsa="ls -alh"' >> /home/ubuntu/.bashrc

# Expose port 22 for SSH access
EXPOSE 22

# Start SSH server
CMD ["/usr/sbin/sshd", "-D"]
