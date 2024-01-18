terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"   # Replace with S3 bucket name
    key            = "path/to/terraform.tfstate" # Path to the state file within the bucket
    region         = "us-west-2"                    # AWS region of the S3 bucket
    dynamodb_table = "my-terraform-state-lock"     # DynamoDB table name for state locking
    encrypt        = true
  }
}
