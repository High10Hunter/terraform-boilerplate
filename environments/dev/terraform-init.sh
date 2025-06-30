#!/bin/bash

export AWS_PAGER=""

# Function to confirm AWS account
confirm_aws_account() {
  local provided_account_id=$1
  local current_account_id=$(aws sts get-caller-identity --query "Account" --output text)

  if [ "$provided_account_id" != "$current_account_id" ]; then
    echo "Provided AWS account ID ($provided_account_id) does not match the current AWS account ID ($current_account_id)."
    exit 1
  fi
}

# Check if the account ID is passed as an argument
if [ -n "$1" ]; then
  AWS_ACCOUNT_ID=$1
elif [ -z "$AWS_ACCOUNT_ID" ]; then
  read -p "Enter AWS_ACCOUNT_ID: " AWS_ACCOUNT_ID
fi

if [ -z "$AWS_ACCOUNT_ID" ]; then
  echo "AWS_ACCOUNT_ID is required."
  exit 1
fi

# Confirm the AWS account
confirm_aws_account $AWS_ACCOUNT_ID

# Clean up existing Terraform state and lock files
rm -rf .terraform
rm -rf .terraform.tfstate*
rm -f terraform.tfstate.lock.hcl

# Initialize Terraform with account-specific backend configuration
bucket_name="terraform-boilerplate-${AWS_ACCOUNT_ID}-state-bucket"
dynamodb_table="terraform-boilerplate-main-lock-table"
region="us-east-1"

echo "Checking if S3 bucket $bucket_name exists..."
if ! aws s3api head-bucket --bucket "$bucket_name" 2>/dev/null; then
  echo "Bucket does not exist. Creating S3 bucket: $bucket_name"
  if [ "$region" = "us-east-1" ]; then
    aws s3api create-bucket --bucket "$bucket_name" --region "$region"
  else
    aws s3api create-bucket --bucket "$bucket_name" --region "$region" \
      --create-bucket-configuration LocationConstraint="$region"
  fi
fi

echo "Checking if DynamoDB table $dynamodb_table exists..."
if ! aws dynamodb describe-table --table-name "$dynamodb_table" --region "$region" 2>/dev/null; then
  echo "Table does not exist. Creating DynamoDB table: $dynamodb_table"
  aws dynamodb create-table \
    --table-name "$dynamodb_table" \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --region "$region"
  echo "Waiting for DynamoDB table to be active..."
  aws dynamodb wait table-exists --table-name "$dynamodb_table" --region "$region"
fi

echo "Initializing Terraform with backend configuration for bucket: $bucket_name"

terraform init \
  -backend-config="bucket=$bucket_name" \
  -backend-config="key=terraform/terraform.tfstate" \
  -backend-config="region=$region" \
  -backend-config="dynamodb_table=$dynamodb_table" \
  -backend-config="encrypt=true"
