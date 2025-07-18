# s3-backup-arch

This project contains the infrastructure configuration and scripts I use to back up my Arch Linux system to S3.

## Prerequisite

Terraform uses an S3 bucket as its backend for storing state. Before applying the configuration, make sure the bucket exists and the IAM permissions are properly set up.

You can source the `functions.sh` script and modify the values as needed to match your setup.

## Final Step

After applying the configuration, make sure to copy the IAM user’s access key and secret key from the Terraform state file. This state is stored in the S3 bucket created by the `create-backend-bucket()` function defined in `functions.sh`.
