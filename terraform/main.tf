module "computeinstance" {
  source = "./computeinstance"

  instance_display_name = var.instance_display_name
  compartment_id        = var.compartment_id
  availability_domain   = var.availability_domain
  boot_volume_size      = var.boot_volume_size
  ocpus                 = var.ocpus

  memory_in_gbs                    = var.memory_in_gbs
  instance_shape                   = var.instance_shape
  mp_OAS_listing_image_resource_id = var.mp_OAS_listing_image_resource_id

  mp_OAS_listing_resource_version = var.mp_OAS_listing_resource_version
  mp_OAS_listing_id               = var.mp_OAS_listing_id

  network_compartment_id = var.network_compartment_id
  existing_vcn_id        = var.existing_vcn_id
  subnet_id              = var.subnet_id
  ssh_authorized_keys    = var.ssh_authorized_keys

  admin_user_name         = var.admin_user_name
  admin_password          = var.admin_password
  connect_string          = var.connect_string
  new_db_admin_username   = var.new_db_admin_username
  new_db_password         = var.new_db_password
  oas_rcu_schema_prefix   = var.oas_rcu_schema_prefix
  oas_rcu_schema_password = var.oas_rcu_schema_password

  create_domain    = var.create_domain
  assign_public_ip = var.assign_public_ip
}

output "instance_public_ip" {
  value = module.computeinstance.vm_public_ip
}
output "instance_private_ip" {
  value = module.computeinstance.vm_private_ip
}
