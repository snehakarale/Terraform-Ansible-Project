# Azure Cloud Infrastructure Automation

# Overview
This project, developed as part of my college coursework, challenges learners to apply Terraform, Ansible, and Microsoft Azure skills to design and deploy a highly available, scalable, and secure infrastructure on Azure. The goal is to automate both infrastructure provisioning and guest OS configuration, following cloud automation best practices. 

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
