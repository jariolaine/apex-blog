# Compute instances

## Web servers
resource "oci_core_instance" "web_server" {
  count 							= var.compute_count
  compartment_id 			= var.compartment_ocid
  display_name				= "${local.vm_name}-${count.index + 1}"
  shape 							= var.compute_shape
  availability_domain	= var.compute_ad == " " ? element(local.ads, count.index) : var.compute_ad
  agent_config {
		is_management_disabled = "false"
		is_monitoring_disabled = "false"
		plugins_config {
			desired_state = "DISABLED"
			name 					= "Vulnerability Scanning"
		}
		plugins_config {
			desired_state	= "ENABLED"
			name					= "Compute Instance Monitoring"
		}
		plugins_config {
			desired_state = "ENABLED"
			name					= "Bastion"
		}
	}
	availability_config {
		recovery_action = "RESTORE_INSTANCE"
	}
	create_vnic_details {
		assign_private_dns_record = "true"
		assign_public_ip					= "true"
		subnet_id 								= oci_core_subnet.compute_subnet.id
    nsg_ids = [
      oci_core_network_security_group.compute_network_security_group.id,
    ]
	}
	instance_options {
		are_legacy_imds_endpoints_disabled = "true"
	}
	metadata = {
		user_data	= data.cloudinit_config.nodes.*.rendered[count.index]
	}
	shape_config {
		memory_in_gbs	= var.compute_memory_gbs
		ocpus 				= var.compute_cpu_count
	}
	source_details {
		source_id		= lookup(data.oci_core_images.compute_images.images[0], "id")
		source_type = "image"
	}
  defined_tags	= {}
  freeform_tags = local.common_tags
  depends_on 		= [
		oci_database_autonomous_database_wallet.app_db_wallet,
		oci_objectstorage_preauthrequest.wallet_preauth,
  ]
}
