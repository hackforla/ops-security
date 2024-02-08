# policies/main.tf

resource "aws_iam_policy" "custom_policy" {
  for_each = var.policies

  name        = each.key
  description = each.value["description"]
  policy      = file("${path.module}/policies-json/${each.value["filename"]}")
}
