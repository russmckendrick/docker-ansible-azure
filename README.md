# Docker Ansible Azure

[![](https://github.com/russmckendrick/docker-ansible-azure/workflows/ansible/badge.svg)](https://github.com/users/russmckendrick/packages/container/package/ansible)

``` bash
docker run \
    -v ${HOME}/.azure:/root/.azure \
    -v ${PWD}:/playbook \
    ghcr.io/russmckendrick/ansible:latest \
    ansible-playbook -i inv site.yml
```

``` bash
docker run \
    -v ${HOME}/.ssh:/root/.ssh \
    -v ${HOME}/.azure:/root/.azure -v ${PWD}:/playbook \
    -e ANSIBLE_HOST_KEY_CHECKING=False \
    ghcr.io/russmckendrick/ansible:latest \
    ansible-playbook -i inv site.yml
```

``` bash
docker run \
    -v ${PWD}:/playbook \
    --env-file ./azurecreds \
    ghcr.io/russmckendrick/ansible:latest \
    nsible-playbook -i inv site.yml
```

``` bash
docker run \
    -v ${HOME}/.ssh:/root/.ssh \
    -v ${PWD}:/playbook \
    --env-file ./azurecreds \
    -e ANSIBLE_HOST_KEY_CHECKING=False \
    ghcr.io/russmckendrick/ansible:latest \
    nsible-playbook -i inv site.yml
```

``` bash
docker run \
    -v ${HOME}/.azure:/root/.azure \
    ghcr.io/russmckendrick/ansible:latest \
    az account list
```

