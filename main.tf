provider "azurerm" {
  features {}
  version = "~> 2.0"
}

locals {
  rg_name               = "rg-${var.project_name}-${var.environment_type}-network"
  vnet_name             = "vnet-${var.project_name}-${var.environment_type}-${var.location}-01"
  snet_dmz_name         = "snet-dmz"
  snet_web_name         = "snet-web"
  snet_application_name = "snet-application"
  snet_database_name    = "snet-database"
  nsg_dmz_name          = "nsg-${var.project_name}-${var.environment_type}-dmz-01"
  nsg_web_name          = "nsg-${var.project_name}-${var.environment_type}-web-01"
  nsg_application_name  = "nsg-${var.project_name}-${var.environment_type}-application-01"
  nsg_database_name     = "nsg-${var.project_name}-${var.environment_type}-database-01"


  tags = {
    environment_type            = var.environment_type
    sigla                       = var.tag_sigla
    descsigla                   = var.tag_descsigla
    pep                         = var.tag_pep
    project                     = var.tag_project
    golive                      = var.tag_golive
    backup                      = var.tag_backup
    function                    = var.tag_function
    service                     = var.tag_service
    owner                       = var.tag_owner
    scheduledstartstop          = var.tag_scheduledstartstop
    office_hours                = var.tag_office_hours
    office_days                 = var.tag_office_days
    scheduledstartstopexception = var.tag_scheduledstartstopexception
    hardening                   = var.tag_hardening
    region                      = var.location
  }
}

resource "azurerm_resource_group" "main" {
  name     = local.rg_name
  location = var.location
  tags     = local.tags
}

resource "azurerm_virtual_network" "main" {
  name                = local.vnet_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = [var.vnet_address_space]
  tags                = local.tags
}


resource "azurerm_subnet" "dmz" {
  name                 = local.snet_dmz_name
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefix       = var.snet_dmz_address_prefix
}

resource "azurerm_subnet" "web" {
  name                 = local.snet_web_name
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefix       = var.snet_web_address_prefix
}

resource "azurerm_subnet" "application" {
  name                 = local.snet_application_name
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefix       = var.snet_application_address_prefix
}

resource "azurerm_subnet" "database" {
  name                 = local.snet_database_name
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefix       = var.snet_database_address_prefix
}

resource "azurerm_subnet_route_table_association" "dmz" {
  subnet_id      = azurerm_subnet.dmz.id
  route_table_id = module.udr_default.udr_id
}

resource "azurerm_subnet_route_table_association" "web" {
  subnet_id      = azurerm_subnet.web.id
  route_table_id = module.udr_default.udr_id
}

resource "azurerm_subnet_route_table_association" "application" {
  subnet_id      = azurerm_subnet.application.id
  route_table_id = module.udr_default.udr_id
}

resource "azurerm_subnet_route_table_association" "database" {
  subnet_id      = azurerm_subnet.database.id
  route_table_id = module.udr_default.udr_id
}


module "nsg_dmz" {
  source   = "./modules/nsg_dmz"
  rg_name  = azurerm_resource_group.main.name
  snet_id  = azurerm_subnet.dmz.id
  nsg_name = local.nsg_dmz_name
  location = var.location
}

module "nsg_web" {
  source   = "./modules/nsg_web"
  rg_name  = azurerm_resource_group.main.name
  snet_id  = azurerm_subnet.web.id
  nsg_name = local.nsg_web_name
  location = var.location
}

module "nsg_application" {
  source   = "./modules/nsg_application"
  rg_name  = azurerm_resource_group.main.name
  snet_id  = azurerm_subnet.application.id
  nsg_name = local.nsg_application_name
  location = var.location
}

module "nsg_database" {
  source   = "./modules/nsg_database"
  rg_name  = azurerm_resource_group.main.name
  snet_id  = azurerm_subnet.database.id
  nsg_name = local.nsg_database_name
  location = var.location
}

module "udr_default" {
  source           = "./modules/udr_default"
  rg_name          = azurerm_resource_group.main.name
  location         = var.location
  tags             = local.tags
  environment_type = var.environment_type
}



resource "azurerm_virtual_network_peering" "spoke_to_hub" {
  name                         = "peer-spoke-to-hub-${var.environment_type}-${var.location}"
  resource_group_name          = azurerm_resource_group.main.name
  virtual_network_name         = azurerm_virtual_network.main.name
  remote_virtual_network_id    = var.hub_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
}
