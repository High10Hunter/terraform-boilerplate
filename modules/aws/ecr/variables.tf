variable "project" {
  type        = string
  description = "Name of the project"
}

variable "repository_name" {
  type        = string
  description = "Name of the repository."
}

variable "mutability" {
  type        = string
  description = "Mutability tag setting for the repository."
}

variable "scan_on_push" {
  description = "Indicates whether images are scanned after being pushed to the repository."
}
