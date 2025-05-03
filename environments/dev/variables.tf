variable "region" {
  description = "AWS region"
  default     = ""
}

variable "project" {
  type        = string
  description = "Name of the project"
}

variable "domain_name" {
  type        = string
  description = "Domain name for the project"
}

### S3 state storage ###
variable "backend_bucket_name" {
  type        = string
  description = "Name of the S3 bucket to store the Terraform state file."
}


### VPC ###
variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr_block" {
  description = "Public Subnet CIDR Block."
  default     = []
  type        = list(any)
}

variable "private_subnet_cidr_block" {
  description = "Private Subnet CIDR Block."
  default     = []
  type        = list(any)
}

variable "database_subnet_cidr_block" {
  description = "Database Subnet CIDR Block."
  default     = []
  type        = list(any)
}

variable "rds_security_group_cidr_blocks" {
  description = "Public Subnet CIDR Block."
  default     = []
  type        = list(any)
}

### OIDC ###
variable "repositories" {
  description = "The repositories org."
  default     = []
  type        = list(any)
}

### Billing monitoring ###
variable "monitoring_slack_webhook_url" {
  description = "Slack webhook url for monitoring channel."
  default     = ""
  type        = string
}

### RDS ###
variable "instance_class" {
  description = "Instance class to use."
  default     = ""
}

variable "db_name" {
  description = "Name of the database to create."
  default     = ""
}

variable "username" {
  description = "Username of the database to create."
  default     = ""
}

variable "password" {
  description = "Password of the database to create."
  default     = ""
}

variable "allocated_storage" {
  description = "Allocated storage size for the database."
  default     = ""
}
