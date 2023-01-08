#!/bin/bash
set -euo pipefail

curl -LO --output-dir /tmp https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.xz
tar -xf /tmp/node-v${NODE_VERSION}-linux-x64.tar.xz -C /tmp
cp -r /tmp/node-v${NODE_VERSION}-linux-x64/* /usr/local
[[ "$(node -v)" == "v${NODE_VERSION}" ]]
chown -R $NON_ROOT_USER /usr/local/lib/node_modules
