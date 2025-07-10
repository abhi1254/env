variable "nicname" {}
variable "resource_group_name" {}
variable "location" {}
variable "vmname" {}
variable "public_ip_name" {}
variable "subnet_id" {}
variable "vmadminusername" {}
variable "vmpassword" {
  sensitive = true
}


