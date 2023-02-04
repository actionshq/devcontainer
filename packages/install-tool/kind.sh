#!/bin/bash
set -euo pipefail

curl -Lo /usr/bin/kind "https://github.com/kubernetes-sigs/kind/releases/download/v${KIND_VERSION}/kind-linux-amd64"
chmod +x /usr/bin/kind
[[ "$(kind --version)" == *"${KIND_VERSION}"* ]]
