#!/bin/bash
set -euo pipefail

gh auth token | docker login ghcr.io -u oauth --password-stdin
