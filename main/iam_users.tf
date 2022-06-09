# +---------------------------------+
# | IAM Users and group memberships |
# +---------------------------------+

resource "aws_iam_user" "alice" {
  name = "alice"
  path = "/users/"
}

resource "aws_iam_user_group_membership" "alice_developers" {
  user = aws_iam_user.alice.name

  groups = [
    aws_iam_group.developers.name
  ]
}

resource "aws_iam_user" "bob" {
  name = "bob"
  path = "/users/"
}

resource "aws_iam_user_group_membership" "bob_developers" {
  user = aws_iam_user.bob.name

  groups = [
    aws_iam_group.developers.name
  ]
}

