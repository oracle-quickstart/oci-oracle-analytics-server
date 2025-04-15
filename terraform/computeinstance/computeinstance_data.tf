data "template_file" "biconfig_template" {
  template = file("${path.module}/templates/generate_biconfig.sh")
}

data "template_file" "cloud_init_file" {
  template = file("${path.module}/cloud_init/cloudinit.template.yaml")

  vars = {
    generate_biconfig_content = base64gzip(data.template_file.biconfig_template.rendered)
    admin_user_name =    var.admin_user_name
    admin_password = var.admin_password
    connect_string = var.connect_string
    new_db_admin_username = var.new_db_admin_username
    new_db_password = var.new_db_password
    oas_rcu_schema_prefix = var.oas_rcu_schema_prefix
    oas_rcu_schema_password = var.oas_rcu_schema_password
    create_domain = var.create_domain
    firewallportsconfig_content = base64gzip(file("${path.module}/templates/DefaultSingleNodeOASFirewallPorts.xml"))
    firewallportsscript_content = base64gzip(file("${path.module}/templates/open_oas_firewall_ports.sh"))
    createdomainscript_content = base64gzip(file("${path.module}/templates/create_oas_domain.sh"))
    installerscript_content = var.create_domain ? base64gzip(file("${path.module}/templates/oas_installer.sh")) : base64gzip(file("${path.module}/templates/skip_oas_installer.sh"))
    biconfigcleaner_content = base64gzip(file("${path.module}/templates/biconfigcleaner.sh"))
    createDataPartition_content = base64gzip(file("${path.module}/templates/createDataPartition.sh"))
    is_atp_db = var.is_atp_db
    atp_wallet_file_PAR_location = var.is_atp_db ? var.atp_wallet_file_PAR_location : "No wallet file to download"
    prepwallet_content = var.is_atp_db ? base64gzip(file("${path.module}/templates/prepare_atp_wallet.sh")) : base64gzip(file("${path.module}/templates/skip_prepare_atp_wallet.sh"))
    biconfig_db_role = var.is_atp_db ? "NORMAL" : "SYSDBA"
  }
}

data "template_cloudinit_config" "oas_cloud_init" {
  gzip          = "true"
  base64_encode = "true"

  part {
    filename     = "oas-cloud-init.cfg"
    content_type = "text/cloud-config"
    content      = data.template_file.cloud_init_file.rendered
  }
}