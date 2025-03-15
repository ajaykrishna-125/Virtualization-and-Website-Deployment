# Setting Up a CentOS Virtual Machine Using Vagrant

This guide outlines the step-by-step process for creating and running a CentOS virtual machine (VM) using Vagrant. Follow these clear and concise steps to get your VM up and running!

## Prerequisites

- **Operating System:** Windows, macOS, or Linux
- **Tools Required:**
  - VirtualBox (hypervisor)
  - Vagrant (VM management tool)
  - Git Bash (for Windows users) or Terminal (for macOS/Linux users)
- **Network Requirements:** Stable internet connection

Ensure Virtualization is enabled in your BIOS settings.

## Step 1: Install Required Tools

1. **Download and Install VirtualBox:**
   - [VirtualBox Downloads](https://www.virtualbox.org/wiki/Downloads)
2. **Download and Install Vagrant:**
   - [Vagrant Downloads](https://developer.hashicorp.com/vagrant/downloads)
3. **Verify Installation:**
   - Open a terminal and run:
     ```bash
     vagrant --version
     VBoxManage --version
     ```

## Step 2: Set Up Your Project Directory

1. **Create a Folder for Your VM:**
   ```bash
   mkdir ~/vagrant-vms/centos
   cd ~/vagrant-vms/centos
   ```
2. **Initialize Vagrant:**
   ```bash
   vagrant init centos/stream9
   ```
   - This command creates a `Vagrantfile` and specifies the CentOS Stream 9 box.

## Step 3: Configure the Vagrantfile

1. **Select the CentOS Box:**
   - Vagrant will use a pre-built CentOS image (called a "box") from Vagrant Cloud.
2. **Set Network and Resources (Optional):**
   - Use a bridged adapter for networking:
     ```ruby
     config.vm.network "public_network"
     ```
   - Allocate resources (RAM, CPUs):
     ```ruby
     config.vm.provider "virtualbox" do |vb|
       vb.memory = "2048"
       vb.cpus = 2
     end
     ```

## Step 4: Launch the VM

1. **Start the VM:**
   ```bash
   vagrant up
   ```
   - Vagrant will download the CentOS box (if not already downloaded) and create the VM.
2. **Check VM Status:**
   ```bash
   vagrant status
   ```

## Step 5: Access the VM

1. **SSH into the VM:**
   ```bash
   vagrant ssh
   ```
   - You’ll be logged into the CentOS VM as the `vagrant` user.
2. **Verify Network Settings:**
   ```bash
   ip addr show
   ```
   - Check the IP address assigned to your VM.

## Step 6: Manage the VM

- **Power Off the VM:**
  ```bash
  vagrant halt
  ```
- **Restart the VM:**
  ```bash
  vagrant reload
  ```
- **Destroy the VM:** (Caution: Deletes all data)
  ```bash
  vagrant destroy
  ```

## Step 7: Sync Files (Optional)

- **Sync a Host Folder to the VM:**
  ```ruby
  config.vm.synced_folder "./host-folder", "/home/vagrant/guest-folder"
  ```
  - Run `vagrant reload` to apply the changes.

## Step 8: Automate Setup with Provisioning (Optional)

- **Run Scripts on VM Creation:**
  ```ruby
  config.vm.provision "shell", inline: <<-SHELL
    sudo yum update -y
    sudo yum install -y httpd
  SHELL
  ```
  - This installs Apache automatically when the VM starts.

## Summary

With these steps, we can quickly create, configure, and manage a CentOS VM using Vagrant. 
