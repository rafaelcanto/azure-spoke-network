

resource "azurerm_network_security_group" "main" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_subnet_network_security_group_association" "main" {
  subnet_id                 = var.snet_id
  network_security_group_id = azurerm_network_security_group.main.id
}







