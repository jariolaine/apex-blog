# Application details
output "app_source_code" {
  value     = "https://github.com/jariolaine/apex-blog"
}
output "app_version" {
  value     = file( "${path.module}/VERSION.txt" )
}

# APEX details
output "apex_workspace_name" {
  value     = upper( var.apex_workspace_name )
}
output "apex_username" {
  value     = upper( var.apex_username )
}
output "apex_user_password" {
  value     = random_string.apex_user_password.result
  sensitive = true
}
output "apex_url" {
  value = lower( oci_database_autonomous_database.app_db.connection_urls[0].apex_url )
}

# Database details
output "adb_admin_username" {
  value     = var.adb_admin_user
}
output "adb_admin_password" {
  value     = random_string.adb_admin_password.result
  sensitive = true
}
output "app_owner_name" {
  value     = upper( var.app_owner_name )
}

# Compute details
output "compute_username" {
  value     = var.compute_username
}
output "compute_private_key_pem" {
  value     = var.compute_generate_ssh_key ? tls_private_key.compute_new_ssh_key.private_key_pem : "No Keys Auto Generated"
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


# Load balancer
output "lb_ip" {
  value = oci_load_balancer_load_balancer.lb.ip_address_details[*].ip_address
}

# Button
output "app_public_url_button" {
  value = format( "https://blog-app-%s.nip.io/ords/r/blog_app/blog/home", join( "", formatlist( "%02x", split( ".", lookup( oci_load_balancer_load_balancer.lb.ip_address_details[0], "ip_address" ) ) ) ) )
}
