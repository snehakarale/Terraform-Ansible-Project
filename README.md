# Terraform-Ansible-Project

Overview
This project automates the provisioning and configuration of infrastructure and systems using Terraform for infrastructure-as-code (IAC) and Ansible for configuration management.

The project is divided into two parts:

# Part 1: Terraform - Infrastructure Provisioning

Provision Infrastructure on Azure: Using Terraform, resources such as virtual machines (Linux and Windows), networking (VNET, subnet), and databases (PostgreSQL) are automatically deployed.
Modules: Each resource or service (e.g., Resource Groups, Virtual Networks, Virtual Machines) is defined in its own Terraform module.
State Management: Terraform state is managed remotely on Azure to ensure consistent provisioning.

# Part 2: Ansible - System Configuration

System Administration Roles: Ansible roles are designed to perform tasks like managing users, updating system files, partitioning disks, and configuring web servers.

Roles:
- File Update: Updates /etc/profile to set the TMOUT environment variable.
- User/Group Creation: Creates users and groups, manages SSH keys.
- Disk Configuration: Partitions and formats a 10GB disk.
- Load-Balanced Website: Installs and configures Apache web server for a load-balanced website.
