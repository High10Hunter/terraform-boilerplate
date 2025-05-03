### Django configs ###
resource "aws_ssm_parameter" "django_secret_key" {
  description = "Django secret key"
  name        = "/${terraform.workspace}/${var.project}_DJANGO_SECRET_KEY"
  type        = "SecureString"
  value       = var.django_secret_key

  lifecycle {
    ignore_changes = [value]
  }
}

resource "aws_ssm_parameter" "django_admin_email" {
  description = "Django admin email"
  name        = "/${terraform.workspace}/${var.project}_ADMIN_EMAIL"
  type        = "String"
  value       = var.django_admin_email

  lifecycle {
    ignore_changes = [value]
  }
}

resource "aws_ssm_parameter" "django_admin_password" {
  description = "Django admin password"
  name        = "/${terraform.workspace}/${var.project}_ADMIN_PASSWORD"
  type        = "SecureString"
  value       = var.django_admin_password

  lifecycle {
    ignore_changes = [value]
  }
}

### Host configs ###
resource "aws_ssm_parameter" "domain_name" {
  description = "Backend API domain"
  name        = "/${terraform.workspace}/${var.project}_HOST"
  type        = "String"
  value       = "https://${local.api_endpoint}/"
}

resource "aws_ssm_parameter" "cors_allowed_origins" {
  description = "CORS allowed origins"
  name        = "/${terraform.workspace}/${var.project}_CORS_ALLOWED_ORIGINS"
  type        = "StringList"
  value       = join(",", var.cors_allowed_origins)

  lifecycle {
    ignore_changes = [value]
  }
}

resource "aws_ssm_parameter" "allowed_hosts" {
  description = "Allowed hosts"
  name        = "/${terraform.workspace}/${var.project}_ALLOWED_HOSTS"
  type        = "StringList"
  value       = join(",", var.allowed_hosts)

  lifecycle {
    ignore_changes = [value]
  }
}

### Database enviroments ###
resource "aws_ssm_parameter" "db_host" {
  description = "Database host"
  name        = "/${terraform.workspace}/${var.project}_DB_HOST"
  type        = "String"
  value       = module.database_rds.hostname
}

resource "aws_ssm_parameter" "db_username" {
  description = "Dabase username"
  name        = "/${terraform.workspace}/${var.project}_DB_USERNAME"
  type        = "String"
  value       = module.database_rds.username
}

resource "aws_ssm_parameter" "db_password" {
  description = "Database password"
  name        = "/${terraform.workspace}/${var.project}_DB_PASSWORD"
  type        = "SecureString"
  value       = module.database_rds.password
}

resource "aws_ssm_parameter" "db_port" {
  description = "Database port"
  name        = "/${terraform.workspace}/${var.project}_DB_PORT"
  type        = "String"
  value       = module.database_rds.port
}

resource "aws_ssm_parameter" "db_name" {
  description = "Database name"
  name        = "/${terraform.workspace}/${var.project}_DB_NAME"
  type        = "String"
  value       = module.database_rds.name
}
