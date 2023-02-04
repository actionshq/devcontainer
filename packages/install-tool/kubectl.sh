#!/bin/bash
set -euo pipefail

curl -Lo /usr/bin/kubectl "https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl"
chmod +x /usr/bin/kubectl
[[ "$(kubectl version --client --short)" == *"v${KUBECTL_VERSION}"* ]]
