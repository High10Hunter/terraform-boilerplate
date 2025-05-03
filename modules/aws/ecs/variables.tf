variable "project" {
  type        = string
  description = "value of project"
}

variable "repository_url" {
  description = "The ECR Repository URL"
  type        = string
}

variable "aws_lb_target_group_arn" {
  description = "The ALB Target group ARN"
  type        = string
  default     = ""
}

variable "container_port" {
  description = "The ECS service container port"
  type        = string
}

variable "subnet_ids" {
  description = "The list of subnet."
  type        = list(any)
}

variable "security_group_ids" {
  description = "The list of security group."
  type        = list(any)
}

variable "cloudwatch_log_group_name" {
  description = "Name of CloudWatch Log group."
  type        = string
}

variable "region" {
  description = "The region aws"
  type        = string
}

variable "ecs_backend_cluster" {
  type        = string
  description = "ECS cluster Id"
}

variable "ecs_backend_cluster_name" {
  type        = string
  description = "ECS cluster name"
}

variable "ecs_task_role_name" {
  type        = string
  description = "ECS task role name"
}

variable "ecs_task_policy_name" {
  type        = string
  description = "ECS task policy name"
}

variable "cpu" {
  type        = number
  description = "CPU run task"
}

variable "memory" {
  type        = number
  description = "memory run task"
}

variable "max_capacity" {
  type        = number
  description = "Maximum scale task"
}

variable "target_value_memory_scaling" {
  type        = number
  description = "Target value for memory scaling policy"
  default     = 80
}

variable "scale_out_cooldown_memory" {
  type        = number
  description = "Cooldown time for scale out memory"
  default     = 100
}

variable "scale_in_cooldown_memory" {
  type        = number
  description = "Cooldown time for scale in memory"
  default     = 50
}

variable "target_value_cpu_scaling" {
  type        = number
  description = "Target value for cpu scaling policy"
  default     = 60
}

variable "scale_out_cooldown_cpu" {
  type        = number
  description = "Cooldown time for scale out cpu"
  default     = 100
}

variable "scale_in_cooldown_cpu" {
  type        = number
  description = "Cooldown time for scale in cpu"
  default     = 50
}

variable "task_definition_name" {
  type        = string
  description = "The name task definition"
}

variable "backend_service_name" {
  type        = string
  description = "The name task definition"
}

variable "container_name" {
  type        = string
  description = "The container name"
}
