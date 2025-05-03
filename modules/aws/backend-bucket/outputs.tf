output "backend_config" {
  value = {
    bucket_name     = aws_s3_bucket.state_storage.bucket
    role_arn        = aws_iam_role.s3_assume.arn
    lock_table_name = aws_dynamodb_table.tf_remote_state_locking.name
  }
}
