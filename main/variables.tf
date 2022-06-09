# Main account id
variable "aws_account_id" {
  type = string
}

variable "aws_region" {
  type = string
}

# Map terraform workspace name to corresponding account id
variable "aws_account_ids" {
  type = map(any)
}

