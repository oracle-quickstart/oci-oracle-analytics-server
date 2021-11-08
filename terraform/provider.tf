
variable "tenancy_ocid" {
  type    = string
}

variable "user_ocid" {
  type    = string
  default = ""
}

variable "fingerprint" {
  type    = string
  default = ""
}

variable "private_key_path" {
  type    = string
  default = ""
}

variable "region" {
  type    = string
}

variable "disable_auto_retries" {
  type    = string
  default = "true"
}
