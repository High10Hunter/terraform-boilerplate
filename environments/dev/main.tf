### AWS resources ###
data "aws_caller_identity" "current" {}

module "aws_foundations" {
  source                         = "./foundations/aws"
  project                        = var.project
  region                         = var.region
  domain_name                    = var.domain_name
  cidr_block                     = var.cidr_block
  public_subnet_cidr_block       = var.public_subnet_cidr_block
  private_subnet_cidr_block      = var.private_subnet_cidr_block
  database_subnet_cidr_block     = var.database_subnet_cidr_block
  rds_security_group_cidr_blocks = var.rds_security_group_cidr_blocks
  instance_class                 = var.instance_class
  db_name                        = var.db_name
  username                       = var.username
  password                       = var.password
  allocated_storage              = var.allocated_storage
}

module "aws_functionalities" {
  source      = "./functionalities/aws"
  project     = var.project
  region      = var.region
  domain_name = var.domain_name
  account_id  = data.aws_caller_identity.current.account_id

  depends_on = [module.aws_foundations]
}
