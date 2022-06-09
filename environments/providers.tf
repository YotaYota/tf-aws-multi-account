# +-------------------------------------+
# | assume_role into target account     |
# |                                     |
# | profile: role in main account       |
# | assume_role: role in target account |
# +-------------------------------------+

provider "aws" {
  region  = var.aws_region
  profile = "<ROLE IN MAIN ACCOUNT>"

  # Note: OrganizationAccountAccessRole is created by default in
	#       AWS Organizations
  assume_role {
    role_arn = "arn:aws:iam::${var.aws_account_id}:role/OrganizationAccountAccessRole"
  }
}
