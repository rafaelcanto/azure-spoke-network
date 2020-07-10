

resource "azurerm_route_table" "main" {
  name                          = "udr-spoke-default"
  location                      = var.location
  resource_group_name           = var.rg_name
  disable_bgp_route_propagation = false

  route {
    name           = "route-to-onprem-01"
    address_prefix = "10.0.0.0/8"
    next_hop_type  = "VirtualNetworkGateway"
  }

  route {
    name           = "route-to-onprem-02"
    address_prefix = "172.16.0.0/12"
    next_hop_type  = "VirtualNetworkGateway"
  }

  route {
    name           = "route-to-onprem-03"
    address_prefix = "192.168.0.0/16"
    next_hop_type  = "VirtualNetworkGateway"
  }

  route {
    name                   = "route-to-www"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "Internet"
  }

  # route {
  #   name                   = "route-to-www"
  #   address_prefix         = "0.0.0.0/0"
  #   next_hop_type          = "VirtualAppliance"
  #   next_hop_in_ip_address = var.environment_type == "prod" ? "172.26.192.4" : "172.26.255.4"
  # }

  tags = var.tags
}
