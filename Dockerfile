FROM hashicorp/terraform:latest
ENV TF_PLUGIN_CACHE_DIR=/.terraform.d/plugin-cache
ENV TF_CLI_CONFIG_FILE=/terraform.rc
RUN mkdir -p ${TF_PLUGIN_CACHE_DIR}
COPY ./terraform.rc /
COPY ./terraform /terraform
RUN terraform init /terraform
WORKDIR /drone/src
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
RUN ls -al $TF_PLUGIN_CACHE_DIR
ENTRYPOINT ["/entrypoint.sh"]