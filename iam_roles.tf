### Create IAM policy
resource "aws_iam_policy" "policy" {
  name        = "terraform_discover_ec2_policy"
  path        = "/"
  description = "Terraform policy to discover ec2"
  tags = {
    name = "terraform_test"
  }
  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:DescribeInstances",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

### Create IAM role
resource "aws_iam_role" "role" {
  name = "terraform_test_role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
  tags = {
    name = "terraform_test"
  }
}

### Assign policy to the role
resource "aws_iam_role_policy_attachment" "terraform-attach-policy" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn
}
