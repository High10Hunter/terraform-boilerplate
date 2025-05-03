# module "github-oidc" {
#   source  = "terraform-module/github-oidc-provider/aws"
#   version = "~> 1"

#   create_oidc_provider = true
#   create_oidc_role     = true

#   repositories              = var.repositories
#   oidc_role_attach_policies = ["arn:aws:iam::aws:policy/AdministratorAccess"]
# }
