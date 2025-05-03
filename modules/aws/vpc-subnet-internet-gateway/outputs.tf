output "vpc_id" {
  description = "The VPC ID"
  value       = aws_vpc.vpc.id
}

output "public_subnet_ids" {
  description = "List ID of subnet"
  value       = aws_subnet.public.*.id
}

output "private_subnet_ids" {
  description = "List ID of subnet"
  value       = aws_subnet.private.*.id
}

output "database_subnet_ids" {
  description = "List ID of subnet"
  value       = aws_subnet.database.*.id
}

output "vpc_cidr_block" {
  description = "The VPC cidr block"
  value       = aws_vpc.vpc.cidr_block
}

output "private_subnets_cidr_blocks" {
  description = "List of private subnets cidr blocks"
  value       = aws_subnet.private.*.cidr_block
}

output "private_route_table_ids" {
  description = "List of private route table IDs"
  value       = aws_route_table.private.*.id
}

output "database_route_table_ids" {
  description = "List of database route table IDs"
  value       = aws_route_table.database.*.id
}
