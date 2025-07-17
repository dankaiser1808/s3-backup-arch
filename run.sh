#!/bin/bash

terraform -chdir=./terraform/arch-backup "$1" -var-file=variables.tfvars
