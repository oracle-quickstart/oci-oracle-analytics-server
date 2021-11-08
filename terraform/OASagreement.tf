
locals {
  node_count          = 1
  enable_subscription = var.mp_OAS_listing_id != ""

  mp_OAS_listing_id               = var.mp_OAS_listing_id
  mp_OAS_listing_image_resource_id      = var.mp_OAS_listing_image_resource_id
  mp_OAS_listing_resource_version = var.mp_OAS_listing_resource_version

}

# Get Image Agreement
resource "oci_core_app_catalog_listing_resource_version_agreement" "oas_image_agreement" {
  count = local.enable_subscription ? 1 : 0
  listing_id               = var.mp_OAS_listing_id
  listing_resource_version = var.mp_OAS_listing_resource_version
}

# Accept Terms and Subscribe to the image, placing the image in a particular compartment
resource "oci_core_app_catalog_subscription" "oas_image_subscription" {
  count                    = local.enable_subscription ? 1 : 0
  compartment_id           = var.compartment_id
  eula_link                = oci_core_app_catalog_listing_resource_version_agreement.oas_image_agreement[0].eula_link
  listing_id               = oci_core_app_catalog_listing_resource_version_agreement.oas_image_agreement[0].listing_id
  listing_resource_version = oci_core_app_catalog_listing_resource_version_agreement.oas_image_agreement[0].listing_resource_version
  oracle_terms_of_use_link = oci_core_app_catalog_listing_resource_version_agreement.oas_image_agreement[0].oracle_terms_of_use_link
  signature                = oci_core_app_catalog_listing_resource_version_agreement.oas_image_agreement[0].signature
  time_retrieved           = oci_core_app_catalog_listing_resource_version_agreement.oas_image_agreement[0].time_retrieved

  timeouts {
    create = "20m"
  }
}