provider "aws" {
  region = "eu-central-1"
}


module "AWS_secgr" {
  source = "./modules/AWS_secgr/"
}


module "AWS_ec2" {
  source = "./modules/AWS_ec2/"
  ec2_count = var.serv_count
  sec_gr_id = [module.AWS_secgr.secgr_id]
}

module "AWS_elb" {
  source = "./modules/AWS_elb/"
  ec2_count = var.serv_count
  servers = module.AWS_ec2.serv_list
}
