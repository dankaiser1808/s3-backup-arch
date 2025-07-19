#!/bin/bash

BACKEND_BUCKET_NAME="dk-arch-backup-tf-state-test"
REGION="us-east-1"
BUCKET_VERSIONING="Enabled"

create-backend-bucket() {
    if command -v aws >/dev/null 2>&1; then
        aws s3api create-bucket --bucket "$BACKEND_BUCKET_NAME" --region "$REGION"
        aws s3api put-bucket-versioning --bucket "$BACKEND_BUCKET_NAME" --versioning-configuration Status="$BUCKET_VERSIONING"
    else
        echo "AWS CLI not installed."
    fi
}

tf() {
    terraform -chdir=./terraform/arch-backup "$1" -var-file=variables.tfvars
}
