#!/bin/bash
set -euo pipefail

curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
echo "deb https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
apt-get update
apt-get install -y --no-install-recommends docker-ce="5:${DOCKER_VERSION}"* docker-ce-cli="5:${DOCKER_VERSION}"* docker-compose-plugin="${DOCKER_COMPOSE_VERSION}"*
usermod -aG docker ${NON_ROOT_USER}
[[ "$(docker --version)" == *"${DOCKER_VERSION}"* ]]
[[ "$(docker compose version)" == *"${DOCKER_COMPOSE_VERSION}"* ]]
