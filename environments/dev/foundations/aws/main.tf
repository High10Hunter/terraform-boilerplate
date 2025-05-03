### Domain management ### 
resource "aws_route53_zone" "public" {
  name = var.domain_name

  tags = {
    Environment = terraform.workspace
  }
}

### VPC Subnet Internet Gateway ###
module "vpc_subnet_internet_gateway" {
  source = "../../../../modules/aws/vpc-subnet-internet-gateway"

  cidr_block                 = var.cidr_block
  project                    = var.project
  availability_zones         = ["${var.region}a", "${var.region}b", "${var.region}c"]
  public_subnet_cidr_block   = var.public_subnet_cidr_block
  private_subnet_cidr_block  = var.private_subnet_cidr_block
  database_subnet_cidr_block = var.database_subnet_cidr_block
}

### NAT Instance ###
module "nat_instance" {
  source = "../../../../modules/aws/nat-instances"

  name                        = local.base_name
  vpc_id                      = module.vpc_subnet_internet_gateway.vpc_id
  public_subnet               = module.vpc_subnet_internet_gateway.public_subnet_ids[0]
  private_subnets_cidr_blocks = module.vpc_subnet_internet_gateway.private_subnets_cidr_blocks
  private_route_table_ids     = module.vpc_subnet_internet_gateway.private_route_table_ids
  database_route_table_ids    = module.vpc_subnet_internet_gateway.database_route_table_ids
  use_spot_instance           = false
  instance_types              = ["t3.micro"]
}

resource "aws_eip" "nat" {
  network_interface = module.nat_instance.eni_id
}

### Security Groups ###
module "security_group" {
  source = "../../../../modules/aws/security-group"

  project                               = var.project
  vpc_id                                = module.vpc_subnet_internet_gateway.vpc_id
  security_group_http_cidr_blocks       = ["0.0.0.0/0"]
  security_group_http_ipv6_cidr_blocks  = ["::/0"]
  security_group_https_cidr_blocks      = ["0.0.0.0/0"]
  security_group_https_ipv6_cidr_blocks = ["::/0"]
  rds_security_group_cidr_blocks        = var.rds_security_group_cidr_blocks
}

### Database RDS ###
module "database_rds" {
  source                          = "../../../../modules/aws/rds"
  project                         = var.project
  engine                          = "postgres"
  engine_version                  = "16"
  instance_class                  = var.instance_class
  db_name                         = var.db_name
  username                        = var.username
  password                        = var.password
  allocated_storage               = var.allocated_storage
  storage_type                    = "io2"
  database_authentication_enabled = local.database_authentication_enabled || false
  backup_retention_period         = 0
  security_group_ids              = [module.security_group.rds_security_group_id]
  subnet_ids                      = module.vpc_subnet_internet_gateway.database_subnet_ids
}
