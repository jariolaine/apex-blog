# Data sources

## Passwords using random_string
resource "random_string" "adb_wallet_password" {
  length           = 12
  special          = true
  min_upper        = 3
  min_lower        = 3
  min_numeric      = 3
  min_special      = 3
  override_special = "{}#^*<>[]%~"
}

resource "random_string" "adb_admin_password" {
  length           = 12
  special          = true
  min_upper        = 3
  min_lower        = 3
  min_numeric      = 3
  min_special      = 3
  override_special = "{}#^*<>[]%~"
}

resource "random_string" "app_owner_password" {
  length           = 12
  special          = true
  min_upper        = 3
  min_lower        = 3
  min_numeric      = 3
  min_special      = 3
  override_special = "{}#^*<>[]%~"
}

resource "random_string" "apex_user_password" {
  length           = 12
  special          = true
  min_upper        = 3
  min_lower        = 3
  min_numeric      = 3
  min_special      = 3
  override_special = "{}#^*<>[]%~"
}

resource "random_string" "ords_public_user_password" {
  length           = 12
  special          = true
  min_upper        = 3
  min_lower        = 3
  min_numeric      = 3
  min_special      = 3
  override_special = "{}#^*<>[]%~"
}

resource "random_string" "ords_plsql_gateway_password" {
  length           = 12
  special          = true
  min_upper        = 3
  min_lower        = 3
  min_numeric      = 3
  min_special      = 3
  override_special = "{}#^*<>[]%~"
}

## Generate load balancer self signed certificate
# RSA key of size 2048 bits
resource "tls_private_key" "lb_cert_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}
resource "tls_self_signed_cert" "lb_cert" {
  private_key_pem       = tls_private_key.lb_cert_key.private_key_pem
  validity_period_hours = 8760
  ip_addresses          = oci_load_balancer_load_balancer.lb.ip_address_details[*].ip_address
  subject {
    organization  = "APEX Blog demo"
    common_name   = format( "blog-app-%s.nip.io", join( "", formatlist( "%02x", split( ".", lookup(oci_load_balancer_load_balancer.lb.ip_address_details[0], "ip_address" ) ) ) ) )
  }
  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}

## Generate ssh keys to access Compute Nodes, if generate_public_ssh_key=true
resource "tls_private_key" "compute_new_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

## Gets a list of availability domains
data "oci_identity_availability_domains" "ad" {
  compartment_id = var.tenancy_ocid
}

## Gets objectStorage namespace
data "oci_objectstorage_namespace" "user_namespace" {
  compartment_id = var.compartment_ocid
}

## Randoms
resource "random_string" "deploy_id" {
  length  = 4
  special = false
}

## List AD names
locals {
  ads = [
    for ad in data.oci_identity_availability_domains.ad.availability_domains : ad.name
  ]
}

## Names
locals {
  vcn_name            = format( "%s-vcn-%s", var.resources_prefix, random_string.deploy_id.result )
  lb_name             = format( "%s-lb-%s", var.resources_prefix, random_string.deploy_id.result )
  lb_subnet_name      = format( "%s-lb-subnet-%s", var.resources_prefix, random_string.deploy_id.result )
  vm_name             = format( "%s-vm-%s", var.resources_prefix, random_string.deploy_id.result )
  vm_subnet_name      = format( "%s-vm-subnet-%s", var.resources_prefix, random_string.deploy_id.result )
}

## Operating system images
data "oci_core_images" "compute_images" {
  compartment_id           = var.compartment_ocid
  operating_system         = var.image_operating_system
  operating_system_version = var.image_operating_system_version
  shape                    = var.compute_shape
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}

## Template files
locals {

  tomcat_server_xml       = file("${path.module}/templates/tomcat/server.template.xml")
  jk_workers_properties   = file("${path.module}/templates/httpd/workers.template.properties")
  httpd_site_conf         = file("${path.module}/templates/httpd/adb-site.template.conf")
  httpd_cache_disk_conf   = file("${path.module}/templates/httpd/cache_disk.template.conf")
  httpd_deflate_conf      = file("${path.module}/templates/httpd/deflate.template.conf")
  httpd_headers_conf      = file("${path.module}/templates/httpd/headers.template.conf")
  httpd_remoteip_conf     = file("${path.module}/templates/httpd/remoteip.template.conf")
  httpd_apache2_conf      = file("${path.module}/templates/httpd/apache2.template.conf")
  httpd_jk_conf           = file("${path.module}/templates/httpd/jk.template.conf")

  database_setup_template = templatefile("${path.module}/templates/database/database-setup.template.sql", {
    app_owner_name        = upper( var.app_owner_name )
    app_owner_password    = random_string.app_owner_password.result
    apex_username         = upper( var.apex_username )
    apex_user_password    = random_string.apex_user_password.result
    apex_workspace_name   = upper( var.apex_workspace_name )
    apex_image_prefix     = var.apex_image_prefix
  })

}

