# Virtualization and VM Setup

This repository contains resources and scripts for setting up virtual machines (VMs) using both **manual** and **automated** approaches, primarily focusing on **CentOS** and **Vagrant**.

## 📂 Repository Structure

```
Virtualization-and-VM-Setup/
│── docs/                              # Documentation
│   ├── Networking in Virtualization.md
│   ├── Vagrant for virtualization.md
│   ├── Virtualization Concepts.md
│── Manual-VM-Setup/CentOS/            # Manual VM setup for CentOS
│   ├── screenshots/                   
│   ├── setup-guide.md                 
│── Vagrant-Automation-VM-Setup/CentOS/ # Automated VM setup using Vagrant
│   ├── provision.sh                    
│   ├── setup-guide.sh                   
│   ├── Vagrantfile                      
│── README.md                            # This file
```

## 📝 Documentation

The `docs/` folder contains guides on virtualization concepts, networking, and using Vagrant for virtualization.

## 🛠️ Manual VM Setup

The `Manual-VM-Setup/CentOS/` directory provides a step-by-step guide to manually setting up a CentOS VM.

## 🤖 Automated VM Setup

The `Vagrant-Automation-VM-Setup/CentOS/` directory contains scripts and a `Vagrantfile` to automate the VM setup using Vagrant.

## 🚀 Getting Started

1. For manual setup, follow the steps in `setup-guide.md`.
2. For automated setup:
   - Install [Vagrant](https://www.vagrantup.com/downloads).
   - Navigate to `Vagrant-Automation-VM-Setup/CentOS/`.
   - Run: `vagrant up`.




