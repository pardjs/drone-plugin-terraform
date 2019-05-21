FROM hashicorp/terraform:latest
RUN mkdir /var/terraform-module
COPY ./terraform /terraform
RUN pwd
RUN terraform init /terraform
WORKDIR /drone/src
COPY ./entrypoint.sh ./entrypoint.sh
ENTRYPOINT './entrypoint.sh'