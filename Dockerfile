### Dockerfile
#
#   See https://github.com/russmckendrick/docker-ansible-azure/

FROM alpine:latest

LABEL maintainer="Russ McKendrick <russ@mckendrick.io>"
LABEL org.opencontainers.image.source https://github.com/russmckendrick/docker-ansible-azure/
LABEL org.opencontainers.image.description "Docker Image which runs Ansible, the Azure Collection and the Azure CLI, see the repo for more information"

ENV RELEASEHASH dev

RUN apk update && apk upgrade && \
        apk add bash py3-pip openssh-client && \
        apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python3-dev make && \
        pip --no-cache-dir install -U pip && \
        pip install azure-cli && \
        pip install -r https://raw.githubusercontent.com/ansible-collections/azure/${RELEASEHASH}/requirements-azure.txt && \
        pip install ansible && \
        ansible-galaxy collection install azure.azcollection && \
        ansible-galaxy collection install community.mysql && \
        apk del --purge build && \
        mkdir /playbook

WORKDIR /playbook

CMD [ "ansible-playbook", "--version" ]
