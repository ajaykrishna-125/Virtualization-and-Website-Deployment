# 1. Virtual Machine (VM) Creation

## Overview
This section covers setting up Virtual Machines (VMs) both **manually** and **automatically using Vagrant**. The VMs are used for learning Linux, hosting websites, and experimenting with cloud-like environments.

## Folder Structure
```

📁 1-VM-Creation
│   ├── README.md  (Explains virtualization, manual & automated setup)
│   ├── Manual-Setup
│   │   ├── VM-Setup-Steps.md  (Step-by-step manual VM setup)
│   │   ├── Screenshots  (VM creation screenshots)
│   ├── Automated-Setup
│   │   ├── Vagrantfile  (Vagrant configuration file)
│   │   ├── Screenshots  (Vagrant up execution, VM details)
|   |   ├── setup-guide.md  (Step-by-step automated VM setup)
```
---

## 1️⃣ Manual VM Creation (Using VirtualBox)
### Steps:
1. Install **Oracle VirtualBox**.
2. Create a new VM and configure the following:
   - **OS Type**: Linux (CentOS/Ubuntu)
   - **RAM**: Minimum 2GB
   - **CPU**: 2 Cores
   - **Storage**: 20GB dynamically allocated
3. Attach the Linux **ISO file** and boot the VM.
4. Follow installation steps and set up a root user.
5. Configure **Bridged Networking** to get an IP from the router.
6. Use `ssh` to connect to the VM remotely.

📌 **Refer to [VM-Setup-Steps.md](Manual-Setup/VM-Setup-Steps.md) for a detailed guide.**

---

## 2️⃣ Automated VM Creation (Using Vagrant)
### Steps:
1. Install **Vagrant** and **VirtualBox**.
2. Create a directory and initialize a Vagrant project:
   ```bash
   mkdir vagrant-vms && cd vagrant-vms
   vagrant init eurolinux-vagrant/centos-stream-9
   ```
3. Edit the `Vagrantfile` to customize VM settings (RAM, CPU, Networking).
4. Run the following command to create and boot the VM:
   ```bash
   vagrant up
   ```
5. Access the VM via SSH:
   ```bash
   vagrant ssh
   ```

📌 **Refer to [Vagrantfile](Automated-Setup/Vagrantfile) for configuration details.**

---

## 📸 Screenshots
- Manual VM Creation (VirtualBox Setup)
- Vagrant Commands Execution (`vagrant up`, `vagrant ssh`)
- VM Networking and SSH Access

---

## ✅ Key Takeaways
✔ **Manual Setup** helps understand VM creation fundamentals.  
✔ **Automated Setup** using Vagrant speeds up the process.  
✔ **Bridged Networking** allows VMs to behave like real machines on the network.  

---

🔗 **Next Step:** Proceed to [2-Mini-Finance-Website](../2-Mini-Finance-Website) for web deployment!
