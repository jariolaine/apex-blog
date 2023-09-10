# Variables

## General
variable "tenancy_ocid" {}
variable "region" {}
variable "compartment_ocid" {}

variable "resources_prefix" {
  default = "blog"
}

## Network Details
variable "network_details" {
  type      = map( string )
  nullable  = false
  default   = {
    "VCN-CIDR"                  = "10.1.0.0/16"
    "COMPUTE-SUBNET-CIDR"       = "10.1.21.0/24"
    "LB-SUBNET-CIDR"            = "10.1.22.0/24"
  }
}

## Compute
variable "compute_username" {
  default = ""
}
variable "compute_count" {
  default = 1
}
variable "compute_generate_ssh_key" {
  default = false
}
variable "compute_ssh_public_key" {
  default = ""
}
variable "image_operating_system" {
  default = "Canonical Ubuntu"
}
variable "compute_advanced_options" {
  default = false
}
variable "compute_ad" {
  default = " "
}
variable "compute_shape" {
  default = "VM.Standard.A1.Flex"
}
variable "compute_memory_gbs" {
  default = 6
}
variable "compute_cpu_count" {
  default = 1
}
variable "image_operating_system_version" {
  default = "22.04"
}

## Autonomous Database
variable "adb_admin_user"{
  default = "ADMIN"
}

variable "app_owner_name" {
  default = "WKSP_BLOG_APP"
}
variable "apex_workspace_name" {
  default = "BLOG_APP"
}
variable "apex_username" {
  default = ""
}
variable "adb_advanced_options" {
  default = false
}
variable "apex_image_prefix" {
  default = ""
}
variable "adb_db_version" {
  default = "19c"
}
variable "adb_workload" {
  default = "OLTP"
}
variable "adb_license_model" {
  default = "LICENSE_INCLUDED"
}
variable "adb_is_free_tier" {
  default = true
}
variable "adb_cpu_count" {
  default = 1
}
variable "adb_data_storage_size_in_tbs" {
  default = 1
}
variable "adb_visibility" {
  default = "Public"
}
variable "adb_wallet_generate_type" {
  default = "SINGLE"
}
## Application
variable app_download_url {
  default = "https://github.com/jariolaine/apex-blog/releases/latest/download/apex-blog-latest.zip"
}
