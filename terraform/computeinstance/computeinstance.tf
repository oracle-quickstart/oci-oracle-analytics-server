locals {
  is_flex_shape     = (var.instance_shape == "VM.Standard.E4.Flex") || (var.instance_shape == "VM.Standard.E3.Flex")
  flex_shape_config = local.is_flex_shape ? [{ "ocpus" : var.ocpus, "memory_in_gbs" : var.memory_in_gbs }] : []
}


resource "oci_core_instance" "OAS_MP_instance" {
  availability_domain = var.availability_domain

  compartment_id = var.compartment_id

  shape = var.instance_shape
  source_details {
    source_id               = var.mp_OAS_listing_image_resource_id
    source_type             = "image"
    boot_volume_size_in_gbs = var.boot_volume_size
  }

  dynamic "shape_config" {
    for_each = local.flex_shape_config
    content {
      ocpus         = shape_config.value.ocpus
      memory_in_gbs = shape_config.value.memory_in_gbs
    }
  }
  display_name = var.instance_display_name

  create_vnic_details {
    assign_public_ip = var.assign_public_ip
    subnet_id        = var.subnet_id
  }

  metadata = {
    ssh_authorized_keys = var.ssh_authorized_keys
    user_data           = join(",\n", data.template_cloudinit_config.biconfig.*.rendered)
  }

  preserve_boot_volume = false

}

output "vm_public_ip" {
  value = oci_core_instance.OAS_MP_instance.public_ip
}
output "vm_private_ip" {
  value = oci_core_instance.OAS_MP_instance.private_ip
}
