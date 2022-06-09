resource "aws_iam_policy" "list_roles" {
  name        = "list_iam_roles"
  path        = "/"
  description = "IAM List Roles access policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "iam:ListRoles",
        "iam:GetRole"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:iam::${var.aws_account_id}:role/",
        "arn:aws:iam::${var.aws_account_id}:role/*"
      ]
    },
    {
      "Action": [
        "iam:ListPolicies",
        "iam:ListRolePolicies",
        "iam:ListAttachedRolePolicies",
        "iam:GetPolicyVersion"
      ],
      "Effect": "Allow",
      "Resource": [
        "*"
      ]
    }
  ]
}
EOF
}
