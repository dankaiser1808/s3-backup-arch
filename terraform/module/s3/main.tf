resource "aws_s3_bucket" "dk-arch-backups" {
    bucket = var.backup-bucket-name
    region = var.region

    tags = {
      Project = var.project
      Environment = var.environment
    }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.dk-arch-backups.id
  versioning_configuration {
    status = var.bucket-versioning-status
  }
}