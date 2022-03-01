data "template_file" "biconfig_template" {
  template = file("${path.module}/templates/generate_biconfig.sh")
}

data "template_file" "firewallportsconfig_template" {
  template =  file("${path.module}/templates/generate_firewallportsconfig.sh")
}

data "template_file" "firewallportsscript_template" {
  template = file("${path.module}/templates/generate_openfirewallportsscript.sh")
}

data "template_file" "createdomainscript_template" {
  template = file("${path.module}/templates/generate_createdomainscript.sh")
}

data "template_file" "installerscript_template" {
  template = var.create_domain ? file("${path.module}/templates/generate_installerscript.sh") : file("${path.module}/templates/generate_skipinstallerscript.sh")
}

data "template_file" "biconfigcleaner_template" {
  template = file("${path.module}/templates/generate_biconfigcleaner.sh")
}

data "template_file" "cloud_init_file" {
  template = file("${path.module}/cloud_init/cloudinit.template.yaml")

  vars = {
    generate_biconfig_content = base64gzip(join(",\n", data.template_file.biconfig_template.*.rendered))
    admin_user_name =    var.admin_user_name
    admin_password = var.admin_password
    connect_string = var.connect_string
    new_db_admin_username = var.new_db_admin_username
    new_db_password = var.new_db_password
    oas_rcu_schema_prefix = var.oas_rcu_schema_prefix
    oas_rcu_schema_password = var.oas_rcu_schema_password
    generate_firewallportsconfig_content= base64gzip(join(",\n", data.template_file.firewallportsconfig_template.*.rendered))
    generate_firewallportsscript_content= base64gzip(join(",\n", data.template_file.firewallportsscript_template.*.rendered))
    generate_createdomainscript_content= base64gzip(join(",\n", data.template_file.createdomainscript_template.*.rendered))
    generate_installerscript_content= base64gzip(join(",\n", data.template_file.installerscript_template.*.rendered))
    generate_biconfigcleaner_content= base64gzip(join(",\n", data.template_file.biconfigcleaner_template.*.rendered))
    create_domain = var.create_domain
  }
}

data "template_cloudinit_config" "biconfig" {
  gzip          = "true"
  base64_encode = "true"

  part {
    filename     = "biconfig"
    content_type = "text/cloud-config"
    content      = join(",\n", data.template_file.cloud_init_file.*.rendered)
  }
}