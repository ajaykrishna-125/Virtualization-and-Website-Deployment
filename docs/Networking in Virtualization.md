# Networking in Virtualization

## How Virtual Machines Get IP Addresses
Virtual machines (VMs) require an IP address to communicate over a network, just like physical machines. The IP address can be assigned in multiple ways, depending on the networking mode used:

1. **DHCP (Dynamic Host Configuration Protocol)**  
   - The VM receives an IP address dynamically from the network's DHCP server (like your WiFi router).  
   - Common in NAT and Bridged Networking modes.

2. **Static IP Address**  
   - Manually assigned to the VM in the OS settings or in the Vagrantfile.  
   - Used in Private Networks for better control over VM networking.

## Bridged Networking vs. NAT Networking

### 1. **Bridged Networking (Public Network in Vagrant)**
- The VM acts as if it is another physical machine on the same network as the host.
- It gets an IP address from the same DHCP server as the host machine.
- The VM is directly accessible by other machines on the network.
- **Use Case:** When you need VMs to communicate with real-world networks, like in a lab setup.

**Example Vagrantfile Configuration:**
```ruby
config.vm.network "public_network"
```

### 2. **NAT Networking (Default in Vagrant)**
- The VM shares the host's network connection using **Network Address Translation (NAT).**
- The VM gets an internal IP address that is **not directly accessible** from the host's network.
- Internet access is available, but external machines cannot directly connect to the VM.
- **Use Case:** When you need internet access for the VM but do not want it to be reachable from the external network.

**Example Vagrantfile Configuration:**
```ruby
config.vm.network "private_network", ip: "192.168.56.10"
```

## Checking and Validating Network Configurations

### 1. **Check IP Address of the VM**
- Inside the VM, run:
  ```bash
  ip addr show
  ```
  - This displays all assigned network interfaces and IP addresses.

### 2. **Check Network Configuration on Host**
- On **Windows**, run:
  ```cmd
  ipconfig
  ```
- On **Linux/macOS**, run:
  ```bash
  ifconfig   # or ip addr show
  ```

### 3. **Testing Network Connectivity**
- **Ping another device (e.g., host machine) from the VM:**
  ```bash
  ping <host-ip-address>
  ```
- **Check if the VM can access the internet:**
  ```bash
  ping 8.8.8.8
  ```

---

By understanding these networking concepts, we can configure and troubleshoot virtual networks efficiently in Vagrant, VirtualBox, and other virtualization tools.
