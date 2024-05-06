### Create IAM policy
resource "aws_iam_policy" "wz_worker_policy" {
  name        = "terraform_access_to_s3"
  path        = "/"
  description = "Terraform policy to grant access to s3"
  tags = {
    name = "terraform_test"
  }
  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect : "Allow",
        Action = [
          "s3:GetObject",
          "s3:ListBucket",
          "s3:DeleteObject",
        ]
        Resource = "*"
      },
    ]
  })
}

### Create IAM role
resource "aws_iam_role" "wz_worker_role" {
  name = "wz_worker_role"

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
resource "aws_iam_role_policy_attachment" "terraform-attach-wz-worker-policy" {
  role       = aws_iam_role.wz_worker_role.name
  policy_arn = aws_iam_policy.wz_worker_policy.arn
}
