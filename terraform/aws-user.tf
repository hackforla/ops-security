# Replace USERNAME with your GitHub handle
module "iam_user_bltomlin" {
source = "./modules/aws-users"

user_name = "bltomlin" # Replace with GitHub handle
user_tags = {
  "Project"      = "devops-security"
  "Access Level" = "1"
}
user_groups = ["read-only-group"]
}
