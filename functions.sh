#!/bin/bash

BACKEND_BUCKET_NAME="dk-arch-backup-tf-state"

create-backend-bucket() {
    if command -v aws >/dev/null 2>&1; then
        aws s3api create-bucket --bucket "$BACKEND_BUCKET_NAME"
    else
        echo "AWS CLI not installed."
    fi
}

tf() {
    terraform -chdir=./terraform/arch-backup "$1" -var-file=variables.tfvars
}
