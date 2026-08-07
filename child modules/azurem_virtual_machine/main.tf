resource "azurerm_linux_virtual_machine" "vms" {

  for_each = var.vms

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size

  admin_username = each.value.admin_username

  network_interface_ids = [
    data.azurerm_network_interface.nics[each.key].id
  ]

  disable_password_authentication = true

  admin_ssh_key {
    username   = each.value.admin_username
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}