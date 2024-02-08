# groups/main.tf

resource "aws_iam_group" "group" {
  name = var.group_name
  path = var.group_path
}

resource "aws_iam_group_policy_attachment" "group_policy_attachment" {
  for_each   = toset(var.policy_arn)
  group      = aws_iam_group.group.name
  policy_arn = each.value
}
