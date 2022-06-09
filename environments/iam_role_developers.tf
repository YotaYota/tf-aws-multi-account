# +----------------------------------------------------------------------+
# | 'developers' role with trust policy                                  |
# | - Defines ROLE 'developers' (corresponding to GROUP in root account) |
# | - Extends trust to main account to assume this role                  |
# +----------------------------------------------------------------------+

resource "aws_iam_role" "developers" {
  name = "developers"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::944213713097:root"
      },
      "Action": "sts:AssumeRole",
      "Condition": {}
    }
  ]
}
EOF
}

# +---------------------------------------------+
# | Add S3 permissions depending on environment |
# +---------------------------------------------+

# dev permissions
resource "aws_iam_role_policy_attachment" "developer_dev_s3_full" {
  count      = terraform.workspace == "dev" ? 1 : 0
  role       = aws_iam_role.developers.name
  policy_arn = aws_iam_policy.s3_full.arn
}

# prod permissions
resource "aws_iam_role_policy_attachment" "developer_prod_s3_readonly" {
  count      = terraform.workspace == "prod" ? 1 : 0
  role       = aws_iam_role.developers.name
  policy_arn = aws_iam_policy.s3_readonly.arn
}

# +----------------------------+
# | Add List Roles permissions |
# +----------------------------+

# permissions same for all environments
resource "aws_iam_role_policy_attachment" "developer_list_roles" {
  role       = aws_iam_role.developers.name
  policy_arn = aws_iam_policy.list_roles.arn
}

