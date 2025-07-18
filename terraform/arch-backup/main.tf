

module "iam" {
  source = "../module/iam"
  backup-bucket-name = var.bucket
  backup-user-name = var.backup-user
  project = var.project
  environment = var.environment
}

module "s3" {
  source = "../module/s3"
  backup-bucket-name = var.bucket
  region = var.region
  project = var.project
  environment = var.environment
}