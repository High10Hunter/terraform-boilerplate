resource "aws_cognito_identity_provider" "identity_provider" {
  count         = length(var.identity_providers)
  user_pool_id  = aws_cognito_user_pool.pool.id
  provider_name = lookup(element(var.identity_providers, count.index), "provider_name")
  provider_type = lookup(element(var.identity_providers, count.index), "provider_type")

  attribute_mapping = lookup(element(var.identity_providers, count.index), "attribute_mapping", {})
  idp_identifiers   = lookup(element(var.identity_providers, count.index), "idp_identifiers", [])
  provider_details  = lookup(element(var.identity_providers, count.index), "provider_details", {})
}
