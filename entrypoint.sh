VAR_FILES=${PLUGIN_VAR_FILES:-./project-info.json}
ROOT_DIR=${PLUGIN_ROOT_DIR:-./terraform}

echo "var files: "$VAR_FILES
echo "root dir: "$ROOT_DIR

terraform init -var-file=$VAR_FILES $ROOT_DIR
terraform apply -var-file=$VAR_FILES $ROOT_DIR
