#!/bin/bash
set -euo pipefail

TAG=$(git describe --tags --dirty --always)
BASE_IMAGE="ghcr.io/actionshq/devcontainer"

docker push "${BASE_IMAGE}:${TAG}"
docker tag "${BASE_IMAGE}:${TAG}" "${BASE_IMAGE}:latest"
docker push "${BASE_IMAGE}:latest"
