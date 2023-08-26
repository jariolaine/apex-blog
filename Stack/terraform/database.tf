# Autonomous database

## ATP Instance
resource "oci_database_autonomous_database" "app_db" {
  admin_password            = random_string.adb_admin_password.result
  compartment_id            = var.compartment_ocid
  db_name                   = upper( "${var.resources_prefix}db${random_string.deploy_id.result}" )
  db_version                = var.adb_db_version
  db_workload               = var.adb_workload
  display_name              = "${var.resources_prefix}-db-${random_string.deploy_id.result}"
  is_free_tier              = var.adb_is_free_tier
  license_model             = var.adb_license_model
  //cpu_core_count            = var.adb_cpu_count
  //data_storage_size_in_tbs  = var.adb_data_storage_size_in_tbs
  //whitelisted_ips           = []
  //defined_tags              = {}
  freeform_tags             = local.common_tags
}

## DB Wallet
resource "oci_database_autonomous_database_wallet" "app_db_wallet" {
  autonomous_database_id  = oci_database_autonomous_database.app_db.id
  password                = random_string.adb_wallet_password.result
  generate_type           = var.adb_wallet_generate_type
  base64_encode_content   = true
}