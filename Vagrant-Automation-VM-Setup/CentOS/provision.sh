#!/bin/bash
# Update system packages
sudo yum update -y

# Install essential utilities
sudo yum install -y vim wget curl net-tools

# Install Apache HTTP Server
sudo yum install -y httpd

# Enable and start Apache service
sudo systemctl enable httpd
sudo systemctl start httpd

# Ensure firewall allows HTTP traffic
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload

# Print completion message
echo "Provisioning complete. Apache is installed and running."
