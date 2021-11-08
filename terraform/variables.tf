# to be used by instance
variable "instance_display_name" {
  type        = string
  default     = ""
  description = "Instance display name"
}

variable "compartment_id" {
  type        = string
  default     = ""
  description = "Compartment id in which stack will be created"
}

variable "availability_domain" {
  type        = string
  default     = ""
  description = "Availability domain in which stack will be created in"
}

variable "boot_volume_size" {
  type        = number
  default     = 1024
  description = "Size of boot volume in GB"
}

variable "ocpus" {
  type        = number
  default     = 1
  description = "Number of OCPUs on the instance"
}

variable "memory_in_gbs" {
  type        = number
  default     = 15
  description = "Size of memory in GB"
}

variable "instance_shape" {
  type        = string
  default     = "VM.Standard2.1"
  description = "Shape of the instance"
}

variable "mp_OAS_listing_image_resource_id" {
  type        = string
  description = "Target image id"
}

variable "mp_OAS_listing_resource_version" {
  type        = string
  description = "Target image version "
}

variable "mp_OAS_listing_id" {
  type        = string
  description = "Target image version"
}

variable "network_compartment_id" {
  type        = string
  default     = ""
  description = "Network compartment details"
}

variable "existing_vcn_id" {
  type        = string
  default     = ""
  description = "Existing VCN details"
}

variable "subnet_id" {
  type        = string
  default     = ""
  description = "Existing vnic subnet details"
}

variable "assign_public_ip" {
  type        = bool
  default     = false
  description = "option if a public IP should be assigned to the compute instance"
}

variable "ssh_authorized_keys" {
  type        = string
  default     = ""
  description = "SSH public key"
}

variable "create_domain" {
  type        = bool
  default     = false
  description = "option if user want the installer to create OAS domain"
}

variable "admin_user_name" {
  type        = string
  default     = ""
  description = "Username who will administer Oracle Analytics Server"
}

variable "admin_password" {
  type        = string
  default     = ""
  description = "Password for the administrator"
}

variable "connect_string" {
  type        = string
  default     = ""
  description = "Connect string to the database"
}

variable "new_db_admin_username" {
  type        = string
  default     = ""
  description = "Admin username"
}

variable "new_db_password" {
  type        = string
  default     = ""
  description = "Admin pasword"
}

variable "oas_rcu_schema_prefix" {
  type        = string
  default     = ""
  description = "Schema prefix"
}

variable "oas_rcu_schema_password" {
  type        = string
  default     = ""
  description = "Schema password"
}