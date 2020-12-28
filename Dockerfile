### Dockerfile
#
#   See https://github.com/russmckendrick/docker

FROM alpine:latest

LABEL maintainer="Russ McKendrick <russ@mckendrick.io>"
LABEL org.opencontainers.image.source https://github.com/russmckendrick/docker-ansible-azure/
LABEL org.opencontainers.image.description "Docker Image which runs Ansible, the Azure Ansible community modules and the Azure CLI"
LABEL org.opencontainers.image.url https://www.mediaglasses.blog/

RUN apk update && apk upgrade && \
        apk add bash py3-pip && \
        apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python3-dev make && \
        pip --no-cache-dir install -U pip && \
        pip install azure-cli && \
        pip install -r https://raw.githubusercontent.com/ansible-collections/azure/dev/requirements-azure.txt && \
        pip install ansible && \
        ansible-galaxy collection install azure.azcollection && \
        apk del --purge build && \
        mkdir /playbook

WORKDIR /playbook

CMD [ "ansible-playbook", "--version" ]