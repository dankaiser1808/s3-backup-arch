
resource "aws_iam_user" "dk-arch-restic-user" {
    name = var.backup-user-name
}

resource "aws_iam_access_key" "dk-arch-restic-key" {
  user = aws_iam_user.dk-arch-restic-user.name
}

resource "aws_iam_policy" "dk-arch-restic-policy" {
    name = "dk_arch_restic_policy"
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = [
                    "s3:DeleteObject",
                    "s3:GetObject",
                    "s3:PutObject"
                ]
                Effect = "Allow"
                Resource = "arn:aws:s3:::${var.backup-bucket-name}/*"
            },
            {
                Action = [
                    "s3:ListBucket",
                    "s3:GetBucketLocation"
                ]
                Effect = "Allow"
                Resource = "arn:aws:s3:::${var.backup-bucket-name}"
            }
        ]
    })

}

resource "aws_iam_user_policy_attachment" "dk-arch-restic-user-policy-attachement" {
    policy_arn = aws_iam_policy.dk-arch-restic-policy.arn
    user = aws_iam_user.dk-arch-restic-user.name
}