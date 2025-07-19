

module "iam" {
  source = "../module/iam"
  backup-bucket-name = var.bucket
  backup-user-name = var.backup-user

  #tags
  project = var.project
  environment = var.environment
}

module "s3" {
  source = "../module/s3"
  backup-bucket-name = var.bucket
  region = var.region
  bucket-versioning-status = var.bucket-versioning-status

  #tags
  project = var.project
  environment = var.environment
}
