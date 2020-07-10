output "vnet_id" {
  value = azurerm_virtual_network.main.id
}

output "snet_application_id" { 
 value = azurerm_subnet.application.id
}
