variable "region" {
  description = "The region aws"
  default     = ""
}

variable "project" {
  type        = string
  description = "value of project"
}

variable "domain_name" {
  description = "Domain name of the project."
  type        = string
}

### VPC ###
variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr_block" {
  description = "Public Subnet CIDR Block."
  type        = list(any)
}

variable "private_subnet_cidr_block" {
  description = "Private Subnet CIDR Block."
  type        = list(any)
}

variable "database_subnet_cidr_block" {
  description = "Database Subnet CIDR Block."
  type        = list(any)
}

variable "rds_security_group_cidr_blocks" {
  description = "Public Subnet CIDR Block."
  type        = list(any)
}

### RDS ###
variable "instance_class" {
  description = "The instance class to use."
  default     = ""
}

variable "db_name" {
  description = "The name of the database to create."
  default     = ""
}

variable "username" {
  description = "The username of the database to create."
  default     = ""
}

variable "password" {
  description = "The password of the database to create."
  default     = ""
  sensitive   = true
}

variable "allocated_storage" {
  description = "The allocated storage size for the database."
  default     = ""
}

### SSM Parameter store ###
variable "django_secret_key" {
  description = "Django secret key"
  type        = string
  sensitive   = true
  default     = "django-secret-key"
}

variable "django_admin_email" {
  description = "Django admin email"
  type        = string
  default     = "admin@gmail.com"
}

variable "django_admin_password" {
  description = "Django admin password"
  type        = string
  sensitive   = true
  default     = "admin"
}

variable "cors_allowed_origins" {
  description = "CORS allowed origins"
  type        = list(string)
  default     = ["http://localhost:3000, http://localhost:8000"]
}

variable "allowed_hosts" {
  description = "Allowed hosts"
  type        = list(string)
  default     = ["*"]
}
