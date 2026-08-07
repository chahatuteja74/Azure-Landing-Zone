resource "azurerm_resource_group" "mohit-rg" {
  for_each = var.rgs
  name     = each.value.name
  location = each.value.location
}
