output "id" {
  description = "The ID of the user pool"
  value       = aws_cognito_user_pool.pool.id
}

output "arn" {
  description = "The ARN of the user pool"
  value       = aws_cognito_user_pool.pool.arn
}

output "endpoint" {
  description = "The endpoint of the user pool"
  value       = aws_cognito_user_pool.pool.endpoint
}

output "creation_date" {
  description = "The creation date of the user pool"
  value       = aws_cognito_user_pool.pool.creation_date
}

output "last_modified_date" {
  description = "The last modified date of the user pool"
  value       = aws_cognito_user_pool.pool.last_modified_date
}

output "name" {
  description = "The name of the user pool"
  value       = aws_cognito_user_pool.pool.name
}

output "client_ids" {
  description = "The client IDs of the user pool client app"
  value       = aws_cognito_user_pool_client.client[*].id
}

output "client_secrets" {
  description = "The client secrets of user pool client app"
  value       = aws_cognito_user_pool_client.client[*].client_secret
}
