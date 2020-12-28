# Docker Ansible Azure

[![](https://github.com/russmckendrick/docker-ansible-azure/workflows/ansible/badge.svg)](https://github.com/users/russmckendrick/packages/container/package/ansible)

``` bash
docker run -v ${HOME}/.azure:/root/.azure -v ${PWD}:/playbook ghcr.io/russmckendrick/ansible:latest ansible-playbook -i inv site.yml
```

``` bash
docker run -v ${HOME}/.azure:/root/.azure ghcr.io/russmckendrick/ansible:latest az account list
```
