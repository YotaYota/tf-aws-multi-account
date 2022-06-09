# +----------------------+
# | IAM developers group |
# +----------------------+

resource "aws_iam_group" "developers" {
  name = "developers"
  path = "/"
}

# For assuming roles in other sub-accounts
resource "aws_iam_group_policy_attachment" "assume_developer_role" {
  count = length(aws_iam_policy.assume_env_developer_role)
  group = aws_iam_group.developers.name

  # element(list, index) retrieves a single item from a list
  policy_arn = element(aws_iam_policy.assume_env_developer_role.*.arn, count.index)
}

