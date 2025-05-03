output "vpc_id" {
  description = "The VPC ID"
  value       = module.vpc_subnet_internet_gateway.vpc_id
}

output "public_subnet_ids" {
  description = "List public ID of subnet"
  value       = module.vpc_subnet_internet_gateway.public_subnet_ids
}

output "vpc_cidr_block" {
  description = "The VPC cidr block"
  value       = module.vpc_subnet_internet_gateway.vpc_cidr_block
}

output "backend_security_group_id" {
  description = "Backend (ECS) security groups ID"
  value       = module.security_group.backend_security_group_id
}

output "backend_security_group_name" {
  description = "Backend (ECS) security groups name"
  value       = module.security_group.backend_security_group_name
}

output "rds_security_group_id" {
  description = "RDS (database) security groups ID"
  value       = module.security_group.rds_security_group_id
}

output "rds_security_group_name" {
  description = "RDS (database) security groups name"
  value       = module.security_group.rds_security_group_name
}

