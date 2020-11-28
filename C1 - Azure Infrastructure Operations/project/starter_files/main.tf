provider "azurerm" {
  features {}
  skip_provider_registration = "true"
}

resource "azurerm_resource_group" "udclass" {
  name     = "${var.prefix}-resources"
  location = var.location

  tags = {
    environment = "Test"
  }
}

resource "azurerm_virtual_network" "udNet" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.udclass.location
  resource_group_name = azurerm_resource_group.udclass.name
  tags                = azurerm_resource_group.udclass.tags
}

resource "azurerm_subnet" "udSubNet" {
  name                 = "${var.prefix}-subnet"
  resource_group_name  = azurerm_resource_group.udclass.name
  virtual_network_name = azurerm_virtual_network.udclass.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azure_security_group" "udSg" {
  name                = "webservers"
  location            = azurerm_resource_group.udclass.location
  resource_group_name = azurerm_resource_group.udclass.name
  tags                = azurerm_resource_group.udclass.tags

  security_rule {
    name                       = "udblockInbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }


  security_rule {
    name                       = "udblockOutbound"
    priority                   = 101
    direction                  = "Outbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "udallowInbound"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "VirtualNetwork"
  }


  security_rule {
    name                       = "udallowOutbound"
    priority                   = 201
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "VirtualNetwork"
  }

}

resource "azurerm_network_interface" "udNic" {
  name                = "${var.prefix}-nic-${count.index}"
  resource_group_name = azurerm_resource_group.udclass.name
  location            = azurerm_resource_group.udclass.location
  tags                = azurerm_resource_group.udclass.tags
  count               = var.vm_count

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.udSubNet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_public_ip" "udPublicIp" {
  name                = "${var.prefix}-udPubIP-${count.index}"
  resource_group_name = azurerm_resource_group.udclass.name
  location            = azurerm_resource_group.udclass.location
  allocation_method   = "Static"
  domain_name_label   = "udtest-${count.index}"
  count               = var.vm_count
  tags                = azurerm_resource_group.udclass.tags
  sku                 = "Standard"
}

resource "azurerm_availability_set" "udavailSet" {
  name                = "${var.prefix}-udavailset"
  location            = azurerm_resource_group.udclass.location
  resource_group_name = azurerm_resource_group.udclass.name
  tags                = azurerm_resource_group.udclass.tags

}

resource "azurerm_lb" "udazloadb" {
  name                = "${var.prefix}-udlb"
  location            = azurerm_resource_group.udclass.location
  resource_group_name = azurerm_resource_group.udclass.name
  tags                = azurerm_resource_group.udclass.tags
  sku                 = "Standard"
  count               = length(azurerm_public_ip.udPublicIp)

  frontend_ip_configuration {
    name                 = "PublicIPAddressLb-${count.index}"
    public_ip_address_id = azurerm_public_ip.udPublicIp[count.index].id
  }
}


resource "azurerm_lb_backend_address_pool" "udlbPool" {
  count               = length(azurerm_lb.udazloadb)
  resource_group_name = azurerm_resource_group.udclass.name
  loadbalancer_id     = azurerm_lb.udazloadb[count.index].id
  name                = "${var.prefix}-lbpool-${count.index}"
}


resource "azurerm_network_interface_backend_address_pool_association" "BEndAssoc" {
  count                   = length(azurerm_network_interface.udNic)
  network_interface_id    = azurerm_network_interface.udNic[count.index].id
  ip_configuration_name   = "internal-Ip"
  backend_address_pool_id = azurerm_lb_backend_address_pool.udlbPool[count.index].id

}

resource "azurerm_linux_virtual_machine" "udclass" {
  name                            = "${var.prefix}-vm-${count.index}"
  resource_group_name             = azurerm_resource_group.udclass.name
  location                        = azurerm_resource_group.udclass.location
  size                            = "Standard_F2"
  availability_set_id             = azurerm_availability_set.udavailSet.id
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false
  count                           = var.vm_count
  tags                            = azurerm_resource_group.udclass.tags
  network_interface_ids = [
    azurerm_network_interface.udNic[count.index].id,
  ]

   source_image_id = var.imageid

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

}
