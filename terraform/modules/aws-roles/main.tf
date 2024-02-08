# roles/main.tf

resource "aws_iam_role" "iam_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = var.assume_role_principal
        },
      },
    ],
  })
}

# Attaching a policy to the role
resource "aws_iam_role_policy_attachment" "role_policy_attachment" {
  role       = aws_iam_role.iam_role.name
  policy_arn = var.policy_arn
}
