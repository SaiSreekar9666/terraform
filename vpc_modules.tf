module "vpc" {
  source = "./module"

  
  cidr_block                  = "10.0.0.0/16"
  Name                        = "lms-vpc"
  public_sn_cidr_block        = "10.0.1.0/24"
  app_sn_cidr_block           = "10.0.4.0/24"
  private_sn_cidr_block       = "10.0.2.0/24"
  public_sn_Name              = "lms_public_sn"
  app_sn_Name                 = "app-sn-Name"
  private_sn_Name             =  "lms_private_sn"
  vpc_gw_Name                 = "lms-gw-name"
  public_rt_Name              = "lms_public_rt"
  app_rt_Name                 = "lms-app-rt"
  private_rt_Name             = "lms_private_rt"
  public_nacl_Name            = "lms_public_nacl"
  private_nacl_Name           = "lms_private_nacl"
  app_nacl_Name               = "lms_app_nacl"
  private_sg_Name             = "lms-private-sg"
  public_sg_Name              = "lms-public-sg"
  app_sg_Name                 = "lms-app-sg"

}

  
