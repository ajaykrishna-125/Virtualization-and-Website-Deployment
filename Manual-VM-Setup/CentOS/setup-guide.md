# Manual Setup Guide: CentOS VM in VirtualBox

## **Prerequisites**
Before starting, ensure the following:
- **Virtualization is enabled** in your system BIOS.
- **Oracle VirtualBox** is installed on your machine.
- **CentOS ISO file** is downloaded from the official CentOS website.

## **Step 1: Creating a New Virtual Machine**
1. **Open VirtualBox** and click on `New` to create a VM.
2. Enter the VM details:
   - **Name:** `centosvm`
   - **Type:** `Linux`
   - **Version:** `Red Hat (64-bit)`
3. Click `Next`.

## **Step 2: Allocating Memory**
1. Set RAM size to **2048 MB (2 GB)** (recommended for smooth performance).
2. Click `Next`.

## **Step 3: Creating a Virtual Hard Disk**
1. Select `Create a virtual hard disk now` and click `Create`.
2. Choose `VDI (VirtualBox Disk Image)` and click `Next`.
3. Select `Dynamically allocated` for efficient storage management.
4. Set disk size to **20 GB** (recommended) and click `Create`.

## **Step 4: Attaching the CentOS ISO**
1. Select the newly created VM and click `Settings`.
2. Navigate to `Storage` and select `Empty` under `Controller: IDE`.
3. Click on the **CD icon** and choose `Choose a disk file…`.
4. Select the **CentOS ISO file** you downloaded earlier.
5. Click `OK`.

## **Step 5: Configuring Network Settings**
1. Go to `Settings` → `Network`.
2. **Adapter 1**:
   - Ensure it is `Enabled`.
   - Set `Attached to` as `NAT` (for internet access).
3. **Adapter 2**:
   - Enable the second adapter.
   - Set `Attached to` as `Bridged Adapter`.
   - Choose your active network adapter (Wi-Fi/Ethernet).

## **Step 6: Installing CentOS**
1. Start the VM by clicking `Start`.
2. When prompted, select `Install CentOS Stream 9` and press `Enter`.
3. Choose your preferred language and click `Continue`.
4. **Installation Summary Configuration:**
   - `Date & Time`: Select your region and time zone.
   - `Keyboard`: Set as per preference.
   - `Installation Destination`: Select the default disk and choose `Automatic Partitioning`.
   - `Network & Hostname`: Enable networking and set hostname (e.g., `centosvm`).
5. Click `Begin Installation`.
6. Set a **root password**.
7. After installation completes, click `Reboot`.

## **Step 7: Post-Installation Steps**
1. Remove the ISO file from VirtualBox:
   - Go to `Settings` → `Storage`.
   - Click on the `CentOS ISO` and choose `Remove`.
2. Start the VM and log in using the **root user credentials**.
3. Check the assigned IP address:
   ```sh
   ip addr show
   ```

## **Step 8: Enabling SSH for Remote Access**
1. Install OpenSSH Server (if not installed):
   ```sh
   sudo yum install -y openssh-server
   ```
2. Start and enable SSH service:
   ```sh
   sudo systemctl start sshd
   sudo systemctl enable sshd
   ```
3. Find the VM’s IP address:
   ```sh
   ip addr show
   ```
4. From your host machine, connect via SSH:
   ```sh
   ssh root@<VM_IP_ADDRESS>
   ```

## **Conclusion**
Successfully installed CentOS in VirtualBox. Now we can proceed to configuring software, hosting applications, or automating VM creation with Vagrant.

---

📝 **Next Steps:** Automating this setup using Vagrant!


