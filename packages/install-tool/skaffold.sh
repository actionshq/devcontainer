#!/bin/bash
set -euo pipefail

curl -Lo /usr/bin/skaffold "https://storage.googleapis.com/skaffold/releases/v${SKAFFOLD_VERSION}/skaffold-linux-amd64"
chmod +x /usr/bin/skaffold
[[ "$(skaffold version)" == "v${SKAFFOLD_VERSION}" ]]
