# Terraform-Ansible-Project

Overview
This project was developed as part of my college coursework to understand how to provision basic infrastructure using Terraform and configure the provisioned resources using Ansible.

The project is divided into two parts:

# Part 1: Terraform - Infrastructure Provisioning

Using Terraform, infrastructure resources such as Linux and Windows virtual machines, Virtual Networks (VNETs), subnets, and a PostgreSQL database are automatically deployed on Azure. Each resource is defined in its own Terraform module for modularity and reusability. Terraform state is managed remotely on Azure Blob Storage to ensure consistent, secure, and collaborative provisioning.



# Part 2: Ansible - System Configuration

System Administration Roles: Ansible roles are designed to perform tasks like managing users, updating system files, partitioning disks, and configuring web servers.

Roles:
- File Update: Updates /etc/profile to set the TMOUT environment variable.
- User/Group Creation: Creates users and groups, manages SSH keys.
- Disk Configuration: Partitions and formats a 10GB disk.
- Load-Balanced Website: Installs and configures Apache web server for a load-balanced website.
