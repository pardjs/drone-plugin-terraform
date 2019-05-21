#!/bin/sh

VAR_FILES=${PLUGIN_VAR_FILES:-/drone/src/project-info.json}
ROOT_DIR=${PLUGIN_ROOT_DIR:-/drone/src/terraform}

echo "var files: "$VAR_FILES
echo "root dir: "$ROOT_DIR

terraform init -var-file=$VAR_FILES $ROOT_DIR
terraform apply -auto-approve -var-file=$VAR_FILES $ROOT_DIR
