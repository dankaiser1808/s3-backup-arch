resource "aws_s3_bucket" "dk-arch-backups" {
    bucket = var.backup-bucket-name
    region = var.region
}