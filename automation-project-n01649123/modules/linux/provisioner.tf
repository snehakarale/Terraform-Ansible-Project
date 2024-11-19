resource "null_resource" "linux_provisioner" {
   for_each   = var.linux_name
   depends_on = [azurerm_linux_virtual_machine.vmlinux]

   provisioner "remote-exec" {
    inline = ["echo Hostname: $(hostname)"]

    connection {
       type        = "ssh"
       user        = var.admin_username
       private_key = file(var.private_key)
       host        = azurerm_linux_virtual_machine.vmlinux[each.key].public_ip_address
     }
   }
 }


   