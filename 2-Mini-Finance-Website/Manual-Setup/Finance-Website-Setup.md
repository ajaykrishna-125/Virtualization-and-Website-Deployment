# Setup Guide: Deploying the Mini Finance HTML Template with HTTPD Service on CentOS using Vagrant

## Step 1: Set Up the Vagrant Environment

### Create a Folder for the VM
1. Open your terminal or command prompt.
2. Create a folder for the Vagrant project:
   ```bash
   mkdir finance
   cd finance
   ```

### Initialize Vagrant with the CentOS Box
3. Initialize Vagrant with the `eurolinux-vagrant/centos-stream-9` box:
   ```bash
   vagrant init eurolinux-vagrant/centos-stream-9
   ```

### Edit the Vagrantfile
4. Open the `Vagrantfile` in a text editor (e.g., Notepad, Vim, VS Code).
5. Add the following configuration:
   ```ruby
   Vagrant.configure("2") do |config|
     config.vm.box = "eurolinux-vagrant/centos-stream-9"
     config.vm.network "private_network", ip: "192.168.56.22"
     config.vm.hostname = "finance"
   end
   ```
6. Save and close the file.

### Start the VM
7. Bring up the VM:
   ```bash
   vagrant up
   ```

### Log into the VM
8. SSH into the VM:
   ```bash
   vagrant ssh
   ```

---

## Step 2: Set Up HTTPD Service

### Switch to Root User (Optional)
```bash
sudo su
```

### Install Dependencies
```bash
yum install httpd wget vim unzip zip -y
```

### Start and Enable HTTPD Service
```bash
systemctl start httpd
systemctl enable httpd
```

### Verify HTTPD Service
```bash
systemctl status httpd
```
(Press `q` to exit the status view)

---

## Step 3: Deploy the HTML Template

### Download the Template
```bash
cd /tmp
wget https://www.tooplate.com/zip-templates/2135_mini_finance.zip
```

### Unzip the Template
```bash
unzip 2135_mini_finance.zip
```

### Copy Files to Web Directory
```bash
cp -r 2135_mini_finance/* /var/www/html/
ls /var/www/html/
```

### Restart HTTPD Service
```bash
systemctl restart httpd
```

---

## Step 4: Validate the Setup

### Check Firewall Status
```bash
systemctl status firewalld
```
If active, stop and disable it for testing:
```bash
systemctl stop firewalld
systemctl disable firewalld
```

### Verify IP Address
```bash
ip addr show
```
Ensure the IP `192.168.56.22` is listed.

### Access the Website
Open a browser and go to:
```
http://192.168.56.22
```

---

## Step 5: Cleanup (Optional)

### Exit the VM
```bash
exit
```

### Power Off or Destroy the VM
To power off:
```bash
vagrant halt
```
To destroy the VM completely:
```bash
vagrant destroy
```
