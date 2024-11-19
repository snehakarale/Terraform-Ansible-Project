This project involves creating a series of Ansible roles to automate different system administration tasks. Here's a breakdown of what each role is designed to accomplish:

#1. Role for File Update: 
- Purpose: Append specific lines to the /etc/profile file on a Linux system. 
- Details: This role adds a comment indicating that the file update was made by Ansible along with a specific username. It also sets the TMOUT environment variable to 1500 seconds, which automatically logs out users after 1500 seconds of inactivity.

#2. Role for User/Group Creation: 
- Purpose: Create and manage user accounts and groups on the system. 
- Details: Group Creation: Adds a new group called cloudadmins. User Accounts: Creates three user accounts (user100, user200, and user300). Group Membership: Adds these users to the cloudadmins and wheel groups. SSH Keys: Generates SSH keys for each user without a passphrase.

#3. Role for Disk Configuration: 
- Purpose:Partition and format a data disk. 
- Details: Disk Partitioning: Creates two partitions on a 10 GB disk: A 4 GB partition formatted with the XFS filesystem, mounted persistently on /part1. A 5 GB partition formatted with the EXT4 filesystem, mounted persistently on /part2.

#4. Role to Configure a Load-Balanced Website: 
- Purpose: Set up and configure an Apache web server to serve a load-balanced website. 
- Details: Installation: Installs Apache web server software. File Management: Creates and uploads HTML files (vm1.html, vm2.html, and vm3.html) with each file containing the FQDN of the respective node. Permissions: Copies these files to the /var/www/html directory and sets permissions to 0444 (read-only). Service - -------
