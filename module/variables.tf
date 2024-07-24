variable "cidr_block" {
    description = "value for the cidr-block"
    type = string
  
}
variable "Name" {
    description = "Enter the Name for your vpc"
    type = string
  
}
variable "public_sn_cidr_block" {
    description = "value for the public-subnet-cidr-block"
    type = string
  
}
variable "public_sn_Name" {
    description = "value for the public-subnet-Name"
    type = string
  
}
variable "app_sn_cidr_block" {
    description = "value for the app-subnet-cidr-block"
    type = string
  
}
variable "app_sn_Name" {
    description = "value for the app_sn_name"
    type = string
  
}
variable "private_sn_cidr_block" {
    description = "value for the private_sn_cidr_block"
    type = string
  
}
variable "private_sn_Name" {
    description = "value for the private_sn_Name"
    type = string
  
}
variable "vpc_gw_Name" {
    description = "value for the vpc-gateway"
    type = string
  
}
variable "public_rt_Name" {
    description = "Give Name for the public_route-table"
    type = string
}
variable "app_rt_Name" {
    description = "Give Name for the app-route-table"
    type = string
  
}
variable "private_rt_Name" {
    description = "Give Name for the private-route-table"
    type = string
  
}
variable "public_nacl_Name" {
    description = "Enter the name for the public-Nacl"
    type = string
  
}
variable "app_nacl_Name" {
    description = "value for the app-nacl-Name"
    type = string
  
}
variable "private_nacl_Name" {
    description = "value for the private-nacl-Name"
    type = string
  
}
variable "public_sg_Name" {
    description = "value for the public-security-group-Name '22' and '80'"
    type = string
  
}
variable "app_sg_Name" {
    description = "value for the app-security-name '22' and '8080'"
    type = string
  
}
variable "private_sg_Name" {
    description = " value for the private-security-group"
    type = string
  
}