## Cloud Init
data "cloudinit_config" "nodes" {
  count         = var.compute_count
  gzip          = true
  base64_encode = true
  part {
    filename      = "cloud-config.yml"
    content_type  = "text/cloud-config"
    content       = templatefile( "${path.module}/templates/cloud-config.template.yml", {

      compute_username              = var.compute_username
      ssh_authorized_keys           = var.compute_generate_ssh_key ? tls_private_key.compute_new_ssh_key.public_key_openssh : var.compute_ssh_public_key

      adb_name                      = upper( oci_database_autonomous_database.app_db.db_name )
      adb_base_url                  = trimsuffix( lower( lookup( oci_database_autonomous_database.app_db.connection_urls[0], "apex_url" ) ), "/ords/apex" )
      adb_admin_password            = random_string.adb_admin_password.result
      adb_wallet_url                = oci_objectstorage_preauthrequest.wallet_preauth.full_path

      ords_public_user_password     = random_string.ords_public_user_password.result
      ords_plsql_gateway_password   = random_string.ords_plsql_gateway_password.result

      lb_subnet_cidr                = lookup( var.network_details, "LB-SUBNET-CIDR" )

      tomcat_server_xml_file        = "/etc/tomcat9/server.xml"
      tomcat_server_xml_content     = base64gzip( local.tomcat_server_xml )

      database_setup_file           = "/tmp/database_setup.sql"
      database_setup_content        = base64gzip( local.database_setup_template )

      jk_workers_properties_file    = "/etc/libapache2-mod-jk/workers.properties"
      jk_workers_properties_content = base64gzip( local.jk_workers_properties )

      httpd_jk_conf_file            = "/etc/apache2/mods-available/jk.conf"
      httpd_jk_conf_content         = base64gzip( local.httpd_jk_conf )

      httpd_apache2_conf_file       = "/etc/apache2/apache2.conf"
      httpd_apache2_conf_content    = base64gzip( local.httpd_apache2_conf )

      httpd_site_conf_file          = "/etc/apache2/sites-available/adb-site.conf"
      httpd_site_conf_content       = base64gzip( local.httpd_site_conf )

      httpd_cache_disk_conf_file    = "/etc/apache2/conf-available/cache_disk.conf"
      httpd_cache_disk_conf_content = base64gzip( local.httpd_cache_disk_conf )

      httpd_deflate_conf_file       = "/etc/apache2/conf-available/deflate.conf"
      httpd_deflate_conf_content    = base64gzip( local.httpd_deflate_conf )

      httpd_headers_conf_file       = "/etc/apache2/conf-available/headers.conf"
      httpd_headers_conf_content    = base64gzip( local.httpd_headers_conf )

      httpd_remoteip_conf_file      = "/etc/apache2/conf-available/remoteip.conf"
      httpd_remoteip_conf_content   = base64gzip( local.httpd_remoteip_conf )

      ords_download_url             = "https://download.oracle.com/otn_software/java/ords/ords-latest.zip"
      ords_install_dir              = "/opt/oracle/ords"
      ords_conf_dir                 = "/var/lib/ords"

      jdk_download_url              = "https://download.oracle.com/java/17/latest/jdk-17_linux-aarch64_bin.tar.gz"
      jdk_install_dir               = "/opt/oracle/jdk"

      sqlcl_download_url            = "https://download.oracle.com/otn_software/java/sqldeveloper/sqlcl-latest.zip"
      sqlcl_install_dir             = "/opt/oracle"

      app_download_url              = var.app_download_url
      run_db_setup                  = count.index != 0 ? "false" : "true"

    })
  }
}

## Tags
locals {
  common_tags = {
    Reference = "Created by APEX Blog demo"
  }
}