variable "project" {
  type        = string
  description = "Name of the project"
}

variable "security_group_ids" {
  description = "List of security group."
  default     = []
  type        = list(any)
}

variable "subnet_ids" {
  description = "List of the subnet."
  default     = []
  type        = list(any)
}

variable "vpc_id" {
  description = "The VPC ID."
  default     = ""
  type        = string
}

variable "acm_certificate_arn" {
  description = "The ARN of ACM certificate."
  default     = ""
  type        = string
}

variable "health_check_path" {
  description = "Health check path."
  default     = ""
  type        = string
}
