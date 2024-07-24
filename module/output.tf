output "cidr_block" {
    value = var.cidr_block
    description = "value of the vpc-cidr-block"
  
}
output "Name" {
    value = var.Name
    description = " value of the vpc-name"
  
}
output "public_subnet_cidr_block" {
    value = var.app_sn_cidr_block
    description = "value for the public-sn-cidr-block"
  
}
output "public_subnet_Name" {
    value = var.public_sn_Name
    description = "value for the public-subnet-name"
  
}
output "app_subnet_Name" {
    value = var.app_sn_Name
    description = "value for the app-sn-Name"
  
}
output "private_sn_Name" {
    value = var.private_sn_Name
    description = "value for the private-sn-name"  
}
output "public_sn_cidr_block" {
    value = var.public_sn_cidr_block
    description = "value of the public-sn-cidr-block"
  
}
output "app_sn_cidr_block" {
    value = var.app_sn_cidr_block
    description = "value for the app-sn-cidr-block"
  
}
output "vpc_gw_Name" {
    value = var.vpc_gw_Name
    description = "value of the gateway-name"
  
}
output "public_rt_Name" {
    value = var.public_rt_Name
    description = "value of the public-route-table-name"
  
}
output "app_rt_Name" {
    value = var.app_rt_Name
    description = "value of the app-route-table-name"
  
}
output "private_rt_Name" {
    value = var.private_rt_Name
    description = "value of the private-route-table-name"
  
}
output "public_nacl_Name" {
    value = var.public_nacl_Name
    description = "value of the public-Nacl-name"
}
output "app_nacl_Name" {
    value = var.app_nacl_Name
    description = "value of the app-nacl-name"
  
}
output "private_nacl_Name" {
    value = var.private_nacl_Name
    description = "value for the private-nacl-name"
  
}