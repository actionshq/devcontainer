#!/bin/bash
set -euo pipefail

curl -L https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" > /etc/apt/sources.list.d/google-cloud-sdk.list
apt-get update
apt-get -y install --no-install-recommends google-cloud-sdk="${GCLOUD_VERSION}"* google-cloud-sdk-gke-gcloud-auth-plugin="${GCLOUD_VERSION}"*
[[ "$(gcloud version)" == *"${GCLOUD_VERSION}"* ]]
