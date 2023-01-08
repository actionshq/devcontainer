#!/bin/bash
set -euo pipefail

SCRIPTS_PATH="$(dirname "$0")"

${SCRIPTS_PATH}/init.sh
${SCRIPTS_PATH}/build.sh
