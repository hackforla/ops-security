terraform {
  backend "s3" {
    bucket         = "hfla-ops-terraform-state"
    key            = "hfla-ops-terraform-state/devops-security/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "hfla_ops_terraform_table"
    encrypt        = true
  }
}
