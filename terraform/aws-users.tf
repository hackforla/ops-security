module "iam_user_gwenstacy" {
  source = "./modules/users"

  user_name = "gwenstacy"
  user_tags = {
    "Environment" = "Development"
    "Project"     = "spiderverse"
  }
  pgp_key = "user_provided_public_key_here"
}

module "iam_user_milesmorales" {
  source = "./modules/users"

  user_name = "miles_morales"
  user_tags = {
    "Environment" = "Production"
    "Project"     = "spiderverse"
  }
  pgp_key = "user_provided_public_key_here"
}