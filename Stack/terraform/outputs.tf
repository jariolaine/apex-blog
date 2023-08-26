# Result outputs
output "adb_admin_password" {
  value     = random_string.adb_admin_password.result
  sensitive = true
}
output "app_user_password" {
  value     = random_string.app_user_password.result
  sensitive = true
}
output "compute_private_ip" {
  value     = oci_core_instance.web_server.*.private_ip
}
output "compute_display_name" {
  value     = oci_core_instance.web_server.*.display_name
}
output "compute_public_ip" {
  value     = oci_core_instance.web_server.*.public_ip
}
output "app_source_code" {
  value     = "https://github.com/jariolaine/apex-blog"
}
output "app_version" {
  value     = file( "${path.module}/VERSION.txt" )
}
output "adb_version" {
  value     = oci_database_autonomous_database.app_db.db_version
}
output "adb_workload" {
  value     = oci_database_autonomous_database.app_db.db_workload
}
output "adb_is_free_tier" {
  value     = oci_database_autonomous_database.app_db.is_free_tier
}
output "compute_private_key_pem" {
  value     = var.compute_generate_ssh_key ? tls_private_key.compute_new_ssh_key.private_key_pem : "No Keys Auto Generated"
  sensitive = true
}
output "lb_ip" {
  value = oci_load_balancer_load_balancer.lb.ip_address_details[*].ip_address
}
output "app_public_url_button" {
  value = format( "https://blog-app-%s.nip.io/ords/r/blog_app/blog/home", join( "", formatlist( "%02x", split( ".", lookup( oci_load_balancer_load_balancer.lb.ip_address_details[0], "ip_address" ) ) ) ) )
}
