data "azurerm_subnet" "snets" {
  for_each = var.nics

  name                 = each.value.subnet_name
  virtual_network_name = "vnet-chahat01"   
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "ips" {
  for_each = var.nics

  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}
 