rgs = {
  rg1 = {
    name     = "rg-prod89"
    location = "Westus"
  }
  rg2 = {
    name     = "rg-dev89"
    location = "centralindia"
  }
}
vnets = {
  vnet_chahat01={
  name                = "vnet-chahat01"
  address_space       = ["10.0.0.0/16"]
  location            = "Westus"
  resource_group_name = "rg-prod89"
  }
}
snets = {
  frontend-subnet= {
     resource_group_name  = "rg-prod89"
    virtual_network_name = "vnet-chahat01"
    address_prefixes     = ["10.0.1.0/24"]
  }
  backend-subnet = {
    resource_group_name  = "rg-prod89"
    virtual_network_name = "vnet-chahat01"
    address_prefixes     = ["10.0.2.0/24"]
  }
}
ips={
  ip1={
    name                = "frontend-ip"
    resource_group_name = "rg-prod89"
    location            = "westus"
    allocation_method   = "Static"
}
  ip2={
    name                = "backend-ip"
    resource_group_name = "rg-prod89"
    location            = "westus"
    allocation_method   = "Static"
  }
}
nics = {
  nic1 = {
    name                = "frontend-nic"
    location            = "westus"
    resource_group_name = "rg-prod89"
    subnet_name         = "frontend-subnet"
    public_ip_name      = "frontend-ip"
  }

  nic2 = {
    name                = "backend-nic"
    location            = "westus"
    resource_group_name = "rg-prod89"
    subnet_name         = "backend-subnet"
    public_ip_name      = "backend-ip"
  }
}

vms = {
  vm1 = {
    name                = "frontend-vm"
    resource_group_name = "rg-prod89"
    location            = "westus"
    size                = "Standard_D2s"
    admin_username      = "adminuser"

    nic_name = "frontend-nic"
  }

  vm2 = {
    name                = "backend-vm"
    resource_group_name = "rg-prod89"
    location            = "westus"
    size                = "Standard_D2s"
    admin_username      = "adminuser"

    nic_name = "backend-nic"
  }
}