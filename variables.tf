

variable "environment_type" {
  default = "dev"
}

variable "project_name" {
  default = "landingzone"
}

variable "location" {
  default = "eastus"
}

variable "brsouth_prd_hub_vnet_id" {
  default = "/subscriptions/6fe14cf2-3c56-4bd4-b203-ec40f248b731/resourceGroups/rg-prd-brsouth-hub/providers/Microsoft.Network/virtualNetworks/vnet-hub-prd-brsouth-01"
}

variable "brsouth_nprd_hub_vnet_id" {
  default = "/subscriptions/280c92f4-08d3-41d1-a216-e445886c3e73/resourceGroups/rg-nprd-brsouth-hub/providers/Microsoft.Network/virtualNetworks/vnet-hub-nprd-brsouth-01"
}

variable "eastus2_nprd_hub_vnet_id" {
  default = "/subscriptions/280c92f4-08d3-41d1-a216-e445886c3e73/resourceGroups/rg-nprd-eastus2-hub/providers/Microsoft.Network/virtualNetworks/vnet-hub-nprd-eastus2-01"
}

variable "eastus2_prd_hub_vnet_id" {
  default = "/subscriptions/6fe14cf2-3c56-4bd4-b203-ec40f248b731/resourceGroups/rg-prd-brsouth-hub/providers/Microsoft.Network/virtualNetworks/vnet-hub-prd-eastus2-01"
}

variable "vnet_address_space" {
  default = "172.16.0.0/16"
}

variable "snet_dmz_address_prefix" {
  default = "172.16.0.0/24"

}

variable "snet_web_address_prefix" {
  default = "172.16.1.0/24"
}

variable "snet_application_address_prefix" {
  default = "172.16.2.0/24"

}

variable "snet_database_address_prefix" {
  default = "172.16.3.0/24"

}

######################################################
##
##    TAGS
##
######################################################

variable "tag_sigla" {
  type        = string
  description = "Tag de negócios"
  default     = "CCoE"
}

variable "tag_descsigla" {
  type        = string
  description = "Tag de negócios (descsigla)"
  default     = "Cloud Team"
}

variable "tag_pep" {
  type        = string
  description = "id do PEP"
  default     = "P000000"
}


variable "tag_project" {
  type        = string
  description = "project startDate|endDate"
  default     = "02-04-2020|30-04-2020"
}


variable "tag_golive" {
  type    = bool
  default = false
}


variable "tag_backup" {
  type    = bool
  default = false

}

variable "tag_function" {
  type        = string
  description = "frontend|backend"
  default     = "backend"
}

variable "tag_service" {
  type        = string
  description = "web|webservice|queue|database|cache|streaming"
  default     = "database"
}

variable "tag_owner" {
  type        = string
  description = "dbas|performance|middlleware|telecom|devops|seginfo|monitoring"
  default     = "devops"
}

variable "tag_scheduledstartstop" {
  type    = bool
  default = false
}

variable "tag_office_hours" {
  type    = number
  default = 8
}

variable "tag_office_days" {
  type    = number
  default = 5
}

variable "tag_scheduledstartstopexception" {
  type    = bool
  default = false
}

variable "tag_hardening" {
  type    = string
  default = "empty"
}
