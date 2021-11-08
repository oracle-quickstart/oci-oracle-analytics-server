# do not set default values for these, they will inherit it from main variables file
variable "instance_display_name" {
  type = string
}

variable "compartment_id" {
  type = string
}

variable "availability_domain" {
  type = string
}

variable "boot_volume_size" {
  type    = number
}

variable "ocpus" {
  type    = number
}

variable "memory_in_gbs" {
  type    = number
}

variable "instance_shape" {
  type    = string
}

variable "mp_OAS_listing_image_resource_id" {
  type = string
}

variable "mp_OAS_listing_resource_version" {
  type = string
}

variable "mp_OAS_listing_id" {
  type = string
}

variable "network_compartment_id" {
  type = string
}

variable "existing_vcn_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "assign_public_ip" {
  type = bool
}

variable "ssh_authorized_keys" {
  type      = string
}

variable "create_domain" {
  type = bool
}

variable "admin_user_name" {
  type      = string
}
variable "admin_password" {
  type      = string
}
variable "connect_string" {
  type      = string
}
variable "new_db_admin_username" {
  type      = string
}
variable "new_db_password" {
  type      = string
}
variable "oas_rcu_schema_prefix" {
  type      = string
}
variable "oas_rcu_schema_password" {
  type      = string
}