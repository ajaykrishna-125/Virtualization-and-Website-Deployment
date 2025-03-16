# Setup Guide for HTTPD Service on CentOS using Vagrant Provisioning

## Overview

This guide provides steps to automatically set up an HTTPD web server on a CentOS virtual machine using Vagrant. The provisioning script in the `Vagrantfile` eliminates manual setup by installing and configuring the required components automatically.

## Prerequisites

Ensure you have the following installed on your host machine:

- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant](https://www.vagrantup.com/)

## Step 1: Set Up the Vagrant Environment

1. Create a folder for the Vagrant project:

   ```bash
   mkdir finance
   cd finance
   ```

2. Create a `Vagrantfile` and add the following configuration:

   ```ruby
   Vagrant.configure("2") do |config|
       config.vm.box = "eurolinux-vagrant/centos-stream-9"
       config.vm.network "private_network", ip: "192.168.56.28"
       config.vm.network "public_network"
       config.vm.provider "virtualbox" do |vb|
           vb.memory = "1024"
       end
       config.vm.provision "shell", inline: <<-SHELL
           yum install httpd wget unzip vim -y
           systemctl start httpd
           systemctl enable httpd
           mkdir -p /tmp/finance
           cd /tmp/finance
           wget https://www.tooplate.com/zip-templates/2135_mini_finance.zip
           unzip -o 2135_mini_finance.zip
           cp -r 2135_mini_finance/* /var/www/html/
           systemctl restart httpd
           cd /tmp/
           rm -rf /tmp/finance
       SHELL
   end
   ```

## Step 2: Start the Virtual Machine

1. Run the following command to start and provision the VM:

   ```bash
   vagrant up
   ```

   This command will:
   - Create and start the CentOS VM.
   - Install HTTPD and necessary tools.
   - Download and deploy the HTML template automatically.

2. Verify that the provisioning was successful:

   ```bash
   vagrant ssh -c "systemctl status httpd"
   ```

   The service should be active and running.

## Step 3: Access the Web Server

1. Open a web browser on your host machine.
2. Navigate to `http://192.168.56.28`.
3. You should see the deployed HTML template.

## Step 4: Cleanup (Optional)

- To stop the VM:

  ```bash
  vagrant halt
  ```

- To remove the VM completely:

  ```bash
  vagrant destroy
  ```

## Conclusion

This automated setup using Vagrant's provisioning feature simplifies the deployment process and removes the need for manual intervention.
