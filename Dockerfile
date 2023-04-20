FROM python:3.9

# Install Linux Package
RUN apt update && apt install openssh-server git sudo -y

# Install poetry
RUN pip3 install poetry

# Create a user “sshuser”
RUN useradd -ms /bin/bash sshuser
RUN adduser sshuser sudo
ARG SSH_USER_PASSWD
RUN echo "sshuser:${SSH_USER_PASSWD}" | chpasswd
RUN mkdir -p /home/sshuser/.ssh

# Set ssh service config
COPY authorized_keys /home/sshuser/.ssh/authorized_keys
RUN chown sshuser /home/sshuser/.ssh/authorized_keys && chmod 600 /home/sshuser/.ssh/authorized_keys
RUN echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
RUN echo "PermitRootLogin no" >> /etc/ssh/sshd_config

# Start SSH service
RUN service ssh start

# Expose docker port 22
EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]