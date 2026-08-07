module "resource_group" {
  source = "../../child modules/azurem_resource_group"
  rgs    = var.rgs
}


module "virtual_network" {
depends_on = [module.resource_group]
  source     = "../../child modules/azurem_virtual_network"
  vnets    = var.vnets
}

module "subnet" {
  depends_on = [module.resource_group, module.virtual_network]
  source     = "../../child modules/azurem_subnet"
  snets      = var.snets
}

module "public_ip"{
  depends_on = [module.resource_group, module.virtual_network,module.subnet]
  source     = "../../child modules/azurem_public_ip"
  ips        = var.ips
}

module "nic_card"{
  depends_on = [module.resource_group, module.virtual_network,module.subnet,module.public_ip]
  source     = "../../child modules/azurem_nic_card"
  nics       = var.nics
}

module "vm"{
  depends_on = [module.resource_group, module.virtual_network,module.subnet,module.public_ip,module.nic_card]
  source     = "../../child modules/azurem_virtual_machine"
 vms     = var.vms
}
