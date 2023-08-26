# Virtual clod network

resource "oci_core_vcn" "vcn" {
  compartment_id  = var.compartment_ocid
  display_name    = local.vcn_name
  cidr_block      = lookup( var.network_details, "VCN-CIDR" )
  defined_tags    = {}
  freeform_tags   = local.common_tags
}

## Internet gateway for virtual clod network
resource oci_core_internet_gateway"internet_gateway" {
  compartment_id  = var.compartment_ocid
  vcn_id          = oci_core_vcn.vcn.id
  display_name    = format( "Internet Gateway for %s", local.vcn_name )
  defined_tags    = {}
  freeform_tags   = local.common_tags
}

## Default toute table for Virtual clod network
resource "oci_core_default_route_table" "default_route" {
  manage_default_resource_id = oci_core_vcn.vcn.default_route_table_id
  route_rules {
    destination       = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.internet_gateway.id
  }
}

# Security lists

resource "oci_core_security_list" "lb_subnet_security_list" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = format( "Security list for %s", local.lb_subnet_name )
}


# Subnets

## Load balancer subnet
resource "oci_core_subnet" "lb_subnet" {
  cidr_block                  = lookup( var.network_details, "LB-SUBNET-CIDR" )
  display_name                = local.lb_subnet_name
  compartment_id              = var.compartment_ocid
  vcn_id                      = oci_core_vcn.vcn.id
  security_list_ids           = [ oci_core_security_list.lb_subnet_security_list.id ]
  prohibit_public_ip_on_vnic  = false
  defined_tags                = {}
  freeform_tags               = local.common_tags
}

## Compute instance subnet
resource "oci_core_subnet" "compute_subnet" {
  cidr_block                  = lookup( var.network_details, "COMPUTE-SUBNET-CIDR" )
  display_name                = local.vm_subnet_name
  compartment_id              = var.compartment_ocid
  vcn_id                      = oci_core_vcn.vcn.id
  security_list_ids           = [ "${oci_core_vcn.vcn.default_security_list_id}" ]
  prohibit_public_ip_on_vnic  = false
  defined_tags                = {}
  freeform_tags               = local.common_tags
}

# Nework security groups

## Network security group for public load balancer
resource "oci_core_network_security_group" "lb_network_security_group" {
  compartment_id  = var.compartment_ocid
  vcn_id          = oci_core_vcn.vcn.id
  display_name    = format( "lb-nsg-%s", random_string.deploy_id.result )
}

resource "oci_core_network_security_group_security_rule" "lb_nsg_public_ingress_https" {
  network_security_group_id = oci_core_network_security_group.lb_network_security_group.id
  description               = "HTTPS from internet"
  direction                 = "INGRESS"
  stateless                 = true
  protocol                  = "6"
  source_type               = "CIDR_BLOCK"
  source                    = "0.0.0.0/0"
  tcp_options {
    destination_port_range {
      min = "443"
      max = "443"
    }
  }
}

resource "oci_core_network_security_group_security_rule" "lb_nsg_public_egress_https" {
  network_security_group_id = oci_core_network_security_group.lb_network_security_group.id
  description               = "HTTPS to internet"
  direction                 = "EGRESS"
  stateless                 = true
  protocol                  = "6"
  destination_type          = "CIDR_BLOCK"
  destination               = "0.0.0.0/0"
  tcp_options {
    source_port_range {
      min = "443"
      max = "443"
    }
  }
}

resource "oci_core_network_security_group_security_rule" "lb_nsg_vm_ingress" {
  network_security_group_id = oci_core_network_security_group.lb_network_security_group.id
  description               = "HTTP to web server on other subnet"
  direction                 = "INGRESS"
  stateless                 = true
  protocol                  = "6"
  source_type               = "CIDR_BLOCK"
  source                    = lookup( var.network_details, "COMPUTE-SUBNET-CIDR" )
  tcp_options {
    source_port_range {
      min = "80"
      max = "80"
    }
  }
}

resource "oci_core_network_security_group_security_rule" "lb_nsg_vm_egress" {
  network_security_group_id = oci_core_network_security_group.lb_network_security_group.id
  description               = "HTTP from web server on other subnet"
  direction                 = "EGRESS"
  stateless                 = true
  protocol                  = "6"
  destination_type          = "CIDR_BLOCK"
  destination               = lookup( var.network_details, "COMPUTE-SUBNET-CIDR" )
  tcp_options {
    destination_port_range {
      min = "80"
      max = "80"
    }
  }
}

resource "oci_core_network_security_group_security_rule" "lb_nsg_public_ingress_http" {
  network_security_group_id = oci_core_network_security_group.lb_network_security_group.id
  description               = "HTTP from internet"
  direction                 = "INGRESS"
  stateless                 = false
  protocol                  = "6"
  source_type               = "CIDR_BLOCK"
  source                    = "0.0.0.0/0"
  tcp_options {
    destination_port_range {
      min = "80"
      max = "80"
    }
  }
}

## Network security group for compute instance
resource "oci_core_network_security_group" "compute_network_security_group" {
  compartment_id  = var.compartment_ocid
  vcn_id          = oci_core_vcn.vcn.id
  display_name    = format( "compute-nsg-%s", random_string.deploy_id.result )
}

resource "oci_core_network_security_group_security_rule" "compute_nsg_ingress" {
  network_security_group_id = oci_core_network_security_group.compute_network_security_group.id
  description               = "HTTP from load balancer on other subnet"
  direction                 = "INGRESS"
  stateless                 = true
  protocol                  = "6"
  source_type               = "CIDR_BLOCK"
  source                    = lookup( var.network_details, "LB-SUBNET-CIDR" )
  tcp_options {
    destination_port_range {
      min = "80"
      max = "80"
    }
  }
}

resource "oci_core_network_security_group_security_rule" "compute_nsg_egress" {
  network_security_group_id = oci_core_network_security_group.compute_network_security_group.id
  description               = "HTTP to load balancer on other subnet"
  direction                 = "EGRESS"
  stateless                 = true
  protocol                  = "6"
  destination_type          = "CIDR_BLOCK"
  destination               = lookup( var.network_details, "LB-SUBNET-CIDR" )
  tcp_options {
    source_port_range {
      min = "80"
      max = "80"
    }
  }
}
