

variable "environment_type" {
  default = "dev"
}

variable "project_name" {
  default = "landingzone"
}

variable "location" {
  default = "eastus"
}

variable "hub_vnet_id" {
  default = "/subscriptions/834f081d-bd7c-4908-97bd-98302a28f9fa/resourceGroups/rg-landingzone-dev-network/providers/Microsoft.Network/virtualNetworks/vnet-landingzone-dev-eastus-01"
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
