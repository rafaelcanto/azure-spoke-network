

resource "azurerm_network_security_group" "main" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_subnet_network_security_group_association" "main" {
  subnet_id                 = var.snet_id
  network_security_group_id = azurerm_network_security_group.main.id
}


resource "azurerm_network_security_rule" "allow_http_inboud" {
  name                        = "allow-http-inboud-rule"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.main.name
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "allow_https_inboud" {
  name                        = "allow-https-inboud-rule"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.main.name
  priority                    = 102
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}







