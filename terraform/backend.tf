terraform {
  backend "s3" {
    bucket         = "hfla-ops-terraform-state"          # Replace with S3 bucket name
    key            = "devops-security/terraform.tfstate" # Path to the state file within the bucket
    region         = "us-west-2"                         # AWS region of the S3 bucket
    dynamodb_table = "hfla_ops_terraform_table"          # DynamoDB table name for state locking
    encrypt        = true
  }
}
