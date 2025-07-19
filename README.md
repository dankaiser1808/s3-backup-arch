# s3-backup-arch

This project contains the infrastructure configuration and scripts for backing up my Arch Linux system to S3, along with the restic and systemd backup scripts.

Make sure to check out my [Substack post](https://dakaiser.substack.com/p/restic-system-backup) about this example project for detailed implementation notes and best practices.

## Prerequisites

Terraform uses an S3 bucket as its backend for storing state. Before applying the configuration, ensure the bucket exists and the IAM permissions are properly configured.

You can source the `functions.sh` script and modify the values as needed to match your specific setup requirements.

## Final Steps

After applying the Terraform configuration, copy the IAM user's access key and secret key from the Terraform state file. This state is stored in the S3 bucket created by the `create-backend-bucket()` function defined in `functions.sh`.

Remember to securely store these credentials and consider using a secrets management solution for production environments.