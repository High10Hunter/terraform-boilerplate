variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr_block" {
  description = "List of public subnet cidr block"
  type        = list(string)
}

variable "private_subnet_cidr_block" {
  description = "List of private subnet cidr block"
  type        = list(string)
}

variable "database_subnet_cidr_block" {
  description = "List of database subnet cidr block"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of AWS Region Availability Zones."
  type        = list(string)
}

variable "project" {
  type        = string
  description = "value of project"
}
