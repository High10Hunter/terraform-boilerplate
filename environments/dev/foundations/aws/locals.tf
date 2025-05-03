locals {
  base_name                       = "${var.project}-${terraform.workspace}"
  database_authentication_enabled = terraform.workspace == "prod" ? true : false
  api_endpoint                    = "api.${var.domain_name}"
}
